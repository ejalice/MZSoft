//
//  ViewController.swift
//  MZSoft
//
//  Created by κΉμν on 2022/10/07.
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let vc = HomeViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
    }
    
    private func configureContraints() {
        label.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

}

