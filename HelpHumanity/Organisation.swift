//
//  Organisation.swift
//  HelpHumanity
//
//  Created by Mayank on 04/05/20.
//  Copyright © 2020 Mayank. All rights reserved.
//
import SwiftUI
import CoreLocation

struct Contact:Hashable, Codable    {
    var email:String
    var name:String
    var phone:String
    var title:String
}

struct Organisation: Hashable, Codable {
    
    var id: Int
    var name: String
    var cause: String
    var city: String
    var contact: Contact
    var country: String
    var location: Coordinates
    var parentOrg: String
    var donationLink:String
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: location.latitude,
            longitude: location.longitude)
    }
    
    enum Cause: String, CaseIterable, Codable, Hashable {
        case children = "Children"
        case education = "Education"
        case women = "Women"
        case diffAbled = "Differently Abled"
        case health = "Health"
        case covid = "Covid-19"
        case hunger = "Hunger"
    }
}
    

struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
}
