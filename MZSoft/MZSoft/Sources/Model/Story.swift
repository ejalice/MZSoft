//
//  Story.swift
//  MZSoft
//
//  Created by eunji on 2022/10/09.
//

import Foundation

struct Story {
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
