//
//  Organisation.swift
//  HelpHumanity
//
//  Created by Mayank on 04/05/20.
//  Copyright © 2020 Mayank. All rights reserved.
//

import Foundation
import Firebase

// A type that can be initialized from a Firestore document.
protocol DocumentSerializable {
    init?(dictionary: [String: Any])
}

struct Organisation: Identifiable, Codable {

    let id = UUID()
    var abbreviation:String
    var cause:String
    var city:String
    var country:String
    var donationLink:String
    var locationLongitude:Double
    var locationLatitude:Double
    var orgName:String
    var parentOrg:String
    var website:String
    
    enum CodingKeys: String, CodingKey {
        case abbreviation
        case cause
        case city
        case country
        case donationLink
        case locationLongitude
        case locationLatitude
        case orgName
        case parentOrg
        case website
    }
    
    
    var dictionary: [String: Any] {
        return [
            "abbreviation": abbreviation,
            "cause": cause,
            "city": city,
            "country": country,
            "donationLink": donationLink,
            "locationLongitude": locationLongitude,
            "locationLatitude": locationLatitude,
            "orgName": orgName,
            "parentOrg": parentOrg,
            "website": website
        ]
    }
    
}

extension Organisation: DocumentSerializable {
    
    
    init?(dictionary: [String : Any]) {
        guard let abbreviation = dictionary["abbreviation"] as? String,
            let cause = dictionary["cause"] as? String,
            let city = dictionary["city"] as? String,
            let country = dictionary["country"] as? String,
            let donationLink = dictionary["donationLink"] as? String,
            let locationLongitude = dictionary["locationLongitude"] as? Double ,
            let locationLatitude = dictionary["locationLatitude"] as? Double,
            let orgName = dictionary["orgName"] as? String,
            let parentOrg = dictionary["parentOrg"] as? String,
            let website = dictionary["website"] as? String else { return nil }
        
        self.init(
            abbreviation: abbreviation, cause: cause,
            city: city,
            country: country,
            donationLink: donationLink,
            locationLongitude: locationLongitude,
            locationLatitude: locationLatitude,
            orgName: orgName,
            parentOrg: parentOrg,
            website: website)
    }
}


