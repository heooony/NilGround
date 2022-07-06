////
////  ThemeDetailView.swift
////  NilGround
////
////  Created by 김동헌 on 2022/07/04.
////
//
//import SwiftUI
//
//struct ThemeDetailView: View {
//
//    @State var showAnimation = false
//    @Namespace var namespace
//
//    @State var showMap = false
//    let theme: Theme
//
//    init(theme: Theme = themes.first!) {
//        self.theme = theme
//    }
//
//    var body: some View {
//        ZStack(alignment: .leading) {
//            GeometryReader { proxy in
//                let size = proxy.size
//                Image(theme.imagePath)
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: size.width, height: size.height)
//            }
//
//            // 이미지 위에 어두운 필터 끼우기
//            LinearGradient(colors: [
//                .black.opacity(0.3),
//                .black.opacity(0.2),
//                .clear,
//                .black.opacity(0.4),
//                .black.opacity(0.6),
//            ], startPoint: .top, endPoint: .bottom)
//            .clipShape(RoundedRectangle(cornerRadius: 20))
//
////            VStack(alignment: .leading, spacing: 10) {
////
////                Spacer()
////
////                Text("category")
////                    .font(.body)
////                    .foregroundColor(.white)
////
////                Text(theme.title)
////                    .font(.largeTitle.bold())
////                    .foregroundColor(.white)
////
////                Text(theme.description)
////                    .font(.body)
////                    .foregroundColor(.white)
////
////                StarsView(rating: 4.3)
////            }
////            .padding(.horizontal, 20)
////            .padding(.vertical, 50)
//
//            ScrollView(.vertical, showsIndicators: false) {
//                if !showAnimation {
//                    VStack {
//                        ForEach(0..<3, id: \.self) {_ in
//                            SpotCardItem(namespace: namespace, show: $showAnimation)
//                                .onTapGesture {
//                                    withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
//                                        showAnimation.toggle()
//                                    }
//                                }
//                        }
//                    }
//                }
//                if showAnimation {
//                    SpotView(namespace: namespace, show: $showAnimation)
//                }
//            }
//
//        }
//        .ignoresSafeArea()
//    }
//}
//
//struct ThemeDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ThemeDetailView(theme: themes.first!)
//    }
//}
