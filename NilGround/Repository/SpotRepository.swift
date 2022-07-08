//
//  SpotRepository.swift
//  NilGround
//
//  Created by 김동헌 on 2022/07/08.
//

import Foundation
import FirebaseStorage
import FirebaseFirestore
import FirebaseFirestoreSwift

class SpotRepository: ObservableObject {
    let storage = Storage.storage()
    let db = Firestore.firestore()
    
    @Published var spots = [Spot]()
    
    func getSpotsByThemeId(themeId: String) {
        db.collection("themes").document(themeId).collection("spots").getDocuments() { querySnapshot, err in
            if let querySnapshot = querySnapshot {
                self.spots = querySnapshot.documents.compactMap { document in
                    do {
                        let x = try document.data(as: Spot.self)
                        return x
                    }
                    catch {
                        print(err!)
                    }
                    return nil
                }
            }
        }
    }
}
