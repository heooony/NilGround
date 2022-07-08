//
//  SpotListViewModel.swift
//  NilGround
//
//  Created by 김동헌 on 2022/07/08.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class SpotListViewModel: ObservableObject {
    @Published var spotRepository = SpotRepository()
    @Published var spotcellViewModels = [SpotCellViewModel]()
    
}
