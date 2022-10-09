//
//  FullMessageViewController.swift
//  MZSoft
//
//  Created by 김상현 on 2022/10/09.
//

import SnapKit
import UIKit

class FullMessageViewController: UIViewController {
    var selectedDate: String = ""
    let device = UIScreen.getDevice()
    var messageData: [Message] = [Message(type: .male, content: "혹시 집이 없으신가요?"), Message(type: .female, content: "ㅋㅋㅋㅋㅋㅋ 웅"), Message(type: .male, content: "언제 시간 돼??"), Message(type: .female, content: "사흘 후에 어때?"), Message(type: .female, content: "캘박 필수~~")]
    var dayData: [Day] = [Day(day: "일", date: "2", isToday: false), Day(day: "월", date: "3", isToday: true), Day(day: "화", date: "4", isToday: false), Day(day: "수", date: "5", isToday: false), Day(day: "목", date: "6", isToday: false), Day(day: "금", date: "7", isToday: false), Day(day: "토", date: "8", isToday: false)]
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
    
    private lazy var myMessage: FullMessageCollectionViewCell = {
        let message = FullMessageCollectionViewCell()
        message.configureUI(message: Message(type: .male, content: "집 들어가면 연락해~"))
        
        return message
    }()
    
    private lazy var dateLeftBorderView2: UIView = {
        let view = UIView()
        view.backgroundColor = .appTintColor1
        
        return view
    }()
    
    private lazy var dateRightBorderView2: UIView = {
        let view = UIView()
        view.backgroundColor = .appTintColor1
        
        return view
    }()
    
    private lazy var messageHeaderLabel2: UILabel = {
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
        collectionView.isScrollEnabled = false
        collectionView.register(FullMessageCollectionViewCell.self, forCellWithReuseIdentifier: "FullMessageCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        
        return collectionView
    }()
    
    private lazy var messageFooterView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 2
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
    
    private lazy var calendarCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect(), collectionViewLayout: layout)
        collectionView.backgroundColor = .appBackgroundColor3
        collectionView.isScrollEnabled = false
        collectionView.register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: "CalendarCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.layer.cornerRadius = 10
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .appBackgroundColor1
        
        self.sendButton.addTarget(self, action: #selector(onTapSendButton), for: .touchUpInside)

        DispatchQueue.main.async {
            self.configureUI()

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
            self.showCell(row: 3)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 7.5) {
            self.showCell(row: 4)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 9) {
            self.chatLabel.text = ""
            var charIndex = 0.0
            let titleText = "까먹기 전에 캘린더에 적어보자!"
            for letter in titleText {
                Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { timer in
                    self.chatLabel.text?.append(letter)
                }
                charIndex += 1
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 11.5) {
            UIView.animate(withDuration: 0.5) {
                self.sendButton.alpha = 1
            }
            self.sendButton.isUserInteractionEnabled = true
        }
    }
    
    @objc private func onTapSendButton() {
        let vc = ResultsViewController()
        if selectedDate == "6" {
            print("성공")
            vc.storyContent = Story.story[1]
            vc.modalPresentationStyle = .fullScreen
        } else {
            print("실패")
            vc.storyContent = Story.story[4]
            vc.modalPresentationStyle = .fullScreen
        }
        self.present(vc, animated: false)
    }
    
    private func configureUI() {
        [borderView, calendarCollectionView].forEach{
            view.addSubview($0)
        }
       
        [dateLeftBorderView, dateRightBorderView, messageHeaderLabel, myMessage, dateLeftBorderView2, dateRightBorderView2, messageHeaderLabel2, messageCollectionView, messageFooterView, sendButton].forEach{
            borderView.addSubview($0)
        }
        
        [horizontalBar, chatLabel].forEach{
            messageFooterView.addSubview($0)
        }

        borderView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(device.defaultPadding)
            make.horizontalEdges.equalToSuperview().inset(20)
            make.height.equalToSuperview().multipliedBy(0.8)
        }
        
        calendarCollectionView.snp.makeConstraints { make in
            make.top.equalTo(borderView.snp.bottom)
            make.horizontalEdges.equalToSuperview().inset(20)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
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
            make.leading.equalToSuperview()
            make.height.equalTo(1)
        }
        
        dateRightBorderView.snp.makeConstraints { make in
            make.centerY.equalTo(messageHeaderLabel.snp.centerY)
            make.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
        
        myMessage.snp.makeConstraints { make in
            make.top.equalTo(messageHeaderLabel.snp.bottom).offset(30)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(70)
        }
        
        messageHeaderLabel2.snp.makeConstraints { make in
            make.top.equalTo(myMessage.snp.bottom)
            make.size.equalTo(messageHeaderLabel2.intrinsicContentSize)
            make.centerX.equalToSuperview()
            make.leading.equalTo(dateLeftBorderView2.snp.trailing).offset(20)
            make.trailing.equalTo(dateRightBorderView2.snp.leading).offset(-20)
        }
        
        dateLeftBorderView2.snp.makeConstraints { make in
            make.centerY.equalTo(messageHeaderLabel2.snp.centerY)
            make.leading.equalToSuperview()
            make.height.equalTo(1)
        }
        
        dateRightBorderView2.snp.makeConstraints { make in
            make.centerY.equalTo(messageHeaderLabel2.snp.centerY)
            make.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
        
        messageCollectionView.snp.makeConstraints { make in
            make.top.equalTo(messageHeaderLabel2.snp.bottom).offset(device.verticalSpacing2)
            make.bottom.equalTo(messageFooterView.snp.top)
            make.horizontalEdges.equalToSuperview()
        }
        
        messageFooterView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(device.verticalPadding)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(device.textBoxHeight)
            make.width.equalToSuperview().multipliedBy(0.85)
        }
        
        sendButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
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

    private func showCell(row: Int) {
        let cell = messageCollectionView.cellForItem(at: IndexPath(row: row, section: 0))
        cell?.alpha = 1
    }
    
}

extension FullMessageViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.isEqual(messageCollectionView) {
        case true:
            return messageData.count
        case false:
            return dayData.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView.isEqual(messageCollectionView) {
        case true:
            guard let cell = messageCollectionView.dequeueReusableCell(withReuseIdentifier: "FullMessageCollectionViewCell", for: indexPath) as? FullMessageCollectionViewCell else { return UICollectionViewCell() }
            DispatchQueue.main.async {
                cell.alpha = 0
                cell.configureUI(message: self.messageData[indexPath.row])
            }
            return cell
        case false:
            guard let cell = calendarCollectionView.dequeueReusableCell(withReuseIdentifier: "CalendarCollectionViewCell", for: indexPath) as? CalendarCollectionViewCell else { return UICollectionViewCell() }
            DispatchQueue.main.async {
                cell.completion = { date in
                    self.selectedDate = date
                    self.calendarCollectionView.visibleCells.forEach{
                        let a = $0 as! CalendarCollectionViewCell
                        a.buttonTintColorToggle()
                    }
                }
                cell.configureUI(dayModel: self.dayData[indexPath.row])
            }
            return cell
        }
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView.isEqual(messageCollectionView) {
        case true:
            let width = collectionView.frame.width
            let height = width * 0.2
            // 232:53
            // 232:41
            return CGSize(width: width, height: height)
        case false:
            let width = (collectionView.frame.width - 120) / 7
            let height = collectionView.frame.height

            return CGSize(width: width, height: height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        switch collectionView.isEqual(messageCollectionView) {
        case true:
            return UIEdgeInsets()
        case false:
            return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        }
    }
}

class CalendarCollectionViewCell: UICollectionViewCell {
    var dayModel: Day!
    var completion: ((_ date: String) -> Void)!
    
    private lazy var dotLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 35)
        label.textColor = .appTintColor1
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var dayLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .appDefaultFont(size: 17)
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var dateButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .appBackgroundColor1
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = .appDefaultFont(size: 17)
        button.layer.cornerRadius = 7
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func buttonTintColorToggle() {
        if dayModel.date == "6" || dayModel.date == "7" {
            self.dateButton.backgroundColor = .appBackgroundColor2
        }
    }
    
    func configureUI(dayModel: Day) {
        self.dayModel = dayModel
        self.dayLabel.text = dayModel.day
        self.dateButton.setTitle(dayModel.date, for: .normal)
        if dayModel.isToday {
            self.dotLabel.text = "·"
        }
        
        if dayModel.date == "6" || dayModel.date == "7" {
            self.dateButton.backgroundColor = .appBackgroundColor2
            self.dateButton.addTarget(self, action: #selector(onTapDateButton), for: .touchUpInside)
        }
        
        [dotLabel, dayLabel, dateButton].forEach{
            contentView.addSubview($0)
        }
        
        dotLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.2)
        }
        
        dayLabel.snp.makeConstraints { make in
            make.top.equalTo(dotLabel.snp.bottom)
            make.horizontalEdges.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.3)
            make.width.equalTo(dayLabel.snp.height)
        }
        
        dateButton.snp.makeConstraints { make in
            make.top.equalTo(dayLabel.snp.bottom)
            make.horizontalEdges.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.3)
            make.width.equalTo(dateButton.snp.height)
        }
    }
    
    @objc private func onTapDateButton() {
        DispatchQueue.main.async {
            self.completion(self.dayModel.date)
            self.dateButton.backgroundColor = .appTintColor1
        }
    }
}

class FullMessageCollectionViewCell: UICollectionViewCell {
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

