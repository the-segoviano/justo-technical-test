//
//  Extension+UIImageView.swift
//  Justo Technical Test
//
//  Created by Luis Segoviano on 25/01/20.
//  Copyright © 2020 Luis Segoviano. All rights reserved.
//
import Foundation
import UIKit

extension UIImageView {
    
    func setImageFor(url :URL, completion: @escaping (UIImage) -> ()) {
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url)
            if let data = data {
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    completion(image!)
                }
            }
        }
    }
    
}
