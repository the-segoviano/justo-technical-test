//
//  RandomUserDOB.swift
//  Justo Technical Test
//
//  Created by Luis Segoviano on 25/01/20.
//  Copyright © 2020 Luis Segoviano. All rights reserved.
//

import Foundation

struct RandomUserDOB {
    
    var date: String = ""
    var age: Int = 0
    
    init(randomUserDob: Dictionary<String, Any>) {
        if let date = randomUserDob["date"] as? String {
            self.date = date
        }
        if let age = randomUserDob["age"] as? Int {
            self.age = age
        }
    }
    
}
