//
//  NilGroundApp.swift
//  NilGround
//
//  Created by 김동헌 on 2022/06/27.
//

import SwiftUI

@main
struct NilGroundApp: App {
    private let viewModel = MainViewModel()
    var body: some Scene {
        WindowGroup {
            MainView(viewModel: viewModel)
        }
    }
}
