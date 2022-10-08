//
//  ResultViewController.swift
//  MZSoft
//
//  Created by eunji on 2022/10/08.
//

import UIKit
import SnapKit

class ResultViewController: UIViewController {
    
    var storyContent: [StoryContent] = [StoryContent(mainTitle: "응애(엔딩 타이틀)", subTitle: "응 -- 애", imageName: "aliceProfile", content: "썸녀를 엄마로\n만들어 버렸습니다.", buttonContent: "HOME")]
    
    private let mainTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        
        return imageView
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textAlignment = .center
        
        return label
    }()
    
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.numberOfLines = 0
        label.textAlignment = .center
 
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
//        button.setTitle("", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 8
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        // View SetUp
        [mainTitleLabel,
         imageView, subTitleLabel,
         contentLabel,
         button].forEach { self.view.addSubview($0) }
        
        configure()
        setConstraints()
    }
    
    private func configure() {
        mainTitleLabel.text = storyContent[0].mainTitle
        imageView.image = UIImage(named: storyContent[0].imageName)
        subTitleLabel.text = storyContent[0].subTitle
        contentLabel.text = storyContent[0].content
        button.setTitle(storyContent[0].buttonContent, for: .normal)
    }
    
    // Constraints
    private func setConstraints() {
        mainTitleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.top.equalToSuperview().inset(112)
        }
        
        imageView.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.top.equalTo(mainTitleLabel.snp.bottom).offset(27)
            make.width.equalToSuperview().multipliedBy(0.72) // 282/390
            make.height.equalTo(imageView.snp.width)
            
        }
        
        subTitleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.bottom.equalTo(imageView.snp.bottom).offset(-49)
        }
        
        contentLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.top.equalTo(imageView.snp.bottom).offset(44)
        }
        
        button.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.bottom.equalToSuperview().inset(50)
            make.width.equalToSuperview().multipliedBy(0.8) // 350/390
            make.height.equalTo(button.snp.width).multipliedBy(0.16) // 350/56
        }
    }
    
}


