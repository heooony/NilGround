//
//  TestView.swift
//  NilGround
//
//  Created by 김동헌 on 2022/07/04.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var themesViewModel = ThemesViewModel()
    @Environment(\.colorScheme) var colorScheme
    @State var isActive: String? = ""
    @Namespace var animation
    @State var detail = false
    @State var autoInTheme = false
    @State var root: Bool = false
    
    init() {
        themesViewModel.loadThemes()
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
                    NavigationLink(isActive: $root) {
                        AddTheme(root: $root)
                    } label: {
                        Image(systemName: "plus.viewfinder")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: c.iconSize, height: c.iconSize)
                            .shadow(radius: 1)
                            .onTapGesture {
                                root = true
                            }
                    }
                }
                .overlay(
                    Text("Nil-Ground")
                        .font(.title2)
                )
                .padding(c.defaultPadding)
                
                ScrollView {
                    VStack(spacing: 40) {
                        ForEach(themesViewModel.themes) { theme in
                            ZStack {
                                NavigationLink(tag: theme.id, selection: $isActive) {
                                    ThemeView(root: $root, id: theme.id)
                                } label: {
                                    Color.clear
                                }
                                .disabled(true)
                                MainThemeItem(theme: theme)
                                    .onTapGesture {
                                        isActive = theme.id
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
