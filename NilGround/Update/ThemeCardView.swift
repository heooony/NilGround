////
////  ThemeCardView.swift
////  NilGround
////
////  Created by 김동헌 on 2022/07/04.
////
//
//import SwiftUI
//
//struct ThemeCardView: View {
//    @ObservedObject var themeCellVM: ThemeCellViewModel
//    
//    var body: some View {
//        // 이미지 뷰 생성
//        ZStack(alignment: .topLeading) {
//            
//            // 이미지 관련
//            GeometryReader { proxy in
//                let size = proxy.size
//                Image(themeCellVM.theme.image)
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: size.width, height: size.height)
//                    .clipShape(RoundedRectangle(cornerRadius: 20))
//            }
//            
//            // 이미지 위에 어두운 필터 끼우기
//            LinearGradient(colors: [
//                .black.opacity(0.5),
//                .black.opacity(0.2),
//                .clear,
//                .black.opacity(0.2),
//            ], startPoint: .top, endPoint: .bottom)
//            .clipShape(RoundedRectangle(cornerRadius: 20))
//            
//            // 이미지 내 제목 및 내용, 날짜 텍스트 정리
//            VStack(alignment: .leading, spacing: 8) {
//                Text(themeCellVM.theme.title.uppercased())
//                    .font(.largeTitle.bold())
//                    .foregroundColor(.white)
//                
//                Text(themeCellVM.theme.description)
//                    .font(.callout)
//                    .fontWeight(.semibold)
//                    .foregroundColor(.white)
//                
//                Spacer()
//                
//                Text(themeCellVM.theme.user.name)
//                    .font(.body)
//                    .foregroundColor(.white)
//                
//                Text("\(themeCellVM.theme.createdDate!.seconds)")
//                    .font(.caption)
//                    .foregroundColor(.white)
//            }
//            .padding(20)
//        }
//        .shadow(color: .black.opacity(0.2), radius: 10, x: 10, y: 10)
//        .shadow(color: .white, radius: 10, x: -10, y: -10)
//    }
//}
//
//struct ThemeCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
