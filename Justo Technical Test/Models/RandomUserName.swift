//
//  RandomUserName.swift
//  Justo Technical Test
//
//  Created by Luis Segoviano on 25/01/20.
//  Copyright © 2020 Luis Segoviano. All rights reserved.
//

import Foundation

struct RandomUserName {
    
    var title: String = ""
    var first: String = ""
    var last: String  = ""
    
    init(nameDictionary: Dictionary<String, Any>) {
        if let title = nameDictionary["title"] as? String {
            self.title = title
        }
        if let first = nameDictionary["first"] as? String {
            self.first = first
        }
        if let last = nameDictionary["last"] as? String {
            self.last = last
        }
    }
    
    func getFullUserName() -> String {
        return "\(title) \(first) \(last)"
    }
    
}
