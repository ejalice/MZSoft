//
//  Story.swift
//  MZSoft
//
//  Created by eunji on 2022/10/09.
//

import Foundation

struct Story {
    static let story =  [
        Story(type: .success, mainTitle: "성공", subTitle: "", imageName: "stage1_success", content: "썸녀가 호감을 보입니다", buttonContent: "다음"),
        Story(type: .success, mainTitle: "성공", subTitle: "", imageName: "stage2_success", content: "여자친구 GET~! >.<\n드디어 여자친구가 생겼다능~!", buttonContent: "다음"),
        Story(type: .failOne, mainTitle: "GAME OVER", subTitle: "<응애>", imageName: "stage1_failOne", content: "썸녀를 엄마로\n만들어 버렸습니다.", buttonContent: "홈으로"),
        Story(type: .failTwo, mainTitle: "GAME OVER", subTitle: "<어떻게>", imageName: "stage1_failTwo", content: "니 맞춤법이 더 어.떻.게 ^^", buttonContent: "홈으로"),
        Story(type: .failOne, mainTitle: "GAME OVER", subTitle: "<이루어질 수 없는 사랑>", imageName: "stage2_failOne", content: "너 어디야?..\n오늘 만나기로 했잖아", buttonContent: "홈으로"),
        Story(type: .failThree, mainTitle: "GAME OVER", subTitle: "<응애 + 감기>", imageName: "stage1_failThree", content: "애기 감기를 낳음.", buttonContent: "홈으로")
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
    case failOne //감기
    case failTwo //어떻게
    case failThree //응애
}
