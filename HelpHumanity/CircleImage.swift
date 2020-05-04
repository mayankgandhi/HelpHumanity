//
//  CircleImage.swift
//  HelpHumanity
//
//  Created by Mayank on 04/05/20.
//  Copyright © 2020 Mayank. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image(systemName: "person").resizable().frame(width: 200, height: 200, alignment: .center)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
        
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
