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
    let spotCount: Int
    let hits: Int
    @ServerTimestamp var createdDate: Timestamp?
    
    init(title: String, description: String, image: String) {
        self.title = title
        self.description = description
        self.image = image
        self.stars = 0
        self.spotCount = 0
        self.hits = 0
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case image
        case stars
        case spotCount
        case hits
        case createdDate
    }

}
