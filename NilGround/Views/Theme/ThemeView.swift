//
//  ThemeView.swift
//  NilGround
//
//  Created by 김동헌 on 2022/07/06.
//

import SwiftUI
import SDWebImageSwiftUI

struct ThemeView: View {
    
//    let themeCellVM: ThemeCellViewModel
    @Environment(\.presentationMode) var presentationMode
    let width = UIScreen.main.bounds.width
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                GeometryReader { proxy in
                    let size = proxy.size
                    
    //                WebImage(url: URL(string: themeCellVM.theme.image))
                    Image("profile-1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width, height: size.height)
                        .cornerRadius(15)
                    
                    LinearGradient(colors: [
                        .black.opacity(0.7),
                        .black.opacity(0.5),
                        .black.opacity(0.4),
                        .clear,
                        .black.opacity(0.3),
                        .black.opacity(0.5),
                    ], startPoint: .top, endPoint: .bottom)
                    .cornerRadius(15)
                }
                .frame(height: 350)
                
                Text("성남의 태양 아래 피톤치드를 느낄 수 있는 12곳")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                    .padding(.horizontal, 10)
                
                Divider()
                    .padding(.horizontal, 20)
                    
                Text("성남에는 유명한 탄천이 있습니다. 탄천에서 즐길 수 있는 식물 정원과 바람이 잘 드는 곳으로 선정해보았습니다. 오리역 탄천부터 복정 탄천에 이르기 전 범위로 정해보았습니다.")
                    .font(.callout)
                    .foregroundColor(.primary)
                    .padding(.horizontal)
                
                Color.clear.frame(height: 50)
                
                ForEach(1..<7, id: \.self) { index in
                    VStack(alignment: .leading) {
                        Image("post\(index)")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: width, height: 200)
                            .clipped()
                        
                        Text("성남의 태양 아래 피톤치드를 느낄 수 있는 12곳")
                            .font(.title.bold())
                            .foregroundColor(.primary)
                            .padding(.horizontal)
                            .padding(.vertical, 5)
                        
                        HStack {
                            VStack(alignment: .leading, spacing: 5) {
                                Text("\(Date.now.formatted())")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                Text("1252 likes")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.horizontal)
                        
                        Text("성남에는 유명한 탄천이 있습니다. 탄천에서 즐길 수 있는 식물 정원과 바람이 잘 드는 곳으로 선정해보았습니다. 오리역 탄천부터 복정 탄천에 이르기 전 범위로 정해보았습니다.")
                            .font(.callout)
                            .foregroundColor(.primary)
                            .padding()
                    }
                }
            }
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .preferredColorScheme(.dark)
    }
}

struct ThemeView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeView()
    }
}
