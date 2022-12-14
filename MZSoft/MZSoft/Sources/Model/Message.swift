//
//  Message.swift
//  MZSoft
//
//  Created by κΉμν on 2022/10/08.
//

import Foundation

struct Message {
    let type: MessageType
    let content: String
}

enum MessageType {
    case male
    case female
}

struct Day {
    let day: String
    let date: String
    let isToday: Bool
}
