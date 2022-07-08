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
        VStack {
            ZStack(alignment: .topLeading) {
                WebImage(url: URL(string: themeCellVM.theme.image))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .contentShape(RoundedRectangle(cornerRadius: 0))
                    .clipShape(CustomCorner(corners: [.topLeft, .topRight], radius: 30.0))
                    .clipped()
                
                Image(systemName: "cup.and.saucer.fill")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 26.0, height: 26.0)
                    .cornerRadius(10)
                    .padding(10)
                    .background(
                        .thinMaterial, in: RoundedRectangle(
                            cornerRadius: 16, style: .continuous
                        )
                    )
                    .padding(15)
            }
            
            VStack(alignment: .leading, spacing: 8.0) {
                Text(themeCellVM.theme.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.linearGradient(colors: [.primary, .primary.opacity(0.7)], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)
                
                Text("\(Date(timeIntervalSince1970: TimeInterval(themeCellVM.theme.createdDate!.seconds)))")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)
                
                Text(themeCellVM.theme.description)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.secondary)
            }
            .padding(.all, 20.0)
            
            Spacer()
        }
        .frame(height: 350.0)
        .background(
            RoundedRectangle(cornerRadius: 30.0, style: .continuous)
                .foregroundColor(.white)
                .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 10)
        )
        .padding(.horizontal, 20)
    }
}

struct MainThemeItem_Previews: PreviewProvider {
    @ObservedObject var themeListVM = ThemeListViewModel()
    static var previews: some View {
        MainView()
    }
}
