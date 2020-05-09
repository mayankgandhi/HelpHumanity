//
//  OrganisationView.swift
//  HelpHumanity
//
//  Created by Mayank on 05/05/20.
//  Copyright © 2020 Mayank. All rights reserved.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct ContentView: View {
    
    @EnvironmentObject var data:UserData
    let dbClient = Firestore.firestore()
    var body: some View {
        
        TabView {
            
            HomeView().animation(.spring(response: 2, dampingFraction: 2, blendDuration: 2))
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("Home")
            }
            OrganisationView().animation(.spring(response: 2, dampingFraction: 2, blendDuration: 2))
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("Organisations")
            }
        }.onAppear(perform: {
            DispatchQueue.main.async {
                self.getOrganisationData()
            }
        })
            .font(.headline)
        
    }
}

extension ContentView {
    
    func addOrganisationData()   {
        
        let org = Organisation(abbreviation: "WHO", cause: "covid-19", city: "", country: "Global", donationLink: "https://covid19responsefund.org/", locationLongitude: 10, locationLatitude: -20, orgName: "COVID-19 Solidarity Response Fund", parentOrg: "United Nations", website: "https://covid19responsefund.org/")
        
        do {
            try dbClient.collection("organisations").document(org.orgName).setData(org.dictionary)
        } catch let error {
            print("Error writing city to Firestore: \(error)")
        }
        
        let cont = Contact(name: "Covid-19 Fund", email: "covid19fund@unfoundation.org", phone: "-", title: "-")
        do {
            try dbClient.collection("contacts").document(org.orgName).setData(cont.dictionary)
        } catch let error {
            print("Error writing city to Firestore: \(error)")
        }
    }
    
    func getOrganisationData()  {
        dbClient.collection("organisations").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                self.data.organisations.removeAll()
                for document in querySnapshot!.documents {
                    let result = Result {
                        try document.data(as: Organisation.self)
                    }
                    switch result {
                    case .success(let org):
                        if let org = org {
                            self.data.organisations.append(org)
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


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
