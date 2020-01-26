//
//  RandomUserID.swift
//  Justo Technical Test
//
//  Created by Luis Segoviano on 25/01/20.
//  Copyright © 2020 Luis Segoviano. All rights reserved.
//

import Foundation

struct RandomUserID {
    
    var name: String = ""
    var value: String = ""
    
    init(randomUserId: Dictionary<String, Any>) {
        if let name = randomUserId["name"] as? String {
            self.name = name
        }
        if let value = randomUserId["value"] as? String {
            self.value = value
        }
    }
    
}
