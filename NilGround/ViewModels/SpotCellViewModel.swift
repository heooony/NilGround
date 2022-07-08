//
//  SpotCellViewModel.swift
//  NilGround
//
//  Created by 김동헌 on 2022/07/08.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class SpotCellViewModel: ObservableObject, Identifiable {
    @Published var spot: Spot
    
    init(spot: Spot) {
        self.spot = spot
    }
}
