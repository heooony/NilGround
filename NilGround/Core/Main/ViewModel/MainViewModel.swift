//
//  MainViewModel.swift
//  NilGround
//
//  Created by 김동헌 on 2022/06/28.
//

import SwiftUI

class MainViewModel: ObservableObject {
  
    private static var tempThemeCards = [
        ThemeCard.CardInfo(id: 0, title: "부산 갈매기", description: "부산의 갈매기가 정말 많은 곳", imagePath: "LA-street"),
        ThemeCard.CardInfo(id: 1, title: "성남 꺾다리", description: "성남에는 역시 언덕이 많아", imagePath: "dark-moon")
    ]
    
    var cardInfos: Array<ThemeCard.CardInfo> {
        return model.cardInfos
    }
    
    @Published private var model = ThemeCard(cardInfos: tempThemeCards)
}
