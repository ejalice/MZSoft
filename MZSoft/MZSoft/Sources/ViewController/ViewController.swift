//
//  ViewController.swift
//  MZSoft
//
//  Created by 김상현 on 2022/10/07.
//
import SnapKit
import UIKit

class ViewController: UIViewController {

    let label: UILabel = {
        let label = UILabel()
        label.text = "Hello World!"
        label.textAlignment = .center
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        configureContraints()
    }
    
    private func configureContraints() {
        label.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

}

