//
//  ContentView.swift
//  NilGround
//
//  Created by 김동헌 on 2022/06/27.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedIndex = 0
    
    let tabBarImageNames = ["house", "gearshape"]
    
    init() {
        UITabBar.appearance().barTintColor = .systemBackground
    }
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    switch selectedIndex {
                    case 0:
                        MainView()
                    case 1:
                        Text("Remaining tabs2")
                    default:
                        Text("")
                    }
                
                }
                
                Spacer()
                
                HStack {
                    ForEach(0..<2) { num in
                        Button {
                            selectedIndex = num
                        } label: {
                            Spacer()
                            Image(systemName: tabBarImageNames[num])
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(selectedIndex == num ? Color(.black) : .init(white: 0.8))
                            
                            Spacer()
                        }

                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
