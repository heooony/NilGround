//
//  ThemeRepository.swift
//  NilGround
//
//  Created by 김동헌 on 2022/07/05.
//

import Foundation
import FirebaseStorage
import FirebaseFirestore
import FirebaseFirestoreSwift
import UIKit

class ThemeRepository: ObservableObject {
    let storage = Storage.storage()
    let db = Firestore.firestore()
    
    @Published var themes = [Theme]()
    
    func loadThemes() {
        db.collection("themes").addSnapshotListener { querySnapshot, err in
            if let querySnapshot = querySnapshot {
                self.themes = querySnapshot.documents.compactMap { document in
                    do {
                        let x = try document.data(as: Theme.self)
                        return x
                    }
                    catch {
                        print(err!)
                    }
                    return nil
                }
                print("DEBUG: \(self.themes)")
            }
        }
    }
    
    func getTheme(_ id: String, compleationHandler: @escaping (Theme) -> Void) {
        db.collection("themes").document(id).getDocument(as: Theme.self) { result in
            switch result {
               case .success(let exist): compleationHandler(exist)
               case .failure(let error): print(error)
            }
        }
    }
    
    func addTheme(_ theme: Theme, compleationHandler: @escaping () -> Void) {
        do {
            let _ = try db.collection("themes").addDocument(from: theme) { _ in
                compleationHandler()
            }
        } catch {
            fatalError("Unable to encode theme: \(error.localizedDescription)")
        }
    }
    
    
    func uploadImage(image: UIImage, compleationHandler: @escaping (String?) -> Void) -> Void {
        let path = "themes/\(UUID().uuidString)"
        let storageRef = storage.reference(withPath: path)
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        storageRef.putData(imageData, metadata: nil) { metadata, err in
            if let err = err {
                fatalError(err.localizedDescription)
            }
            storageRef.downloadURL { url, err in
                compleationHandler(url?.absoluteString)
                if let err = err {
                    fatalError(err.localizedDescription)
                }
            }
        }
    }
}
