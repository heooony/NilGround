//
//  ScreenSize.swift
//  NilGround
//
//  Created by 김동헌 on 2022/06/28.
//

import Foundation
import UIKit

struct ScreenSize {
    static let screenWidth: CGFloat = UIScreen.main.bounds.width
    static let screenHeight: CGFloat = UIScreen.main.bounds.height
    
    private static let basicWidth: CGFloat = 375.0 // iPhone 11pro width
    private static let basicHeight: CGFloat = 812.0 // iPhone 11pro height
    
    func w(_ w: CGFloat) -> CGFloat {
        ScreenSize.screenWidth / ScreenSize.basicWidth * w
    }
    func h(_ h: CGFloat) -> CGFloat {
        ScreenSize.screenHeight / ScreenSize.basicHeight * h
    }
    func f(_ f: CGFloat) -> CGFloat {
        ScreenSize.screenHeight / ScreenSize.basicHeight * f
    }
}
