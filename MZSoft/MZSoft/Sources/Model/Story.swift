//
//  Story.swift
//  MZSoft
//
//  Created by eunji on 2022/10/09.
//

import Foundation

struct Story {
    static let story =  [
        Story(type: .success, mainTitle: "성공", subTitle: "", imageName: "aliceProfile", content: "썸녀가 호감을 보입니다", buttonContent: "다음"),
        Story(type: .failOne, mainTitle: "GAME OVER", subTitle: "<응애>", imageName: "aliceProfile", content: "썸녀를 엄마로\n만들어 버렸습니다.", buttonContent: "홈으로"),
        Story(type: .failTwo, mainTitle: "GAME OVER", subTitle: "<어떻게>", imageName: "aliceProfile", content: "니 맞춤법이 더 어.떻.게 ^^", buttonContent: "홈으로")
    ]
    
    let type: ViewType
    let mainTitle: String
    let subTitle: String
    let imageName: String
    let content: String
    let buttonContent: String
}

enum ViewType {
    case prolog
    case success
    case failOne //응애
    case failTwo //어떻게
}
