//
//  SpotListView.swift
//  NilGround
//
//  Created by 김동헌 on 2022/07/22.
//

import SwiftUI

struct SpotListView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var selection: String? = ""
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 30) {
                
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .font(.system(size: 30))
                        .foregroundColor(.primary)
                }
                .padding(.leading, 10)
                
                LazyVGrid(columns: [GridItem(), GridItem()], alignment: .leading, spacing: 50) {
                    ForEach(1..<7, id: \.self) { index in
                        VStack(alignment: .leading, spacing: 4) {
                            Color.clear
                                .aspectRatio(1, contentMode: .fill)
                                .overlay(
                                    Image("post\(index)")
                                        .resizable()
                                        .scaledToFill()
                                )
                                .contentShape(Rectangle())
                                .clipped()
                                .onTapGesture {
                                    print("click")
                                }
                            
                            VStack(alignment: .leading, spacing: 5) {
                                Text("경기도 성남시 수정구")
                                    .font(.caption2)
                                    .foregroundColor(.secondary)
                                
                                Text("탄천 나무 벤치")
                                    .font(.body)
                                    .foregroundColor(.primary)
                            }
                            .padding(.horizontal, 10)
                            .padding(.vertical, 15)
                        }
                        .background(
                            .ultraThinMaterial
                        )
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
        .background(
            .thinMaterial
        )
        .background(
            Image("cafe")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .cornerRadius(15)
        )
    }
}

struct SpotListView_Previews: PreviewProvider {
    static var previews: some View {
        SpotListView()
    }
}
