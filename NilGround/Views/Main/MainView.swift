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
    @State var autoInTheme = false
    @State var root: Bool = false
    
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
                        ForEach(themeListVM.themeCellViewModels) { themeCellVM in
                            ZStack {
                                NavigationLink(tag: themeCellVM.id, selection: $isActive) {
                                    ThemeView(root: $root)
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
