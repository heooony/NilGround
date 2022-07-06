//
//  StarsView.swift
//  NilGround
//
//  Created by 김동헌 on 2022/07/05.
//

import SwiftUI

struct StarsView: View {
    private static let MAX_RATING: Float = 5 // Defines upper limit of the rating
    private static let COLOR = Color.yellow // The color of the stars
    
    let rating: Float
    let formatRating: String
    private let fullCount: Int
    private let emptyCount: Int
    private let halfFullCount: Int
    
    init(rating: Float) {
        self.rating = rating
        fullCount = Int(rating)
        emptyCount = Int(StarsView.MAX_RATING - rating)
        halfFullCount = (Float(fullCount + emptyCount) < StarsView.MAX_RATING) ? 1 : 0
        formatRating = String(format: "%.1f", rating)
    }
    
    var body: some View {
        HStack(spacing: 5) {
            ForEach(0..<fullCount, id: \.self) { _ in
                self.fullStar
            }
            ForEach(0..<halfFullCount, id: \.self) { _ in
                self.halfFullStar
            }
            ForEach(0..<emptyCount, id: \.self) { _ in
                self.emptyStar
            }
            Text("(\(formatRating))")
                .font(.callout)
                .foregroundColor(.white)
        }
    }
    
    private var fullStar: some View {
        Image(systemName: "star.fill").foregroundColor(StarsView.COLOR)
    }
    
    private var halfFullStar: some View {
        Image(systemName: "star.lefthalf.fill").foregroundColor(StarsView.COLOR)
    }
    
    private var emptyStar: some View {
        Image(systemName: "star").foregroundColor(StarsView.COLOR)
    }
}
