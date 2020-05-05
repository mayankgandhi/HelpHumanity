//
//  Contact.swift
//  HelpHumanity
//
//  Created by Mayank on 05/05/20.
//  Copyright © 2020 Mayank. All rights reserved.
//

import Foundation

struct Contact {
    
    var name: String
    var email: String
    var phone: String
    var title: String
    
    
    var dictionary: [String: Any] {
        return [
            "name": name,
            "email": email,
            "phone": phone,
            "title": title,
        ]
    }
    
}

extension Contact: DocumentSerializable {
    
    init?(dictionary: [String : Any]) {
        guard let name = dictionary["rating"] as? String,
            let email = dictionary["userId"] as? String,
            let phone = dictionary["userName"] as? String,
            let title = dictionary["text"] as? String  else { return nil }
        
        self.init(name: name, email: email, phone: phone, title: title)
    }
    
}
