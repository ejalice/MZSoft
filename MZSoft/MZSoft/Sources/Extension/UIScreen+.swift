//
//  UIScreen+.swift
//  MZSoft
//
//  Created by κΉμν on 2022/10/08.
//

import UIKit

extension UIScreen {
    static func getDevice() -> DeviceSize {
        if UIScreen.main.bounds.size.width == 428 {
            return DeviceSize.iPhone13ProMax
        } else if UIScreen.main.bounds.size.width == 390 {
            return DeviceSize.iPhone13
        } else if UIScreen.main.bounds.size.width == 375 {
            return DeviceSize.iPhoneMini
        } else if UIScreen.main.bounds.size.width == 414 {
            return DeviceSize.iPhone11ProMax
        } else if UIScreen.main.bounds.size.width == 375 {
            return DeviceSize.iPhone11
        } else if UIScreen.main.bounds.size.width == 320 {
            return DeviceSize.iPhoneSE
        } else if UIScreen.main.bounds.size.width == 414 {
            return DeviceSize.iPhone8Plus
        } else if UIScreen.main.bounds.size.width == 375 {
            return DeviceSize.iPhone8
        } else {
            return DeviceSize.iPhone13
        }
    }
    
    enum DeviceSize {
        case iPhone13
        case iPhone13ProMax
        case iPhoneMini
        case iPhone11ProMax
        case iPhone11
        case iPhone8Plus
        case iPhone8
        case iPhoneSE
        
        // MARK: MyDiariesView
        var defaultPadding: CGFloat {
            switch self {
            default: return CGFloat(20)
            }
        }
        
        var verticalPadding: CGFloat {
            switch self {
            default: return CGFloat(10)
            }
        }
        /// 10
        var verticalSpacing: CGFloat {
            switch self {
            default: return CGFloat(10)
            }
        }
        /// 30
        var verticalSpacing2: CGFloat {
            switch self {
            default: return CGFloat(30)
            }
        }
        /// 50
        var verticalSpacing3: CGFloat {
            switch self {
            default: return CGFloat(50)
            }
        }
        
        var textBoxHeight: CGFloat {
            switch self {
            default: return CGFloat(40)
            }
        }
        
        var horizontalPadding: CGFloat {
            switch self {
            default: return CGFloat(10)
            }
        }
        
        var messageEdgeInset: UIEdgeInsets {
            switch self {
            default: return UIEdgeInsets(top: 13, left: 16, bottom: 13, right: 16)
            }
        }
    }
}
