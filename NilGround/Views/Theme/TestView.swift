//
//  ThemeView.swift
//  NilGround
//
//  Created by 김동헌 on 2022/07/06.
//

import SwiftUI
import SDWebImageSwiftUI

struct TestView: View {
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image("cafe")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width)
            
            LinearGradient(colors: [
                .black.opacity(0.4),
                .black.opacity(0.2),
                .clear,
                .black.opacity(0.3),
                .black.opacity(0.6),
            ], startPoint: .top, endPoint: .bottom)
            
            VStack(alignment: .leading, spacing: 8.0) {
                Spacer()
                Image(systemName: "cup.and.saucer.fill")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 26.0, height: 26.0)
                    .cornerRadius(10)
                    .padding(10)
                    .background(
                        .thinMaterial, in: RoundedRectangle(
                            cornerRadius: 16, style: .continuous
                        )
                    )
                    .padding(.bottom, 20)
                
                Text("제목이 들어갑니다.")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)
                
                Text("시간이 들어갑니다.")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                
                Text("설명이 들어갑니다.")
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.white)
                    .padding(.bottom, 20)

            }
            .padding(.all, 20.0)
            .padding(.bottom, 40)
            
            Button {
            } label: {
                Image(systemName: "xmark")
                    .font(.body.weight(.bold))
                    .foregroundColor(.secondary)
                    .padding(8)
                    .background(.ultraThinMaterial, in: Circle())
            }
            .padding(30)
            .padding(.top, 25)
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
