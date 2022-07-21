//
//  ThemeListViewModel.swift
//  NilGround
//
//  Created by 김동헌 on 2022/07/21.
//

import Foundation
import Combine
import SwiftUI

class ThemeListViewModel: ObservableObject, Identifiable {
    @Published var themeRepository = ThemeRepository()
    @Published var themeCellViewModels = [ThemeCellViewModel]()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        themeRepository.$themes.map { themes in
            themes.map { theme in
                ThemeCellViewModel(theme: theme)
            }
        }
        .assign(to: \.themeCellViewModels, on: self)
        .store(in: &cancellables)
    }
    
    func fetchData() {
        themeRepository.fetchData()
    }
    
    func getTheme(id: String, compleationHandler: @escaping (Theme) -> Void) {
        themeRepository.getTheme(id) { theme in
            compleationHandler(theme)
        }
    }
    
    func addTheme(theme: Theme, compleationHandler: @escaping (String) -> Void) {
        themeRepository.addTheme(theme) { id in
            compleationHandler(id)
        }
    }
    
    func uploadImage(image: UIImage, compleationHandler: @escaping (String?) -> Void) {
        themeRepository.uploadImage(image: image) { path in
            compleationHandler(path)
        }
    }
}
