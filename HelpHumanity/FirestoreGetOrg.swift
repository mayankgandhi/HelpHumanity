//
//  FirestoreGetOrg.swift
//  HelpHumanity
//
//  Created by Mayank on 04/05/20.
//  Copyright © 2020 Mayank. All rights reserved.
//

import Foundation
import FirebaseFirestore

class FirestoreGetOrg: ObservableObject {
    
    var dbClient:Firestore
    
    var orgData:[Organisation]?
    
    init() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        dbClient = appDelegate.db as! Firestore
        
        
    }
}
