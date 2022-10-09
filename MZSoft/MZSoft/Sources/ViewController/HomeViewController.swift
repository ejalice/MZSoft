//
//  HomeViewController.swift
//  MZSoft
//
//  Created by MBSoo on 2022/10/09.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {

    private let mainTitle: UILabel = {
        let title = UILabel()
        title.text = "야무지네"
        title.textColor = .black
        
        return title
    }()
    
    private let mainImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "person.fill.questionmark")
        
        return imageView
    }()
    
    private let startButton: UIButton = {
        let button = UIButton()
        button.setTitle("시작하기", for: .normal)
        button.titleLabel?.textColor = .white
        button.backgroundColor = .black
        button.layer.cornerRadius = 8
        
        return button
    }()
    
    private let continueButton: UIButton = {
        let button = UIButton()
        button.setTitle("이어하기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(mainTitle)
        self.view.addSubview(mainImage)
        self.view.addSubview(startButton)
        self.view.addSubview(continueButton)
        
        mainTitle.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.centerY.equalTo(self.view.snp.top).offset(115)
        }
        
        mainImage.snp.makeConstraints { make in
            make.center.equalTo(self.view)
            make.height.width.equalTo(326)
        }
        
        startButton.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.42)
            make.height.equalTo(56)
            make.centerX.equalTo(self.view).offset(-120)
            make.left.equalToSuperview().offset(20)
            make.centerY.equalTo(self.view.snp.bottom).offset(-163)
            
        }
        
        continueButton.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.42)
            make.height.equalTo(56)
            make.right.equalToSuperview().offset(-20)
            make.centerX.equalTo(self.view).offset(120)
            make.centerY.equalTo(self.view.snp.bottom).offset(-163)
        }
        
        startButton.addTarget(self, action: #selector(pushNavigation), for: .touchUpInside)
    }

    @objc func pushNavigation() {
//        self.navigationController?.pushViewController(SecondViewController(), animated: true)
    }

}
