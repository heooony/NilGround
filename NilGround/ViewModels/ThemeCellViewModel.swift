//
//  ThemeViewModel.swift
//  NilGround
//
//  Created by 김동헌 on 2022/07/05.
//

import Foundation
import Combine

class ThemeCellViewModel: ObservableObject, Identifiable {
    @Published var theme: Theme
    
    var id = ""
    private var cancellables = Set<AnyCancellable>()
    
    init(theme: Theme) {
        self.theme = theme
        
        $theme
            .compactMap { theme in
                theme.id
            }
            .assign(to: \.id, on: self)
            .store(in: &cancellables)
    }
}
