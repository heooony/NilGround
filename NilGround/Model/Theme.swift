//
//  Theme.swift
//  NilGround
//
//  Created by 김동헌 on 2022/07/04.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Theme: Codable, Identifiable {
    
    @DocumentID var id: String?
    let title: String
    let description: String
    let image: String
    let stars: Int
    let category: String
    @ServerTimestamp var createdDate: Timestamp?
}
