//
//  RandomUserPicture.swift
//  Justo Technical Test
//
//  Created by Luis Segoviano on 25/01/20.
//  Copyright © 2020 Luis Segoviano. All rights reserved.
//

import Foundation

struct RandomUserPicture {
    
    var large: String = ""
    var medium: String = ""
    var thumbnail: String = ""
    
    init(randomUserPicture: Dictionary<String, Any>) {
        if let large = randomUserPicture["large"] as? String {
            self.large = large
        }
        if let medium = randomUserPicture["medium"] as? String {
            self.medium = medium
        }
        if let thumbnail = randomUserPicture["thumbnail"] as? String {
            self.thumbnail = thumbnail
        }
    }
    
}
