//
//  ThemeCard.swift
//  NilGround
//
//  Created by 김동헌 on 2022/06/28.
//

import Foundation

struct ThemeCard {
    private(set) var cardInfos: Array<CardInfo>
    
    init(cardInfos: Array<CardInfo>) {
        self.cardInfos = []
        for card in cardInfos {
            self.cardInfos.append(card)
        }
    }
    
    struct CardInfo: Identifiable {
        let id: Int
        let title: String
        let description: String
        let imagePath: String
    }
}
