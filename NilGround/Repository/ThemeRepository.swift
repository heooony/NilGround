//
//  ThemeRepository.swift
//  NilGround
//
//  Created by 김동헌 on 2022/07/05.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class ThemeRepository: ObservableObject {
    let db = Firestore.firestore()
    
    @Published var themes = [Theme]()
    
    init() {
        loadData()
    }
    
    func loadData() {
        db.collection("Themes").addSnapshotListener { querySnapshow, error in
            if let querySnapshot = querySnapshow {
                self.themes = querySnapshot.documents.compactMap { document in
                    do {
                        let x = try document.data(as: Theme.self)
                        return x
                    }
                    catch {
                        print(error)
                    }
                    return nil
                }
                print("DEBUG: \(self.themes)")
            }
        }
    }
}
