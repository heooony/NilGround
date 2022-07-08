//
//  Categories.swift
//  NilGround
//
//  Created by 김동헌 on 2022/07/07.
//

import Foundation

struct Category: Identifiable, Equatable, Hashable {
    var id = UUID().uuidString
    let name: String
    let iconImagePath: String
}

let categories = [
    Category(name: "Activity", iconImagePath: "figure.walk"),
    Category(name: "Food", iconImagePath: "fork.knife"),
    Category(name: "Cafe", iconImagePath: "cup.and.saucer.fill")
]

