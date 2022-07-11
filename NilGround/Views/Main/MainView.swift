//
//  TestView.swift
//  NilGround
//
//  Created by 김동헌 on 2022/07/04.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var themeListVM = ThemeListViewModel()
    @Environment(\.colorScheme) var colorScheme
    @State var isActive: String? = ""
    @Namespace var animation
    @State var detail = false
    
    init() {
        themeListVM.loadThemes()
    }
    
    var body: some View {
        
        ZStack {
            VStack(alignment: .leading) {
                
                HStack {
                    Button {
                        
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: c.iconSize, height: c.iconSize)
                            .shadow(radius: 1)
                    }
                    Spacer()
                    Button {
                        
                    } label: {
                        Image(systemName: "plus.viewfinder")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: c.iconSize, height: c.iconSize)
                            .shadow(radius: 1)
                    }
                }
                .overlay(
                    Text("Nil-Ground")
                        .font(.title2)
                )
                .padding(c.defaultPadding)
                
                ScrollView {
                    VStack(spacing: 40) {
                        ForEach(themeListVM.themeCellViewModels) { themeCellVM in
                            ZStack {
                                NavigationLink(tag: themeCellVM.id, selection: $isActive) {
                                    ThemeView()
                                } label: {
                                    Color.clear
                                }
                                .disabled(true)
                                MainThemeItem(themeCellVM: themeCellVM)
                                    .onTapGesture {
                                        isActive = themeCellVM.id
                                    }
                            }
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundColor(.primary)
            .preferredColorScheme(.dark)
        }
    }
    
    struct c {
        static let defaultPadding: CGFloat = 20.0
        static let iconSize: CGFloat = 20.0
    }
}

// MARK: PREVIEWS
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
