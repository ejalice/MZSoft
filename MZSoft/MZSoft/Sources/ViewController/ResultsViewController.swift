//
//  ResultsViewController.swift
//  MZSoft
//
//  Created by eunji on 2022/10/09.
//

import UIKit
import SnapKit
import Lottie
import Gifu

class ResultsViewController: UIViewController {
    let device = UIScreen.getDevice()
    var storyContent: Story!
    
    private let mainTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .appDefaultFont(size: 36)
        label.textColor = .appTintColor1
        label.textAlignment = .center
        return label
    }()
    
    private var imageView: UIImageView = {
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
        
        configure(story: storyContent)
        configureLabel(story: storyContent)
        setConstraints(story: storyContent)
        buttonConfigure(story: storyContent)
    }
    
    private func buttonConfigure(story: Story) {
        switch story.type {
        case .success:
            button.addTarget(self, action: #selector(moveToNext), for: .touchUpInside)
            
        case .prolog:
            button.addTarget(self, action: #selector(startnext), for: .touchUpInside)
            
        case .ending:
            button.addTarget(self, action: #selector(moveToHome), for: .touchUpInside)

        default:
            button.addTarget(self, action: #selector(moveToHome), for: .touchUpInside)
        }
    }
    
    @objc func startnext() {
        print("START")
    }
    
    @objc func moveToNext() {
        var stageNum = UserDefaults.standard.integer(forKey: "stage")
        var vc: UIViewController!
        if stageNum == 0 {
            vc = PrologViewController()
            let vc2 = vc as! PrologViewController
            UserDefaults.standard.set(1, forKey: "stage")
            stageNum = UserDefaults.standard.integer(forKey: "stage")
            vc2.stageNum = stageNum
            vc = vc2
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        } else {
            vc = ResultsViewController()
            let vc2 = vc as! ResultsViewController
            vc2.storyContent = Story.story[6]
            vc = vc2
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: false)
        }
    }
    
    @objc func moveToHome(){
        let vc = HomeViewController()
        UserDefaults.standard.set(0, forKey: "stage")
        
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
    }
    
    private func configure(story: Story) {
        if story.imageName == "ending" {
            DispatchQueue.main.async {
                self.imageView.image = UIImage(named: story.imageName)
            }
        } else {
            imageView.image = UIImage(named: story.imageName)
        }
        mainTitleLabel.text = story.mainTitle
        subTitleLabel.text = story.subTitle
        contentLabel.text = story.content
        button.setTitle(story.buttonContent, for: .normal)
    }
    
    private func configureLabel(story: Story) {
        self.contentLabel.text = story.content
        
        var image: UIImage!
        
        switch story.type {

        case .failTwo:
            self.contentLabel.textColor = .appTextColor2
            image = UIImage(named: "messageLeft")
            image.resizableImage(withCapInsets: device.messageEdgeInset, resizingMode: .stretch)
            backgroundImageView.image = image
            
            backgroundImageView.snp.makeConstraints { make in
                make.top.equalTo(imageView.snp.bottom).multipliedBy(1.063)
                make.centerX.equalTo(self.view)
                make.width.equalTo(contentLabel.intrinsicContentSize.width + 34)
                make.height.equalTo(contentLabel.intrinsicContentSize.height + 51)
            }
            contentLabel.snp.makeConstraints { make in
                make.centerX.equalTo(self.view)
                make.top.equalTo(imageView.snp.bottom).multipliedBy(1.063)

            }
        default:
            print("")
            
        }


    }
    
    // Constraints
    private func setConstraints(story: Story) {
        mainTitleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.bottom.equalToSuperview().multipliedBy(0.175)
        }
        
        subTitleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.bottom.equalToSuperview().multipliedBy(0.21)
        }
        
        imageView.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.top.equalTo(subTitleLabel.snp.bottom).multipliedBy(1.28)
            make.width.equalToSuperview().multipliedBy(0.72) // 282/390
            make.height.equalTo(imageView.snp.width)
            
            switch story.type {
            case .success:
                imageView.layer.borderColor = UIColor.white.cgColor
                imageView.layer.borderWidth = 2
                imageView.layer.cornerRadius = 8
            default:
                print("")
            }
        }
        
        contentLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            switch story.type {
            case .failTwo:
                make.top.equalTo(imageView.snp.bottom).multipliedBy(1.095)
            default:
                make.top.equalTo(imageView.snp.bottom).multipliedBy(1.063)
            }
        }
        
        button.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.bottom.equalToSuperview().multipliedBy(0.94)
            
            make.width.equalToSuperview().multipliedBy(0.89) // 350/390
            make.height.equalTo(button.snp.width).multipliedBy(0.16) // 350/56
        }
        
    }
    
}
