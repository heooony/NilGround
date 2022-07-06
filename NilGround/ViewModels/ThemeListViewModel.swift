//
//  ThemeListViewModel.swift
//  NilGround
//
//  Created by 김동헌 on 2022/07/05.
//

import Foundation
import Combine

class ThemeListViewModel: ObservableObject {
    @Published var themeRepository = ThemeRepository()
    @Published var themeCellViewModels = [ThemeCellViewModel]()
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        themeRepository.$themes
            .map { themes in
                themes.map { theme in
                    ThemeCellViewModel(theme: theme)
                }
            }
            .assign(to: \.themeCellViewModels, on: self)
            .store(in: &cancellables)
    }
    
    func getTheme(id: String?) -> Theme {
        let index = themeCellViewModels.firstIndex(where: {$0.id == id})!
        return themeCellViewModels[index].theme
    }
}
