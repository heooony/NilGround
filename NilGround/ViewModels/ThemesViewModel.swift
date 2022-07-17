//
//  ThemesViewModel.swift
//  NilGround
//
//  Created by 김동헌 on 2022/07/05.
//

import Foundation
import Combine
import SwiftUI

class ThemesViewModel: ObservableObject, Identifiable {
    @Published var themeRepository = ThemeRepository()
    @Published var theme: Theme?
    
    init() {
        themeRepository.loadThemes()
    }
    
    func loadThemes() {
        themeRepository.loadThemes()
    }
    
    func getTheme(id: String) async {
        themeRepository.getTheme(id) { theme in
            self.theme = theme
        }
    }
    
    func addTheme(theme: Theme, compleationHandler: @escaping () -> Void) {
        themeRepository.addTheme(theme) {
            compleationHandler()
        }
    }
    
    func uploadImage(image: UIImage, compleationHandler: @escaping (String?) -> Void) {
        themeRepository.uploadImage(image: image) { path in
            compleationHandler(path)
        }
    }
}
