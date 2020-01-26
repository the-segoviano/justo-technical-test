//
//  RandomUser.swift
//  Justo Technical Test
//
//  Created by Luis Segoviano on 25/01/20.
//  Copyright © 2020 Luis Segoviano. All rights reserved.
//

import Foundation

struct RandomUser {
    
    var gender: String = ""
    var email: String = ""
    var phone: String = ""
    var cell: String = ""
    var nat: String = ""
    var name: RandomUserName?
    var location: RandomUserLocation?
    var login: RandomUserLogin?
    var dob: RandomUserDOB?
    var registered: RandomUserRegistered?
    var id: RandomUserID?
    var picture: RandomUserPicture?
    
    init(randomUserDictionary: Dictionary<String, Any>) {
        
        if let gender = randomUserDictionary["gender"] as? String {
            self.gender = gender
        }
        
        if let email = randomUserDictionary["email"] as? String {
            self.email = email
        }
        
        if let phone = randomUserDictionary["phone"] as? String {
            self.phone = phone
        }
        
        if let cell = randomUserDictionary["cell"] as? String {
            self.cell = cell
        }
        
        if let nat = randomUserDictionary["nat"] as? String {
            self.nat = nat
        }
        
        if let nameDictionary = randomUserDictionary["name"] as? Dictionary<String, Any> {
            self.name = RandomUserName(nameDictionary: nameDictionary)
        }
        
        if let locationDictionary = randomUserDictionary["location"] as? Dictionary<String, Any> {
            self.location = RandomUserLocation(randomUserLocation: locationDictionary)
        }
        
        if let loginDictionary = randomUserDictionary["login"] as? Dictionary<String, Any> {
            self.login = RandomUserLogin(randomUserLoginDictionary: loginDictionary)
        }
        
        if let dobDictionary = randomUserDictionary["dob"] as? Dictionary<String, Any> {
            self.dob = RandomUserDOB(randomUserDob: dobDictionary)
        }
        
        if let registeredDictionary = randomUserDictionary["registered"] as? Dictionary<String, Any> {
            self.registered = RandomUserRegistered(randomUserRegistered: registeredDictionary)
        }
        
        if let idDictionary = randomUserDictionary["id"] as? Dictionary<String, Any> {
            self.id = RandomUserID(randomUserId: idDictionary)
        }
        
        if let pictureDictionary = randomUserDictionary["picture"] as? Dictionary<String, Any> {
            self.picture = RandomUserPicture(randomUserPicture: pictureDictionary)
        }
        
    }
    
}


