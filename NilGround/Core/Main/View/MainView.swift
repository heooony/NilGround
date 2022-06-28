//
//  MainView.swift
//  NilGround
//
//  Created by 김동헌 on 2022/06/27.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var viewModel = MainViewModel()
    @State var cardPosition = 0
    var cardInfo: ThemeCard.CardInfo {
        get {
            return viewModel.cardInfos[cardPosition]
        }
    }
    
    var body: some View {
        VStack {
            mainHeader
            mainContent
            mainDescription
            Spacer()
        }
    }
    
    struct DrawingConstruct {
        static let itemWidth: CGFloat = 250.0
        static let itemHeight: CGFloat = 400.0
    }
}



extension MainView {
    var mainHeader: some View {
        VStack {
            HStack {
                Image(systemName: "menucard")
                Spacer()
                Text("Place")
                    .foregroundColor(Color(.lightGray))
                Spacer()
                Image(systemName: "magnifyingglass")
                    
            }
            .padding(.top, 30)
            .padding(.horizontal, 30)
            .foregroundColor(Color(UIColor.darkGray))
            
            Text(cardInfo.title)
                .font(.largeTitle)
                .font(.custom("NanumMyeongjo-Regular", size: 10.0))
                .padding(.top, 1)
        }
    }
    
    var mainContent: some View {
        GeometryReader { geometry in
            let screenWidth = geometry.size.width
            let itemWidth = DrawingConstruct.itemWidth
            let sidePadding = ( screenWidth - itemWidth ) / 2
            ScrollView(.horizontal) {
                ScrollViewReader { proxy in
                    HStack {
                        Spacer().frame(width: sidePadding)
                        HStack(spacing: screenWidth * 0.1) {
                            ForEach(viewModel.cardInfos) { cardInfo in
                                VStack {
                                    ThemeCardView(imagePath: cardInfo.imagePath)
                                        .id(cardInfo.id)
                                        .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                                            .onEnded({ value in
                                                if value.translation.width < 0 {
                                                    cardPosition += 1
                                                    withAnimation {
                                                        proxy.scrollTo(cardPosition)
                                                    }
                                                }
                                                if value.translation.width > 0 {
                                                    cardPosition -= 1
                                                    withAnimation {
                                                        proxy.scrollTo(cardPosition, anchor: .bottomTrailing)
                                                    }
                                                }
                                            })
                                        )
                                }
                            }
                        }
                        Spacer().frame(width: sidePadding)
                    }
                }
            }
        }
    }
    
    var mainDescription: some View {
        VStack(alignment: .center, spacing: 5.0) {
            Text("Dongheon, Kim")
                .foregroundColor(Color(.lightGray))
                .font(.subheadline)
            Text(cardInfo.description)
                .foregroundColor(Color(.darkGray))
                .font(.body)
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    private let viewModel = MainViewModel()
    static var previews: some View {
        MainView()
    }
}
