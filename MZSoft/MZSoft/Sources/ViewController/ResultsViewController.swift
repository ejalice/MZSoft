//
//  ResultsViewController.swift
//  MZSoft
//
//  Created by eunji on 2022/10/09.
//

import UIKit
import SnapKit

class ResultsViewController: UIViewController {
    let device = UIScreen.getDevice()
    
//    var storyContent: [Story] = [
//        Story(type: .success, mainTitle: "성공", subTitle: "", imageName: "aliceProfile", content: "썸녀가 호감을 보입니다", buttonContent: "다음"),
//        Story(type: .failOne, mainTitle: "GAME OVER", subTitle: "<응애>", imageName: "aliceProfile", content: "썸녀를 엄마로\n만들어 버렸습니다.", buttonContent: "홈으로"),
//        Story(type: .failTwo, mainTitle: "GAME OVER", subTitle: "<어떻게>", imageName: "aliceProfile", content: "니 맞춤법이 더 어.떻.게 ^^", buttonContent: "홈으로")
//   , ]
    
    var storyContent: Story!
    
    private let mainTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .appDefaultFont(size: 36)
        label.textColor = .appTintColor1
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
        label.font = .appDefaultFont(size: 25)
        label.textColor = .appTintColor1
        label.textAlignment = .center
        
        return label
    }()
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView(image: nil)
        
        return imageView
    }()
    
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.font = .appDefaultFont(size: 17)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
 
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = .appDefaultFont(size: 17)
        button.setTitleColor(.appTextColor2, for: .normal)
        button.backgroundColor = .appTintColor1
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .appBackgroundColor1
        
        // View SetUp
        [mainTitleLabel,
         imageView, subTitleLabel,
         backgroundImageView, contentLabel,
         button].forEach { self.view.addSubview($0) }
        
        configure(story: Story.story[1])
        configure(story: Story.story[1])
        configureLabel(story: Story.story[1])
        setConstraints(story: Story.story[1])
        buttonConfigure(story: Story.story[1])
        

    }
    
    private func buttonConfigure(story: Story) {
        switch story.type {
        case .success:
            button.addTarget(self, action: #selector(moveToNext), for: .touchUpInside)
            
        case .prolog:
            button.addTarget(self, action: #selector(startnext), for: .touchUpInside)
            
        default:
            button.addTarget(self, action: #selector(moveToHome), for: .touchUpInside)
        }
    }
    
    @objc func startnext() {
        print("START")
    }
    
    @objc func moveToNext(){
        print("NEXT")
    }
    
    @objc func moveToHome(){
        print("HOME")
    }
    
    private func configure(story: Story) {
        mainTitleLabel.text = story.mainTitle
        imageView.image = UIImage(named: story.imageName)
        subTitleLabel.text = story.subTitle
        contentLabel.text = story.content
        button.setTitle(story.buttonContent, for: .normal)
    }
    
    private func configureLabel(story: Story) {
        self.contentLabel.text = story.content
        
        var image: UIImage!
        
        switch story.type {

        case .failTwo:
            self.imageView.layer.borderWidth = 2
            self.imageView.layer.borderColor = UIColor.white.cgColor
            
            self.contentLabel.textColor = .appTextColor2
            image = UIImage(named: "messageLeft")
            image.resizableImage(withCapInsets: device.messageEdgeInset, resizingMode: .stretch)
            backgroundImageView.image = image
            
            backgroundImageView.snp.makeConstraints { make in
                make.top.equalTo(imageView.snp.bottom).offset(54)
                make.width.equalTo(contentLabel.intrinsicContentSize.width + 34)
                make.height.equalTo(contentLabel.intrinsicContentSize.height + 51)
            }
            contentLabel.snp.makeConstraints { make in
                make.centerX.equalTo(backgroundImageView.snp.centerX)
                make.top.equalTo(backgroundImageView.snp.top).offset(19)
            }
        default:
            print("")
            
        }


    }
    
    // Constraints
    private func setConstraints(story: Story) {
        mainTitleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.top.equalToSuperview().inset(112) // 390/112
        }
        
        subTitleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.top.equalTo(mainTitleLabel.snp.bottom).offset(12)
        }
        
        imageView.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.top.equalTo(subTitleLabel.snp.bottom).offset(47)
            make.width.equalToSuperview().multipliedBy(0.72) // 282/390
            make.height.equalTo(imageView.snp.width)
            
        }
        
        contentLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            switch story.type {
            case .failTwo:
                make.top.equalTo(imageView.snp.bottom).offset(54)
            default:
//                make.top.equalTo(imageView.snp.bottom).offset(35)
                make.top.equalTo(imageView.snp.bottom).multipliedBy(1.12) //282:35

            }
            
        }
        
        button.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.bottom.equalToSuperview().multipliedBy(0.94)
            
            make.width.equalToSuperview().multipliedBy(0.8) // 350/390
            make.height.equalTo(button.snp.width).multipliedBy(0.16) // 350/56
        }
        
    }
    
}
