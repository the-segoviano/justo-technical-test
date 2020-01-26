//
//  RandomUserRegistered.swift
//  Justo Technical Test
//
//  Created by Luis Segoviano on 25/01/20.
//  Copyright © 2020 Luis Segoviano. All rights reserved.
//

import Foundation

struct RandomUserRegistered {
    
    var date: String = ""
    var age: Int = 0
    
    init(randomUserRegistered: Dictionary<String, Any>) {
        if let date = randomUserRegistered["date"] as? String {
            self.date = date
        }
        if let age = randomUserRegistered["age"] as? Int {
            self.age = age
        }
    }
    
}
