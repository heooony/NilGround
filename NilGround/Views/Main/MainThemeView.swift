//
//  MainThemeView.swift
//  NilGround
//
//  Created by 김동헌 on 2022/07/06.
//

import SwiftUI

struct MainThemeView: View {
    
    let themeCellVM: ThemeCellViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image("cafe")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width)
            
            LinearGradient(colors: [
                .black.opacity(0.4),
                .black.opacity(0.2),
                .clear,
                .black.opacity(0.3),
                .black.opacity(0.6),
            ], startPoint: .top, endPoint: .bottom)
            
            VStack(alignment: .leading, spacing: 8.0) {
                Spacer()
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
                    .padding(.bottom, 20)
                
                Text(themeCellVM.theme.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)
                
                Text("\(Date(timeIntervalSince1970: TimeInterval(themeCellVM.theme.createdDate!.seconds)))")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                
                Text(themeCellVM.theme.description)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.white)
                    .padding(.bottom, 40)
            }
            .padding(.all, 20.0)
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "xmark")
                    .font(.body.weight(.bold))
                    .foregroundColor(.secondary)
                    .padding(8)
                    .background(.ultraThinMaterial, in: Circle())
            }
            .padding(30)
            .padding(.top, 25)
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

//struct MainThemeView_Previews: PreviewProvider {
//    
//    static var previews: some View {
//        MainThemeView()
//    }
//}
