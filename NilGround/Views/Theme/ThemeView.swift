//
//  ThemeView.swift
//  NilGround
//
//  Created by 김동헌 on 2022/07/06.
//

import SwiftUI
import SDWebImageSwiftUI

struct ThemeView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var theme: Theme?
    @State var titleOffset = CGFloat.zero
    @State var contentOpacity: CGFloat = 1.0
    private let appbarHeight: CGFloat = 600.0
    private let id: String
    let width = UIScreen.main.bounds.width
    @Binding var root: Bool
    
    init(root: Binding<Bool>, id: String) {
        self._root = root
        self.id = id
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            if let theme = self.theme, let _ = theme.createdDate {
                VStack(spacing: 30) {
                    GeometryReader { proxy in
                        let size = proxy.size
                        
                        ZStack(alignment: .topTrailing) {
                            WebImage(url: URL(string: theme.image))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: size.width, height: UIScreen.main.bounds.height)
                                .cornerRadius(15)
                            
                            LinearGradient(colors: [
                                .black.opacity(0.7),
                                .black.opacity(0.6),
                                .black.opacity(0.3),
                                .clear,
                                .black.opacity(0.4),
                                .black.opacity(0.5),
                                .black.opacity(0.7),
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
                            .offset(y: -titleOffset)
                            .offset(y: titleOffset > 0 ? titleOffset : (-titleOffset < appbarHeight ? 0 : titleOffset + appbarHeight))
                            
                            VStack(alignment: .leading, spacing: 15) {
                                Spacer()
                                
                                VStack(alignment: .leading, spacing: 10) {
                                    
                                    Text("\(theme.createdDate!.dateValue().formatted(date: .numeric, time: .shortened))")
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                    
                                    Text(theme.description)
                                        .font(.callout)
                                        .foregroundColor(.primary)
                                    
                                }
                                .opacity(getOpacity(titleOffset))
                                
                                Text("성남의 태양 아래 피톤치드를 느낄 수 있는 12곳")
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.primary)
                                
                            }
                            .padding(.horizontal, 30)
                            .padding(.bottom, 40)
                        }
                    }
                    .zIndex(1)
                    .offset(y: -titleOffset)
                    .offset(y: titleOffset > 0 ? 0 : (-titleOffset < appbarHeight ? titleOffset : -appbarHeight))
                    .frame(height: UIScreen.main.bounds.height)
                    .background(
                        GeometryReader { proxy in
                            Color.clear
                                .preference(key: TitleOffsetKey.self, value: proxy.frame(in: .global).minY
                                )
                        }
                    )
                    .onPreferenceChange(TitleOffsetKey.self) { value in
                        titleOffset = value
                    }
                    
                    
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
                    .zIndex(0)
                }
            }
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .preferredColorScheme(.dark)
        .onAppear {
            let themeListVM = ThemeListViewModel()
            themeListVM.getTheme(id: id) { theme in
                self.theme = theme
            }
        }
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
    
    func getOpacity(_ offset: CGFloat) -> CGFloat {
        1 + offset / appbarHeight
    }
}

struct TitleOffsetKey: PreferenceKey {
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value += nextValue()
    }
}

//struct ThemeView_Previews: PreviewProvider {
//    static var previews: some View {
//        ThemeView((root: .constant(true)))
//    }
//}
