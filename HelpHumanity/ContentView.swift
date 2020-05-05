//
//  ContentView.swift
//  HelpHumanity
//
//  Created by Mayank on 04/05/20.
//  Copyright © 2020 Mayank. All rights reserved.
//

import SwiftUI
import FirebaseFirestore

struct ContentView: View {
    
    @State var data:[Organisation] = []
    var x = String.init()
    
    func getOrgData()   {
        
        let dbClient = Firestore.firestore()
        dbClient.collection("organisations").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    let id = document.documentID as String?
                    
                    let jsonData = document.data()
                    let website = jsonData["website"] as! String
                    let country = jsonData["country"] as! String
                    
                    let parentOrg = jsonData["parentOrg"] as! String
                    let city = jsonData["city"] as! String
                    let abbreviation = jsonData["abbreviation"] as! String
                    let orgName = jsonData["name"] as! String
                    let donationLink = jsonData["donationLink"] as! String
                    let cause = jsonData["cause"] as! String
                    let location:GeoPoint = jsonData["location"] as! GeoPoint
                    let latitude = location.latitude
                    let longitude = location.longitude
                    
                    if let idData = jsonData["contact"] as? [String: Any] {
                        let email = idData["email"] as? String
                        let phone = idData["phone"] as? String
                        let name = idData["name"] as? String
                        let title = idData["title"] as? String
                        
                        let org = Organisation(id: id!, abbreviation: abbreviation, cause: cause, city: city, email: email!, name:name!, phone:phone!, title:title!, country: country, donationLink: donationLink, latitude: latitude, longitude: longitude, orgName: orgName, parentOrg: parentOrg, website: website)
                        print("Organisation............",org)
                        self.data.append(org)
                    }
                }
            }
        }
    }
    
    
    
    var body: some View {
        
        VStack {
            MapView()
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)
            
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                Text("Turtle Rock")
                    .font(.title)
                HStack(alignment: .top) {
                    Text("Joshua Tree National Park")
                        .font(.subheadline)
                    Spacer()
                    Text("California")
                        .font(.subheadline)
                }
                
                Button(action: {
                    self.getOrgData()
                }) {
                    Text("Pull Data")
                }
                
            }
            .padding()
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
