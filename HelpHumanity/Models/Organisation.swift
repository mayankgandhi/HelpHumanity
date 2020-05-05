//
//  Organisation.swift
//  HelpHumanity
//
//  Created by Mayank on 04/05/20.
//  Copyright © 2020 Mayank. All rights reserved.
//
import SwiftUI
import CoreLocation

struct Contact: Codable {
    var email:String?
    var name:String?
    var phone:String?
    var title:String?
    
//    init(email:String, name:String, phone:String, title:String)  {
//        self.name = name
//        self.email = email
//        self.phone = phone
//        self.title = title
//    }
}

//enum Cause: String, CaseIterable, Codable, Hashable {
//    case children = "Children"
//    case education = "Education"
//    case women = "Women"
//    case diffAbled = "Differently Abled"
//    case health = "Health"
//    case covid = "Covid-19"
//    case hunger = "Hunger"
//}


struct Organisation: Codable {
    
    
     var id: String
    
     var abbreviation:String
     var cause: String
     var city: String
     var contact: Contact
     var country: String
     var donationLink:String
     var orgName: String
     var parentOrg: String
     var website:String
     var locationCoordinate: CLLocationCoordinate2D?
    
//    init(id: String, abbreviation: String, cause: String, city: String, email: String, name: String, phone: String, title: String, country: String, donationLink: String, latitude: Double, longitude: Double, orgName: String, parentOrg: String, website: String) {
//        self.id = id
//        self.abbreviation = abbreviation
//        self.cause = cause
//        self.city = city
//        self.contact = Contact(email: email, name: name, phone: phone, title: title)
//        self.country = country
//        self.donationLink = donationLink
//        self.orgName = orgName
//        self.parentOrg = parentOrg
//        self.website = website
//        self.locationCoordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
//    }
}
