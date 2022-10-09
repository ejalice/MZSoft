//
//  HomeViewController.swift
//  MZSoft
//
//  Created by MBSoo on 2022/10/09.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {

    var stageNum: Int = 0
    var storyContent: Story =
        Story(type: .success, mainTitle: "", subTitle: "", imageName: "aliceProfile", content: "무식도 논란이 되는 시대!\n어쩌구저쩌구...\n연애에 성공할 수 있을까?!", buttonContent: "시작하기")
    
    private let contentLabel: UILabel = {
        let content = UILabel(frame: CGRect(x: 0, y: 0, width: 400, height: 200))
        content.textColor = .black
        content.numberOfLines = 0
        content.textAlignment = .center
        
        return content
    }()
    
    private let mainImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    private let startButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.textColor = .white
        button.backgroundColor = .black
        button.layer.cornerRadius = 8
        
        return button
    }()
    
    private let continueButton: UIButton = {
        let button = UIButton()
        button.setTitle("이어하기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        
        return button
    }()
    
//    let emptyView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if UserDefaults.standard.dictionaryRepresentation().keys.contains("stage") {
            stageNum = UserDefaults.standard.integer(forKey: "stage")
        } else {
            UserDefaults.standard.set(0, forKey: "stage")
        }
        self.view.backgroundColor = .appTintColor1
//        self.view.addSubview(emptyView)
        self.view.addSubview(contentLabel)
        self.view.addSubview(mainImage)
        self.view.addSubview(startButton)
        self.view.addSubview(continueButton)
        
        
        configure(story: storyContent)
        setConstraints(story: storyContent)
        startButton.addTarget(self, action: #selector(pushNavigation), for: .touchUpInside)
    }
    
    private func configure(story: Story) {
        contentLabel.text = story.content
        mainImage.image = UIImage(named: story.imageName)
        startButton.setTitle(story.buttonContent, for: .normal)
        contentLabel.font = .appDefaultFont(size: 20)
        startButton.titleLabel?.font = .appDefaultFont(size: 17)
        continueButton.titleLabel?.font = .appDefaultFont(size: 17)
        continueButton.titleLabel?.textColor = .black
        let gradient = getGradientLayer(bounds: contentLabel.bounds)
        contentLabel.textColor = gradientColor(bounds: contentLabel.bounds, gradientLayer: gradient)
    }
        @objc func pushNavigation() {
            let vc = PrologViewController()
            vc.stageNum = stageNum
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
    
    // Constraints
    private func setConstraints(story: Story) {
        
        mainImage.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.view.snp.top).offset(128)
            make.width.equalToSuperview().multipliedBy(0.72) // 282/390
            make.height.equalTo(mainImage.snp.width)
            
        }
        
        contentLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.top.equalTo(mainImage.snp.bottom).offset(129)
            
        }
        
        startButton.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.bottom.equalToSuperview().inset(106)
            make.width.equalToSuperview().multipliedBy(0.8) // 350/390
            make.height.equalTo(startButton.snp.width).multipliedBy(0.16) // 350/56
        }
        continueButton.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.top.equalTo(startButton.snp.bottom).offset(15)
            make.width.equalToSuperview().multipliedBy(0.8) // 350/390
            make.height.equalTo(startButton.snp.width).multipliedBy(0.16) // 350/56
        }
    }
    func getGradientLayer(bounds : CGRect) -> CAGradientLayer{
        // 다른 Gradient를 사용하려면 아래의 Colors를 바꾸면 됩니다~
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        //order of gradient colors
        gradient.colors = [UIColor.black.cgColor, UIColor.brown.cgColor]
        // start and end points
        gradient.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.5, y: 0.5)
        return gradient
    }
    
    func gradientColor(bounds: CGRect, gradientLayer :CAGradientLayer) -> UIColor? {
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
          //create UIImage by rendering gradient layer.
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
          //get gradient UIcolor from gradient UIImage
        return UIColor(patternImage: image!)
    }

}

