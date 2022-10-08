//
//  MessageViewController.swift
//  MZSoft
//
//  Created by 김상현 on 2022/10/08.
//

import SnapKit
import UIKit

class HalfMessageViewController: UIViewController {
    let device = UIScreen.getDevice()
    var messageData: [Message] = [Message(type: .male, content: "어제 용오름 야무지더라 ㅎㅎ"), Message(type: .female, content: "아.. 맞아 ㅎㅎ.."), Message(type: .female, content: "그래서인지 열이 조금 나네?")]

    private lazy var borderView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.appBorderColor1.cgColor
        
        return view
    }()
    
    private lazy var messageHeaderLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.text = "iMessage \n 3월 28일 (월) 오전 2:01"
        label.textColor = UIColor.appTextColor1
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var messageCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect(), collectionViewLayout: layout)
        collectionView.register(MessageCollectionViewCell.self, forCellWithReuseIdentifier: "MessageCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        
        return collectionView
    }()
    
    private lazy var messageFooterView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.appBorderColor1.cgColor
        
        return view
    }()
    
    private lazy var selectButton1: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.appBorderColor1.cgColor
        button.setTitle("헐 어떡해 ㅠㅠ 빨리 나아...", for: .normal)
        button.backgroundColor = .appBackgroundColor2

        return button
    }()
    
    private lazy var selectButton2: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.appBorderColor1.cgColor
        button.setTitle("헐 어떻게 ㅠㅠ 빨리 낳아...", for: .normal)
        button.backgroundColor = .appBackgroundColor2

        return button
    }()
    
    private lazy var selectButton3: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.appBorderColor1.cgColor
        button.setTitle("헐 어떡해 ㅠㅠ 빨리 낳아...", for: .normal)
        button.backgroundColor = .appBackgroundColor2

        return button
    }()
    
    private lazy var selectButton4: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.appBorderColor1.cgColor
        button.setTitle("헐 어떻게 ㅠㅠ 빨리 나아...", for: .normal)
        button.isUserInteractionEnabled = false
        button.backgroundColor = .appBackgroundColor2
        
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        DispatchQueue.main.async {
            self.configureUI()
            self.configureButtonUI()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.showCell(row: 0)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            self.showCell(row: 1)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            self.showCell(row: 2)
        }
        
    }
    
    private func configureUI() {
        [borderView].forEach{
            view.addSubview($0)
        }
       
        [messageHeaderLabel, messageCollectionView, messageFooterView].forEach{
            borderView.addSubview($0)
        }

        borderView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(device.defaultPadding)
            make.horizontalEdges.equalToSuperview().inset(device.horizontalPadding)
            make.height.equalToSuperview().multipliedBy(0.6)
        }
        
        messageHeaderLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(device.verticalPadding)
            make.height.equalTo(messageHeaderLabel.intrinsicContentSize)
            make.horizontalEdges.equalToSuperview()
        }
        
        messageCollectionView.snp.makeConstraints { make in
            make.top.equalTo(messageHeaderLabel.snp.bottom).offset(device.verticalSpacing)
            make.bottom.equalTo(messageFooterView.snp.top).offset(device.verticalSpacing)
            make.horizontalEdges.equalToSuperview().inset(device.horizontalPadding)
        }
        
        messageFooterView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(device.verticalPadding)
            make.horizontalEdges.equalToSuperview().inset(device.horizontalPadding)
            make.height.equalTo(device.textBoxHeight)
        }

    }
    
    private func configureButtonUI() {
        [selectButton1, selectButton2, selectButton3, selectButton4].forEach{
            view.addSubview($0)
        }

        selectButton1.snp.makeConstraints { make in
            make.top.equalTo(borderView.snp.bottom).offset(device.verticalPadding)
            make.horizontalEdges.equalToSuperview().inset(device.horizontalPadding)
        }
        selectButton2.snp.makeConstraints { make in
            make.top.equalTo(selectButton1.snp.bottom).offset(device.verticalSpacing)
            make.horizontalEdges.equalToSuperview().inset(device.horizontalPadding)
        }
        selectButton3.snp.makeConstraints { make in
            make.top.equalTo(selectButton2.snp.bottom).offset(device.verticalSpacing)
            make.horizontalEdges.equalToSuperview().inset(device.horizontalPadding)
        }
        selectButton4.snp.makeConstraints { make in            make.top.equalTo(selectButton3.snp.bottom).offset(device.verticalSpacing)
            make.horizontalEdges.equalToSuperview().inset(device.horizontalPadding)
        }
    }
    private func showCell(row: Int) {
        let cell = messageCollectionView.cellForItem(at: IndexPath(row: row, section: 0))
        cell?.alpha = 1
    }
    
}

extension HalfMessageViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messageData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = messageCollectionView.dequeueReusableCell(withReuseIdentifier: "MessageCollectionViewCell", for: indexPath) as? MessageCollectionViewCell else { return UICollectionViewCell() }
        DispatchQueue.main.async {
            cell.alpha = 0
            cell.configureUI(message: self.messageData[indexPath.row])
        }
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height = width * (53/232)
        // 232:53
        // 232:41
        return CGSize(width: width, height: height)
    }
}

class MessageCollectionViewCell: UICollectionViewCell {
    let device = UIScreen.getDevice()
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView(image: nil)
        
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configureUI(message: Message) {
        [backgroundImageView, label].forEach {
            contentView.addSubview($0)
        }
        self.label.text = message.content
        var image: UIImage!
        
        switch message.type {
        case .male:
            image = UIImage(named: "messageRight")
            image.resizableImage(withCapInsets: device.messageEdgeInset, resizingMode: .stretch)
            backgroundImageView.image = image
            backgroundImageView.snp.makeConstraints { make in
                make.top.trailing.equalToSuperview()
                make.width.equalTo(label.intrinsicContentSize.width + 32)
            }
            label.snp.makeConstraints { make in
                make.centerX.equalTo(backgroundImageView.snp.centerX)
                make.top.equalTo(backgroundImageView.snp.top).offset(13)
            }
            
        case .female:
            image = UIImage(named: "messageLeft")
            image.resizableImage(withCapInsets: device.messageEdgeInset, resizingMode: .stretch)
            backgroundImageView.image = image
            backgroundImageView.snp.makeConstraints { make in
                make.top.leading.equalToSuperview()
                make.width.equalTo(label.intrinsicContentSize.width + 32)
            }
            label.snp.makeConstraints { make in
                make.centerX.equalTo(backgroundImageView.snp.centerX)
                make.top.equalTo(backgroundImageView.snp.top).offset(13)
            }
        }
    }
}
