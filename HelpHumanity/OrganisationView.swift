//
//  ContentView.swift
//  HelpHumanity
//
//  Created by Mayank on 04/05/20.
//  Copyright © 2020 Mayank. All rights reserved.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct OrganisationView: View {
    
    @State var organisation: [Organisation] = []
    let dbClient = Firestore.firestore()
    
    var body: some View {
        NavigationView {
            List(organisation) { org in
                NavigationLink(destination: DetailView(organisation: org)) {
                    OrganisationRow(organisation: org)
                    
                }
            }.onAppear(perform: {
                self.getOrganisationData()
            })
                .navigationBarTitle(Text("Organisations"))
        }
    }
}

extension OrganisationView {
    
    fileprivate func addOrganisationData()   {
        
        let org = Organisation(abbreviation: "WHO", cause: "world health", city: "hyderabad", country: "India", donationLink: "www.google.com", locationLongitude: 10, locationLatitude: -20, orgName: "World Health Organisation", parentOrg: "United Nations", website: "who.int")
        
        do {
            try dbClient.collection("organisations").document(org.orgName).setData(org.dictionary)
        } catch let error {
            print("Error writing city to Firestore: \(error)")
        }
        
        let cont = Contact(name: "Contact Name", email: "contact@gmail.com", phone: "+91 121 0231234", title: "Manager")
        do {
            try dbClient.collection("contacts").document(org.orgName).setData(cont.dictionary)
        } catch let error {
            print("Error writing city to Firestore: \(error)")
        }
    }
    
    fileprivate func getOrganisationData()  {
        
        
        dbClient.collection("organisations").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                self.organisation.removeAll()
                for document in querySnapshot!.documents {
                    let result = Result {
                        try document.data(as: Organisation.self)
                    }
                    switch result {
                    case .success(let org):
                        if let org = org {
                            self.organisation.append(org)
                        } else {
                            print("Document does not exist")
                        }
                    case .failure(let error):
                        // An `Organisation` value could not be initialized from the DocumentSnapshot.
                        print("Error decoding city: \(error)")
                    }
                }
            }
        }
    }
    
}

struct OrganisationView_Previews: PreviewProvider {
    static var previews: some View {
        OrganisationView()
    }
}
