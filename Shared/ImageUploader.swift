//
//  ImageUploader.swift
//  Instagram (iOS)
//
//  Created by KANISHK VIJAYWARGIYA on 11/05/21.
//

import UIKit
import Firebase

struct ImageUploader {
    static func uploadImage(image: UIImage, completion: @escaping(String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        
        // to grenerate unique identifier for the image & name it in file name
        let filename = NSUUID().uuidString
        
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        
        ref.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print("upload image error \(error.localizedDescription)")
                return
            }
            
            print("Successfully uploaded image")
            
            ref.downloadURL { url, _ in
                guard let imageUrl = url?.absoluteString else { return }
                completion(imageUrl)
            }
        }
    }
}
