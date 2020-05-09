//
//  HomeView.swift
//  HelpHumanity
//
//  Created by Mayank on 09/05/20.
//  Copyright © 2020 Mayank. All rights reserved.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct HomeView: View {
    
    @EnvironmentObject var data:UserData
    
    var categories: [String: [Organisation]] {
        Dictionary(
            grouping: self.data.organisations,
            by: { $0.cause }
        )
    }
    var body: some View {
        NavigationView {
            List {
                ForEach(categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: self.categories[key]!)
                }
            }
            .navigationBarTitle(Text("Featured"))
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
