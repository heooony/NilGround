//
//  AddTheme.swift
//  NilGround
//
//  Created by 김동헌 on 2022/07/07.
//

import SwiftUI

struct AddTheme: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var themeListVM = ThemeListViewModel()
    @State var isShowingPhotoPicker = false
    @State private var themeImage = UIImage(named: "empty")!
    @State private var title = ""
    @State private var description = ""
    @State private var category = categories.first!
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("카테고리 정보")) {
                        Picker(category.name, selection: $category) {
                            ForEach(categories) { category in
                                Text(category.name)
                                    .tag(category)
                            }
                        }
                        .pickerStyle(.automatic)
                    }
                    
                    Section(header: Text("케마 정보")) {
                        TextField("제목", text: $title)
                        TextField("설명", text: $description)
                    }
                    
                    Section(header: Text("사진 정보")) {
                        Button {
                            isShowingPhotoPicker = true
                        } label: {
                            Text("이미지 선택하기")
                        }

                    }
                    
                    Section(header: Text("Preview")) {
                        preview
                            .padding(.horizontal, -10)
                            .padding(.all, 20)
                    }
                }
                
                HStack {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("취소")
                            .foregroundColor(.red)
                            .frame(maxWidth: .infinity)
                    }
                    Divider()
                    Button {
                        addTheme()
                    } label: {
                        Text("등록")
                            .frame(maxWidth: .infinity)
                    }
                }
                .frame(height: 30)

            }
            .navigationTitle("테마 제작")
        }
        .sheet(isPresented: $isShowingPhotoPicker) {
            PhotoPicker(themeImage: $themeImage)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
    func addTheme() {
        themeListVM.uploadImage(image: themeImage) { path in
            if let path = path {
                let theme = Theme(title: title, description: description, image: path, category: category.name)
                themeListVM.addTheme(theme: theme)
                presentationMode.wrappedValue.dismiss()
            }
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    var preview: some View {
        VStack {
            ZStack(alignment: .topLeading) {
                Image(uiImage: themeImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .contentShape(RoundedRectangle(cornerRadius: 0))
                    .clipShape(CustomCorner(corners: [.topLeft, .topRight], radius: 30.0))
                    .clipped()
                
                Image(systemName: category.iconImagePath)
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
                Text(title.isEmpty ? "제목을 입력하세요" : title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.linearGradient(colors: [.primary, .primary.opacity(0.7)], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)
                
                Text("\(Date.now)")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                    .foregroundStyle(.secondary)
                
                Text(description.isEmpty ? "설명을 입력하세요" : description)
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
                .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 10)
        )
    }
}

struct AddTheme_Previews: PreviewProvider {
    static var previews: some View {
        AddTheme()
    }
}
