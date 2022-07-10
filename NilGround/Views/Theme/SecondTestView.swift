//
//  SecondTestView.swift
//  NilGround
//
//  Created by 김동헌 on 2022/07/10.
//

import SwiftUI

struct SecondTestView: View {
    var body: some View {
        Image("cafe")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 230, height: 320)
            .clipped()
            .overlay(
                ZStack {
                    Circle()
                        .offset(x: 115, y: 40)
                        .frame(width: 40)
                        .foregroundColor(.white)
                    Circle()
                        .offset(x: -115, y: 40)
                        .frame(width: 40)
                        .foregroundColor(.white)
                }
            )
    }
}

struct SecondTestView_Previews: PreviewProvider {
    static var previews: some View {
        SecondTestView()
    }
}
