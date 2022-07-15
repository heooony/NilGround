//
//  ThemeItem.swift
//  NilGround
//
//  Created by 김동헌 on 2022/07/06.
//

import SwiftUI
import SDWebImageSwiftUI

struct MainThemeItem: View {
    let themeCellVM: ThemeCellViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image("profile")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                
                VStack(alignment: .leading) {
                    Text("heo____ney")
                        .font(.headline)
                    
                    Text("")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                Image(systemName: "ellipsis")
                    .font(.title2)
            }
            
            GeometryReader { proxy in
                let size = proxy.size
                
                WebImage(url: URL(string: themeCellVM.theme.image))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width, height: size.height)
                    .cornerRadius(15)
                
                LinearGradient(colors: [
                    .black.opacity(0.7),
                    .black.opacity(0.5),
                    .black.opacity(0.4),
                    .clear,
                    .black.opacity(0.3),
                    .black.opacity(0.5),
                ], startPoint: .top, endPoint: .bottom)
                .cornerRadius(15)
                
                Text(themeCellVM.theme.title)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                    .shadow(color: .black.opacity(0.4), radius: 5, x: 0, y: 0)
            }
            .frame(height: 200)
            
            VStack(alignment: .leading, spacing: 10) {
                StarsView(rating: 4.5)
                
                HStack {
                    Text("\(themeCellVM.theme.spotCount) spot")
                        .font(.callout)
                        .fontWeight(.semibold)
                    
                    Text("\(themeCellVM.theme.hits) hits")
                        .font(.callout)
                        .fontWeight(.semibold)
                }
                .foregroundColor(.secondary)
            }
            
            Text(themeCellVM.theme.description)
                .font(.footnote)
                .fontWeight(.semibold)
                .lineLimit(3)
        }
        .padding()
    }
}

struct MainThemeItem_Previews: PreviewProvider {
    @ObservedObject var themeListVM = ThemeListViewModel()
    static var previews: some View {
        MainView()
    }
}
