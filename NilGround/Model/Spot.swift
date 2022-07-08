//
//  Map.swift
//  NilGround
//
//  Created by 김동헌 on 2022/07/05.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Spot: Codable, Identifiable {
    @DocumentID var id: String?
    let title: String
    let description: String
    let imagePath: String
    var isLiked: Bool = false
}

let spots = [
    Spot(title: "첫 번째 지역: 케이크 파는 많은 곳", description: "누구나 생일 때 먹는 케이크 팔아요", imagePath: "spot1"),
    Spot(title: "두 번째 지역: 곰돌이", description: "생일 때 이거 선물해줘도 돼요", imagePath: "spot2"),
    Spot(title: "세 번째 지역: 수족관", description: "부산 대구를 거쳐 서울로 이전!", imagePath: "spot3")
]
