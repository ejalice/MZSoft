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
    var selectedButtonNumber: Int? = nil
    private lazy var borderView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var dateLeftBorderView: UIView = {
        let view = UIView()
        view.backgroundColor = .appTintColor1
        
        return view
    }()
    
    private lazy var dateRightBorderView: UIView = {
        let view = UIView()
        view.backgroundColor = .appTintColor1
        
        return view
    }()
    
    private lazy var messageHeaderLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.text = "9월 19일 (월) 오후 7:01"
        label.textColor = UIColor.appTintColor1
        label.textAlignment = .center
        label.font = .appDefaultFont(size: 10)
        
        return label
    }()
    
    private lazy var messageCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect(), collectionViewLayout: layout)
        collectionView.backgroundColor = .appBackgroundColor1
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
    
    private lazy var horizontalBar: UIView = {
        let view = UIView()
        view.backgroundColor = .appTintColor1

        return view
    }()
    
    private lazy var chatLabel: UILabel = {
        let label = UILabel()
        label.textColor = .appTextColor1
        label.font = .appDefaultFont(size: 15)
        
        return label
    }()
    
    private lazy var sendButton: UIButton = {
        let button = UIButton()
        let buttonImage = UIImage(systemName: "arrow.up.circle")
        buttonImage?.withTintColor(.appTextColor1, renderingMode: .alwaysTemplate)
        button.setPreferredSymbolConfiguration(.init(pointSize: 30, weight: .regular, scale: .default), forImageIn: .normal)
        button.setImage(buttonImage, for: .normal)
        button.tintColor = .appTextColor1
        button.alpha = 0
        button.isUserInteractionEnabled = false
        
        return button
    }()
    
    private lazy var selectButton1: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.setTitle("헐 어떡해 ㅠㅠ 빨리 나아...", for: .normal)
        button.backgroundColor = .appBackgroundColor3
        button.titleLabel?.font = .appDefaultFont(size: 17)
        button.titleLabel?.textColor = .appBackgroundColor3
        button.titleLabel?.alpha = 0

        return button
    }()
    
    private lazy var selectButton2: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.setTitle("헐 어떻게 ㅠㅠ 빨리 낳아...", for: .normal)
        button.backgroundColor = .appBackgroundColor3
        button.titleLabel?.font = .appDefaultFont(size: 17)
        button.titleLabel?.textColor = .appBackgroundColor3
        button.titleLabel?.alpha = 0

        return button
    }()
    
    private lazy var selectButton3: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.setTitle("헐 어떡해 ㅠㅠ 빨리 낳아...", for: .normal)
        button.backgroundColor = .appBackgroundColor3
        button.titleLabel?.font = .appDefaultFont(size: 17)
        button.titleLabel?.alpha = 0

        return button
    }()
    
    private lazy var selectButton4: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.setTitle("헐 어떻게 ㅠㅠ 빨리 나아...", for: .normal)
        button.isUserInteractionEnabled = false
        button.backgroundColor = .appBackgroundColor3
        button.titleLabel?.font = .appDefaultFont(size: 17)
        button.titleLabel?.alpha = 0

        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .appBackgroundColor1
        
        self.sendButton.addTarget(self, action: #selector(onTapSendButton), for: .touchUpInside)
        self.selectButton1.addTarget(self, action: #selector(onTapSelectButton1), for: .touchUpInside)
        self.selectButton2.addTarget(self, action: #selector(onTapSelectButton2), for: .touchUpInside)
        self.selectButton3.addTarget(self, action: #selector(onTapSelectButton3), for: .touchUpInside)
        self.selectButton4.addTarget(self, action: #selector(onTapSelectButton4), for: .touchUpInside)

        DispatchQueue.main.async {
            self.configureUI()
            self.configureButtonUI()
            
            UIView.animate(withDuration: 0.5, delay: 0, options: [.repeat, .autoreverse]) {
                self.horizontalBar.alpha = 0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.showCell(row: 0)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.showCell(row: 1)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.5) {
            self.showCell(row: 2)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            self.chatLabel.text = ""
            var charIndex = 0.0
            let titleText = "썸녀가 아프다. 뭐라고 해야 하지?"
            for letter in titleText {
                Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { timer in
                    self.chatLabel.text?.append(letter)
                }
                charIndex += 1
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 8.5) { [self] in
            [self.selectButton1, self.selectButton2, self.selectButton3, self.selectButton4, self.sendButton].enumerated().forEach{ offset, selectButton in
                UIView.animate(withDuration: 0.5, delay: Double(offset) * 0.12) {
                    selectButton.titleLabel?.alpha = 1
                    selectButton.alpha = 1
                }
                selectButton.isUserInteractionEnabled = true
            }
        }

    }
    
    @objc private func onTapSendButton() {
        let vc = ResultsViewController()
        if selectedButtonNumber == 1 {
            vc.storyContent = Story.story[0]
        } else if selectedButtonNumber == 2 || selectedButtonNumber == 3 {
            vc.storyContent = Story.story[2]
        } else {
            vc.storyContent = Story.story[3]
        }
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
    }
    
    @objc private func onTapSelectButton1() {
        self.selectedButtonNumber = 1
        self.chatLabel.text = ""
        let titleText = "헐 어떡해 ㅠㅠ 빨리 나아..."
        var charIndex = 0.0
        for letter in titleText {
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { timer in
                self.chatLabel.text?.append(letter)
            }
            charIndex += 1
        }
    }
    @objc private func onTapSelectButton2() {
        self.selectedButtonNumber = 2
        self.chatLabel.text = ""
        let titleText = "헐 어떻게 ㅠㅠ 빨리 낳아..."
        var charIndex = 0.0
        for letter in titleText {
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { timer in
                self.chatLabel.text?.append(letter)
            }
            charIndex += 1
        }
    }
    @objc private func onTapSelectButton3() {
        self.selectedButtonNumber = 3
        self.chatLabel.text = ""
        let titleText = "헐 어떡해 ㅠㅠ 빨리 낳아..."
        var charIndex = 0.0
        for letter in titleText {
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { timer in
                self.chatLabel.text?.append(letter)
            }
            charIndex += 1
        }
    }
    @objc private func onTapSelectButton4() {
        self.selectedButtonNumber = 4
        self.chatLabel.text = ""
        let titleText = "헐 어떻게 ㅠㅠ 빨리 나아..."
        var charIndex = 0.0
        for letter in titleText {
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { timer in
                self.chatLabel.text?.append(letter)
            }
            charIndex += 1
        }
    }
    
    private func configureUI() {
        [borderView].forEach{
            view.addSubview($0)
        }
       
        [dateLeftBorderView, dateRightBorderView, messageHeaderLabel, messageCollectionView, messageFooterView, sendButton].forEach{
            borderView.addSubview($0)
        }
        
        [horizontalBar, chatLabel].forEach{
            messageFooterView.addSubview($0)
        }

        borderView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(device.defaultPadding)
            make.horizontalEdges.equalToSuperview().inset(device.horizontalPadding)
            make.height.equalToSuperview().multipliedBy(0.6)
        }
        
        messageHeaderLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(device.verticalSpacing3)
            make.size.equalTo(messageHeaderLabel.intrinsicContentSize)
            make.centerX.equalToSuperview()
            make.leading.equalTo(dateLeftBorderView.snp.trailing).offset(20)
            make.trailing.equalTo(dateRightBorderView.snp.leading).offset(-20)
        }
        
        dateLeftBorderView.snp.makeConstraints { make in
            make.centerY.equalTo(messageHeaderLabel.snp.centerY)
            make.leading.equalToSuperview().offset(20)
            make.height.equalTo(1)
        }
        
        dateRightBorderView.snp.makeConstraints { make in
            make.centerY.equalTo(messageHeaderLabel.snp.centerY)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(1)
        }
        
        messageCollectionView.snp.makeConstraints { make in
            make.top.equalTo(messageHeaderLabel.snp.bottom).offset(device.verticalSpacing2)
            make.bottom.equalTo(messageFooterView.snp.top)
            make.horizontalEdges.equalToSuperview().inset(device.horizontalPadding)
        }
        
        messageFooterView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(device.verticalPadding)
            make.leading.equalToSuperview().inset(10)
            make.height.equalTo(device.textBoxHeight)
            make.width.equalToSuperview().multipliedBy(0.82)
        }
        
        sendButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(device.horizontalPadding)
            make.leading.equalTo(messageFooterView.snp.trailing)
            make.verticalEdges.equalTo(messageFooterView.snp.verticalEdges)
        }
        
        horizontalBar.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.centerY.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.5)
            make.width.equalTo(1.5)
        }
        
        chatLabel.snp.makeConstraints { make in
            make.leading.equalTo(horizontalBar.snp.trailing).offset(5)
            make.trailing.verticalEdges.equalToSuperview()
        }

    }
    
    private func configureButtonUI() {
        [selectButton1, selectButton2, selectButton3, selectButton4].forEach{
            view.addSubview($0)
        }

        selectButton1.snp.makeConstraints { make in
            make.top.equalTo(borderView.snp.bottom).offset(device.verticalPadding)
            make.horizontalEdges.equalToSuperview().inset(device.defaultPadding)
            make.height.equalToSuperview().multipliedBy(0.065)
        }
        selectButton2.snp.makeConstraints { make in
            make.top.equalTo(selectButton1.snp.bottom).offset(15)
            make.horizontalEdges.equalToSuperview().inset(device.defaultPadding)
            make.height.equalToSuperview().multipliedBy(0.065)
        }
        selectButton3.snp.makeConstraints { make in
            make.top.equalTo(selectButton2.snp.bottom).offset(15)
            make.horizontalEdges.equalToSuperview().inset(device.defaultPadding)
            make.height.equalToSuperview().multipliedBy(0.065)
        }
        selectButton4.snp.makeConstraints { make in
            make.top.equalTo(selectButton3.snp.bottom).offset(15)
            make.horizontalEdges.equalToSuperview().inset(device.defaultPadding)
            make.height.equalToSuperview().multipliedBy(0.065)
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
        let height = width * 0.2
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
        label.textColor = .black
        label.font = .appDefaultFont(size: 15)
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
