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
           HStack {
               Text(organisation.orgName)
                   .frame(width: 50, height: 50)
               Text(organisation.orgName)
               Spacer()
           }
       }
}

