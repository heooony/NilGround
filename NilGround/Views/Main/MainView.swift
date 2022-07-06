//
//  TestView.swift
//  NilGround
//
//  Created by 김동헌 on 2022/07/04.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var themeListVM = ThemeListViewModel()
    @State var isActive: String? = ""
    @State var showCategory: Bool = true
    @State var choiceCategory = "Trip"
    @Namespace var animation
    @State var detail = false
    let categories = ["Trip", "Place", "Food", "Culture"]
    
    var body: some View {
        
        ZStack {
            VStack(alignment: .leading) {
                
                HStack {
                    Spacer()
                    Button {
                        
                    } label: {
                        Image(systemName: "gearshape")
                            .resizable()
                            .frame(width: c.iconSize, height: c.iconSize)
                            .foregroundColor(Color(0x444444))
                    }
                }
                .padding(.horizontal, c.defaultPadding)
                
                if showCategory {
                    ScrollView(.horizontal) {
                        HStack(alignment: .bottom, spacing: 20) {
                            ForEach(categories, id: \.self) { category in
                                Text(category)
                                    .font(isSelected(category) ? .title.bold() : .title3)
                                    .foregroundColor(isSelected(category) ? .primary : .secondary)
                                    .onTapGesture {
                                        withAnimation(.easeInOut) {
                                            choiceCategory = category
                                        }
                                    }
                            }
                        }
                        
                        .padding(.horizontal, 20)
                    }
                    .padding(.bottom, 10)
                }
                
                ScrollView {
                    VStack(spacing: 40) {
                        ForEach(themeListVM.themeCellViewModels) { themeCellVM in
                            ZStack {
                                NavigationLink(tag: themeCellVM.id, selection: $isActive) {
                                    MainThemeView()
                                } label: {
                                    Color.clear
                                }.disabled(true)
                                MainThemeItem()
                                    .onTapGesture {
                                        isActive = themeCellVM.id
                                    }
                            }
                        }
                    }
                }
                .gesture(
                    DragGesture().onChanged { value in
                        if value.translation.height > 0 {
                            withAnimation {
                                showCategory = true
                            }
                        }
                        if value.translation.height < 0 {
                            withAnimation {
                                showCategory = false
                            }
                        }
                    }
                )
            }
        }
    }
    
    func isSelected(_ category: String) -> Bool {
        return choiceCategory == category
    }
    
    struct c {
        static let defaultPadding: CGFloat = 20.0
        static let iconSize: CGFloat = 30.0
    }
}

// MARK: PREVIEWS
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
