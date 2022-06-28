//
//  ThemeCardView.swift
//  NilGround
//
//  Created by 김동헌 on 2022/06/28.
//

import SwiftUI

struct ThemeCardView: View, Hashable {
    let imagePath: String
    let itemWidth: CGFloat
    let itemHeight: CGFloat
    
    init(imagePath: String, itemWidth: CGFloat = 250, itemHeight: CGFloat = 400) {
        self.imagePath = imagePath
        self.itemWidth = itemWidth
        self.itemHeight = itemHeight
    }
    
    var body: some View {
        Image(imagePath)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .edgesIgnoringSafeArea(.all)
            .frame(width: itemWidth, height: itemHeight)
            .clipped()
            .shadow(color: .gray, radius: 10.0, x: 0, y: 5.0)
    }
}

struct ThemeCardView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeCardView(imagePath: "LA-street")
    }
}
