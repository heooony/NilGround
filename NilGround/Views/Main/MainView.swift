//
//  TestView.swift
//  NilGround
//
//  Created by 김동헌 on 2022/07/04.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var themesData = ThemeListViewModel()
    @Environment(\.colorScheme) var colorScheme
    @State var isActive: String? = ""
    @State var detail = false
    @State var autoInTheme = false
    
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
                    NavigationLink() {
                        AddTheme()
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
                        ForEach(themesData.themeCellViewModels) { themeVM in
                            ZStack {
                                NavigationLink(tag: themeVM.id, selection: $isActive) {
                                    ThemeView()
                                } label: {
                                    Color.clear
                                }
                                .disabled(true)
                                MainThemeItem(theme: themeVM.theme)
                                    .onTapGesture {
                                        isActive = themeVM.id
                                    }
                            }
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundColor(.primary)
            .preferredColorScheme(.dark)
            .onAppear {
                themesData.fetchData()
            }
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
