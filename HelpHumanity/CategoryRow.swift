//
//  CategoryRow.swift
//  HelpHumanity
//
//  Created by Mayank on 09/05/20.
//  Copyright © 2020 Mayank. All rights reserved.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Organisation]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(self.categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(self.items) { org in
                        CategoryItem(org: org)
                    }
                }
            }
            .frame(height: 185)
        }
    }
}


struct CategoryItem: View {
    var org: Organisation
    var body: some View {
        VStack(alignment: .leading) {
            Text(org.abbreviation)
            Text(org.parentOrg)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}
