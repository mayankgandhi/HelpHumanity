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
    let dbClient = Firestore.firestore()
    @EnvironmentObject var data:UserData
    
    
    var body: some View {
        NavigationView {
            List(self.data.organisations) { org in
                NavigationLink(destination: DetailView(organisation: org)) {
                    OrganisationRow(organisation: org)
                    
                }
            }
                .navigationBarTitle(Text("Organisations"))
        }
    }
}



struct OrganisationView_Previews: PreviewProvider {
    static var previews: some View {
        OrganisationView()
    }
}
