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
        ZStack {
            BlurView(.dark)
            Image(systemName: "paperclip.circle.fill").resizable().frame(width: 130, height: 130, alignment: .center)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
        }.frame(width:140,height: 140).clipShape(Circle())
        
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
