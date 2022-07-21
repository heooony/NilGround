//
//  AddTheme.swift
//  NilGround
//
//  Created by 김동헌 on 2022/07/07.
//

import SwiftUI
import Combine

struct AddTheme: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var themesVM = ThemeListViewModel()
    @State var isShowingPhotoPicker = false
    @State private var themeImage = UIImage(named: "empty")!
    @State private var title = ""
    @State private var description = ""
    @State private var showingAlert = false
    @State private var isActive: String?
    @State private var go: String = "go"
    @State private var id: String = ""
    @Binding var root: Bool
    
    let maxTitleLength = Int(25)
    let maxDescriptionLength = Int(100)
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("테마 정보")) {
                        TextField("제목", text: $title)
                            .onReceive(Just(title), perform: { _ in
                                if maxTitleLength < title.count {
                                    title = String(title.prefix(maxTitleLength))
                                }
                            })
                        TextField("설명", text: $description)
                            .onReceive(Just(description), perform: { _ in
                                if maxDescriptionLength < description.count {
                                    description = String(description.prefix(maxDescriptionLength))
                                }
                            })
                        Button {
                            isShowingPhotoPicker = true
                        } label: {
                            Text("이미지 선택하기")
                        }
                    }
                    
                    Section(header: Text("Preview")) {
                        preview
                            .padding(0)
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
                        uploadTheme()
                    } label: {
                        Text("등록")
                            .frame(maxWidth: .infinity)
                    }
                    .background(
                        NavigationLink(tag: go, selection: $isActive) {
                            ThemeView(root: $root, id: id)
                        } label: {
                            EmptyView()
                        }
                    )
                    .alert(isPresented: $showingAlert) {
                        Alert(title: Text("Error!"), message: Text("예기치 못한 이유로 업로드가 되지 않았습니다."), dismissButton: .default(Text("Dismiss")))
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
        .preferredColorScheme(.dark)
    }
    
    func uploadTheme() {
        themesVM.uploadImage(image: themeImage) { path in
        isActive = ""
            if let path = path {
                let theme = Theme(title: title, description: description, image: path)
                themesVM.addTheme(theme: theme) { id in
                    self.id = id
                    isActive = "go"
                }
            } else {
                self.showingAlert = true
            }
        }
    }
    
    var preview: some View {
        VStack(alignment: .leading, spacing: 12) {
            GeometryReader { proxy in
                let size = proxy.size
                
                Image(uiImage: themeImage)
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
                
                Text(title)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                    .shadow(color: .black.opacity(0.4), radius: 5, x: 0, y: 0)
            }
            .frame(height: 200)
            
            VStack(alignment: .leading, spacing: 10) {
                StarsView(rating: 0)
                
                HStack {
                    Text("0 spot")
                        .font(.callout)
                        .fontWeight(.semibold)
                    
                    Text("0 hits")
                        .font(.callout)
                        .fontWeight(.semibold)
                }
                .foregroundColor(.secondary)
            }
            
            Text(description)
                .font(.footnote)
                .fontWeight(.semibold)
                .lineLimit(3)
        }
        .padding()
    }
}

struct AddTheme_Previews: PreviewProvider {
    static var previews: some View {
        AddTheme(root: .constant(true))
    }
}
