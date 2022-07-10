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
    @Namespace var animation
    @State var detail = false
    
    init() {
        themeListVM.loadThemes()
    }
    
    var body: some View {
        
        ZStack {
            VStack(alignment: .leading) {
                
                HStack {
                    Text("Nil-Ground")
                        .font(.title)
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
                
                ScrollView {
                    VStack(spacing: 40) {
                        ForEach(themeListVM.themeCellViewModels) { themeCellVM in
                            ZStack {
                                NavigationLink(tag: themeCellVM.id, selection: $isActive) {
                                    ThemeView(themeCellVM: themeCellVM)
                                } label: {
                                    Color.clear
                                }
                                .disabled(true)
                                
                                MainThemeItem(themeCellVM: themeCellVM)
                            }
                        }
                    }
                    
                }
            }
            NavigationLink {
                AddTheme()
            } label: {
                Image(systemName: "plus")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(20)
                    .background(
                        Circle()
                            .foregroundColor(Color(0xFF6666))
                    )
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                    .padding(20)
            }
            .buttonStyle(PlainButtonStyle())
        }
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
