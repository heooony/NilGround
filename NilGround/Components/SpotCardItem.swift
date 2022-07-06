//
//  SpotCardView.swift
//  NilGround
//
//  Created by 김동헌 on 2022/07/05.
//

import SwiftUI

struct SpotCardItem: View {
    
    var namespace: Namespace.ID
    @Binding var show: Bool
    
//    let theme: Theme = themes.first!
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Spacer()
            VStack(alignment: .leading, spacing: 12) {
                Text("SwiftUI")
                    .font(.largeTitle.weight(.bold))
                    .matchedGeometryEffect(id: "title", in: namespace)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("20 sections - 3hours".uppercased())
                    .font(.footnote.weight(.semibold))
                    .matchedGeometryEffect(id: "subtitle", in: namespace)
                Text("asdasdasdsadasdsadasdasd")
                    .font(.footnote)
                    .matchedGeometryEffect(id: "text", in: namespace)
            }
            .padding(20)
            .background(
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .blur(radius: 40)
                    .matchedGeometryEffect(id: "blur", in: namespace)
            )
        }
        .padding(20)
        .foregroundStyle(.white)
        .background(
            Image("spot1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: "image", in: namespace)
        )
        .mask(
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .matchedGeometryEffect(id: "mask", in: namespace)
        )
        .frame(height: 300)
        .padding(20)    }
}

struct SpotCardItem_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        SpotCardItem(namespace: namespace, show: .constant(true))
    }
}
