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
        Story(type: .success, mainTitle: "", subTitle: "", imageName: "AppLogo", content: "상식 빵! 눈치 빵!\n\n연애까지 빵?!", buttonContent: "시작하기")
    
    private let contentLabel: UILabel = {
        let content = UILabel(frame: CGRect(x: 0, y: 0, width: 400, height: 200))
        content.textColor = .black
        content.numberOfLines = 0
        content.textAlignment = .center
        
        return content
    }()
    
    private let mainImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        
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
        startButton.addTarget(self, action: #selector(moveNext), for: .touchUpInside)
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
    @objc func moveNext() {
        let vc = PrologViewController()
        vc.stageNum = stageNum
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    // Constraints
    private func setConstraints(story: Story) {
        
        mainImage.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.bottom.equalToSuperview().multipliedBy(0.311)
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(mainImage.snp.width).multipliedBy(0.2647)
            
        }
        
        contentLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.bottom.equalToSuperview().multipliedBy(0.542)
            
        }
        
        startButton.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.bottom.equalToSuperview().multipliedBy(0.835)
            make.width.equalToSuperview().multipliedBy(0.89)
            make.height.equalTo(continueButton.snp.width).multipliedBy(0.16)
        }
        continueButton.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.bottom.equalToSuperview().multipliedBy(0.92)
            make.width.equalToSuperview().multipliedBy(0.89)
            make.height.equalTo(continueButton.snp.width).multipliedBy(0.16)
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

