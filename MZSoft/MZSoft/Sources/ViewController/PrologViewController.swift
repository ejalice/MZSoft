//
//  PrologViewController.swift
//  MZSoft
//
//  Created by MBSoo on 2022/10/09.
//

import UIKit




class PrologViewController: UIViewController {

    var storyContent: [Story] = [
        Story(type: .prolog, mainTitle: "Stage 1", subTitle: "썸녀를 만나다", imageName: "aliceProfile", content: "23년차 모쏠 인생..\n드디어 썸녀가 생겼다.\n\n\n.\n.\n.\n\n이번에는 잘해봐야지!", buttonContent: "시작"), Story(type: .prolog, mainTitle: "Stage 2", subTitle: "고백 해도 될까?", imageName: "aliceProfile", content: "썸을 탄 지 2주..\n이제는 때가 됐다.\n\n그녀가\n나의 것이 될 때..\n.\n.\n.\n", buttonContent: "시작")]
    
    private let blackView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private let homeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "house.circle.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 35)), for: .normal)
        button.tintColor = .appTintColor1
        
        button.clipsToBounds = true
        
        return button
    }()
    
    private let MainTitleLabel: UILabel = {
        let title = UILabel()
        title.textColor = .appTintColor1
        title.textAlignment = .center
        
        return title
    }()
    
    private let subTitleLabel: UILabel = {
        let title = UILabel()
        title.textColor = .appTintColor1
        title.textAlignment = .center
        
        return title
    }()
    
    private let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private let contentLabel: UILabel = {
        let content = UILabel()
        content.textAlignment = .center
        content.numberOfLines = 0
        
        return content
    }()
    
    private let startButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.textColor = .white
        button.backgroundColor = .black
        button.layer.cornerRadius = 8
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .appTintColor1
        self.view.addSubview(blackView)
        
        blackView.addSubview(MainTitleLabel)
        blackView.addSubview(subTitleLabel)
        blackView.addSubview(homeButton)
        
        self.view.addSubview(mainImageView)
        self.view.addSubview(contentLabel)
        self.view.addSubview(startButton)
        
        configure(story: storyContent[1])
        setConstratins(story: storyContent[1])
        // Do any additional setup after loading the view.
    }
    // TODO: 두 번째 때 색깔 바꿔야함
    private func configure(story: Story) {
        MainTitleLabel.text = story.mainTitle
        MainTitleLabel.font = .appDefaultFont(size: 30)
        mainImageView.image = UIImage(named: story.imageName)
        subTitleLabel.text = story.subTitle
        subTitleLabel.font = .appDefaultFont(size: 15)
        contentLabel.text = story.content
        startButton.setTitle(story.buttonContent, for: .normal)
        
        let stringValue = story.content

        let attributedString: NSMutableAttributedString = NSMutableAttributedString(string: stringValue)
        attributedString.setColorForText(textForAttribute: "썸을 탄 지 2주..\n이제는 ", withColor: UIColor.black)
        attributedString.setColorForText(textForAttribute: "때", withColor: UIColor.red)
        attributedString.setColorForText(textForAttribute: "가 됐다.\n\n그녀가\n나의 것이 될", withColor: UIColor.black)
        attributedString.setColorForText(textForAttribute: " 때", withColor: UIColor.red)
        attributedString.setColorForText(textForAttribute: "..\n.\n.\n.\n", withColor: UIColor.black)
        contentLabel.font = .appDefaultFont(size: 17)

        contentLabel.attributedText = attributedString
        
        startButton.addTarget(self, action: #selector(moveToHome), for: .touchUpInside)
    }

    private func setConstratins(story: Story) {
        blackView.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.view)
            make.width.equalTo(self.view)
            make.height.equalTo(123)
        }
        MainTitleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(blackView)
            make.top.equalToSuperview().offset(57)
        }
        subTitleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(blackView)
            make.top.equalTo(MainTitleLabel.snp.bottom).offset(4)
        }
        homeButton.snp.makeConstraints { make in
            make.width.height.equalTo(35)
            make.top.equalToSuperview().offset(68)
            make.right.equalTo(self.view.snp.right).offset(-20)
//            make.bottom.equalTo(self.blackView.snp.bottom).offset(-24)
        }
        mainImageView.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.view).offset(176)
            make.width.height.equalTo(282)
        }
        contentLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.top.equalTo(mainImageView.snp.bottom).offset(45)
        }
        startButton.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.top.equalTo(contentLabel.snp.bottom).offset(86)
            make.width.equalToSuperview().multipliedBy(0.8) // 350/390
            make.height.equalTo(startButton.snp.width).multipliedBy(0.16) // 350/56
        }
    }
    
    @objc func moveToHome() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    // TODO: 데이터 넘겨주는 로직 짜야함 
    @objc func moveToNext() {
//        self.navigationController?.pushViewController(<#T##viewController: UIViewController##UIViewController#>, animated: <#T##Bool#>)
    }

}

extension NSMutableAttributedString {
    
    func setColorForText(textForAttribute: String, withColor color: UIColor) {
        let range: NSRange = self.mutableString.range(of: textForAttribute, options: .caseInsensitive)
        
        
        self.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
        
    }
}