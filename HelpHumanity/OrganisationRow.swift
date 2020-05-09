//
//  OrganisationRow.swift
//  HelpHumanity
//
//  Created by Mayank on 04/05/20.
//  Copyright © 2020 Mayank. All rights reserved.
//

import SwiftUI

struct OrganisationRow: View {
    
    var organisation: Organisation
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                Text(organisation.abbreviation).font(.system(size: 22)).bold()
                Spacer()
                Text(organisation.cause).font(.system(size: 10)).padding(.horizontal,10).padding(.vertical,5).background(Color.red.opacity(0.5)).clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            }.padding(.horizontal,3)
            HStack {
                Text(organisation.orgName).font(.system(size: 16))
                Spacer()
                Text(organisation.country).font(.system(size: 13))
            }.padding(.horizontal,3)
        }
    }
}


struct OrganisationRow_Previews: PreviewProvider {
    
    
    
    static var previews: some View {
        OrganisationRow(organisation: Organisation(abbreviation: "WHO", cause: "world health", city: "hyderabad", country: "India", donationLink: "www.google.com", locationLongitude: 10, locationLatitude: -20, orgName: "World Health Organisation", parentOrg: "United Nations", website: "who.int"))
    }
}
