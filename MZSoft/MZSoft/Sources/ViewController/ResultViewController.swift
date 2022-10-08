//
//  ResultViewController.swift
//  MZSoft
//
//  Created by eunji on 2022/10/08.
//

import UIKit
import SnapKit

class ResultViewController: UIViewController {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "응애(엔딩타이틀)"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private let middleView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 2
        return view
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "aliceProfile")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        
        return imageView
    }()
    
    private let imageLabel: UILabel = {
        let label = UILabel()
        label.text = "응 -- 애"
        label.font = UIFont.systemFont(ofSize: 17)
        label.textAlignment = .center
        
        return label
    }()
    
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.text = "썸녀를 엄마로\n만들어 버렸습니다."
        label.font = UIFont.systemFont(ofSize: 17)
        label.numberOfLines = 0
        label.textAlignment = .center
 
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("HOME/NEXT", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
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
        [titleLabel,
         middleView, imageView, imageLabel,
         contentLabel,
         button].forEach { self.view.addSubview($0) }
        
        setConstraints()
    }
    
    // Constraints
    private func setConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.top.equalToSuperview().inset(112)
        }
        
        middleView.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.top.equalTo(titleLabel.snp.bottom).offset(27)
            make.width.equalToSuperview().multipliedBy(0.72) // 282/390
            make.height.equalTo(middleView.snp.width)
            
        }
        
        imageView.snp.makeConstraints { make in
            make.edges.equalTo(middleView)
        }
        
        imageLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.bottom.equalTo(middleView.snp.bottom).offset(-49)
        }
        
        contentLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.top.equalTo(middleView.snp.bottom).offset(44)
        }
        
        button.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.bottom.equalToSuperview().inset(50)
            make.width.equalToSuperview().multipliedBy(0.8) // 350/390
            make.height.equalTo(button.snp.width).multipliedBy(0.16) // 350/56
        }
    }
    
}


