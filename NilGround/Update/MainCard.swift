////
////  CardView.swift
////  NilGround
////
////  Created by 김동헌 on 2022/07/05.
////
//
//import SwiftUI
//
//extension MainView {
//    // MARK: CARDVIEW
//    var mainCard: some View {
//        LazyHStack(alignment: .top, spacing: c.cardSpacing) {
//            Spacer().frame(width: c.cardSideSpacing)
//            ForEach(themeListVM.themeCellViewModels) { themeCellVM in
//                ZStack(alignment: .top) {
////                    NavigationLink(tag: themeCellVM.theme.id!, selection: $isActive) {
////                            ThemeDetailView(theme: theme)
////                                .animation(.easeOut, value: isActive)
////                    } label: {
////                        Color.clear
////                    }
////                    .disabled(true)
//                    ThemeCardView(themeCellVM: themeCellVM)
//                        .frame(width: c.cardViewWidth, height: c.cardViewHeight)
//                        .onTapGesture {
//                            isActive = themeCellVM.id
//                        }
//                }
//            }
//            Spacer().frame(width: c.cardSideSpacing)
//        }
//        .offset(x: offsetX)
//        .frame(width: UIScreen.main.bounds.width, alignment: .leading)
//        .gesture(
//            DragGesture(minimumDistance: 0, coordinateSpace: .local)
//                .onEnded({ value in
//                    if value.translation.width < 0,
//                       currentIndex < themeListVM.themeCellViewModels.count - 1{
//                        currentIndex += 1
////                        theme = themeListVM.themeCellViewModels[currentIndex].theme
//                        withAnimation {
//                            offsetX -= (c.cardSpacing + c.cardViewWidth)
//                        }
//                    }
//                    if value.translation.width > 0,
//                       currentIndex > 0 {
//                        currentIndex -= 1
////                        theme = themeListVM.themeCellViewModels[currentIndex].theme
//                        withAnimation {
//                            offsetX += (c.cardSpacing + c.cardViewWidth)
//                        }
//                    }
//                }
//            )
//        )
//    }
//}
//
//// MARK: PREVIEWS
//struct MainCard_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
