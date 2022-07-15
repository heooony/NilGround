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
    @Binding var root: Bool
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                GeometryReader { proxy in
                    let size = proxy.size
                    
    //                WebImage(url: URL(string: themeCellVM.theme.image))
                    ZStack(alignment: .topTrailing) {
                        Image("profile-1")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: size.width, height: size.height)
                            .cornerRadius(15)
                        
                        LinearGradient(colors: [
                            .black.opacity(0.4),
                            .black.opacity(0.3),
                            .black.opacity(0.1),
                            .clear,
                            .black.opacity(0.2),
                            .black.opacity(0.3),
                        ], startPoint: .top, endPoint: .bottom)
                        .cornerRadius(15)
                        
                        HStack(spacing: 20) {
                            Button {
                                root = false
                                presentationMode.wrappedValue.dismiss()
                            } label: {
                                Image(systemName: "arrow.left")
                                    .font(.title)
                            }
                            
                            Spacer()
                            
                            Button {
                                
                            } label: {
                                Image(systemName: "plus")
                                    .font(.title)
                            }

                            Button {
                                
                            } label: {
                                Image(systemName: "gearshape.fill")
                                    .font(.title)
                            }
                        }
                        .foregroundColor(.white)
                        .shadow(radius: 5)
                        .padding(.top, getSafeAreaTop())
                        .padding()
                    }
                }
                .frame(height: 350)
                
                Text("성남의 태양 아래 피톤치드를 느낄 수 있는 12곳")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                    .padding(.horizontal, 10)
                
                Divider()
                    .padding(.horizontal, 20)
                    .foregroundColor(.secondary)
                    
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
    
    func getSafeAreaTop() -> CGFloat {
        let keyWindow = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .map({$0 as? UIWindowScene})
            .compactMap({$0})
            .first?.windows
            .filter({$0.isKeyWindow}).first
        return (keyWindow?.safeAreaInsets.top)!
    }
}

struct ThemeView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeView(root: .constant(true))
    }
}
