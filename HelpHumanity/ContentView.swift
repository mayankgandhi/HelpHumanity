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
    
    var dbClient:Firestore
    
    init() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        dbClient = appDelegate.db as! Firestore
    }
    
    fileprivate func getDatafromFirestore() {
        dbClient.collection("organisations").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    
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
                    self.getDatafromFirestore()
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
