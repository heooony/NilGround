//
//  AppTheme.swift
//  NilGround
//
//  Created by 김동헌 on 2022/07/11.
//

import SwiftUI

struct AppTheme {
    static func myBackgroundColor(forScheme scheme: ColorScheme) -> Color {
        let lightColor = Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))
        let darckColor = Color.black
        
        switch scheme {
        case .light : return lightColor
        case .dark : return darckColor
        @unknown default: return lightColor
        }
    }
}
