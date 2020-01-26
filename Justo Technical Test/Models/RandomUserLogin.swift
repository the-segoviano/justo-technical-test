//
//  RandomUserLogin.swift
//  Justo Technical Test
//
//  Created by Luis Segoviano on 25/01/20.
//  Copyright © 2020 Luis Segoviano. All rights reserved.
//

import Foundation

struct RandomUserLogin {
    
    var uuid: String = ""
    var username: String = ""
    var password: String = ""
    var salt: String = ""
    var md5: String = ""
    var sha1: String = ""
    var sha256: String = ""
    
    init(randomUserLoginDictionary: Dictionary<String, Any>) {
        
        if let uuid = randomUserLoginDictionary["uuid"] as? String {
            self.uuid = uuid
        }
        
        if let username = randomUserLoginDictionary["username"] as? String {
            self.username = username
        }
        
        if let password = randomUserLoginDictionary["password"] as? String {
            self.password = password
        }
        
        if let salt = randomUserLoginDictionary["salt"] as? String {
            self.salt = salt
        }
        
        if let md5 = randomUserLoginDictionary["md5"] as? String {
            self.md5 = md5
        }
        
        if let sha1 = randomUserLoginDictionary["sha1"] as? String {
            self.sha1 = sha1
        }
        
        if let sha256 = randomUserLoginDictionary["sha256"] as? String {
            self.sha256 = sha256
        }
        
    }
    
}
