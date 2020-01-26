//
//  RandomUserLocation.swift
//  Justo Technical Test
//
//  Created by Luis Segoviano on 25/01/20.
//  Copyright © 2020 Luis Segoviano. All rights reserved.
//

import Foundation

struct RandomUserLocation {
    
    var city: String    = ""
    var state: String   = ""
    var country: String = ""
    var postcode: Int   = 0
    
    var street: RandomUserStreet?
    var coordinates: RandomUserCoordinates?
    var timezone: RandomUserTimezone?
    
    init(randomUserLocation: Dictionary<String, Any>) {
        if let city = randomUserLocation["city"] as? String {
            self.city = city
        }
        if let state = randomUserLocation["state"] as? String {
            self.state = state
        }
        if let country = randomUserLocation["country"] as? String {
            self.country = country
        }
        if let postcode = randomUserLocation["postcode"] as? Int {
            self.postcode = postcode
        }
        if let street = randomUserLocation["street"] as? Dictionary<String, Any> {
            self.street = RandomUserStreet(randomUserStreetDictionary: street)
        }
        if let coordinates = randomUserLocation["coordinates"] as? Dictionary<String, Any> {
            self.coordinates = RandomUserCoordinates(randomUserCoordinatesDictionary: coordinates)
        }
        if let timezone = randomUserLocation["timezone"] as? Dictionary<String, Any> {
            self.timezone = RandomUserTimezone(randomUserTimezoneDictionary: timezone)
        }
    }
    
    
    func getFullAddress() -> String {
        if street != nil, let street = street {
            return "\(street.name) \(street.number), \(city), \(state), \(postcode), \(country)"
        }
        return ""
    }
    
}




struct RandomUserStreet {
    
    var name: String = ""
    var number: Int   = 0
    
    init(randomUserStreetDictionary: Dictionary<String, Any>) {
        if let name = randomUserStreetDictionary["name"] as? String {
            self.name = name
        }
        if let number = randomUserStreetDictionary["number"] as? Int {
            self.number = number
        }
    }
    
}

struct RandomUserCoordinates {
    
    var latitude: String = ""
    var longitude: String = ""
    
    init(randomUserCoordinatesDictionary: Dictionary<String, Any>) {
        if let latitude = randomUserCoordinatesDictionary["latitude"] as? String {
            self.latitude = latitude
        }
        if let longitude = randomUserCoordinatesDictionary["longitude"] as? String {
            self.longitude = longitude
        }
    }
    
}


struct RandomUserTimezone {
    
    var offset: String = ""
    var description: String = ""
    
    init(randomUserTimezoneDictionary: Dictionary<String, Any>) {
        if let offset = randomUserTimezoneDictionary["offset"] as? String {
            self.offset = offset
        }
        if let description = randomUserTimezoneDictionary["description"] as? String {
            self.description = description
        }
    }
    
}


