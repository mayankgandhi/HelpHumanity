//
//  DetailView.swift
//  HelpHumanity
//
//  Created by Mayank on 05/05/20.
//  Copyright © 2020 Mayank. All rights reserved.
//
import SwiftUI
struct DetailView: View {
    @State var organisation:Organisation
    var body: some View {
        ZStack {
            MapView()
            .edgesIgnoringSafeArea(.all)
            ZStack {
                BlurView(.dark)
                VStack {
                    CircleImage().offset(x: 0, y: -65)
                    VStack(alignment: .center) {
                        HStack(alignment: .bottom) {
                            Text(organisation.abbreviation)
                            .font(.title).bold()
                            Spacer()
                            Text(organisation.cause).font(.system(size: 14)).bold().padding(.horizontal,10).padding(.vertical,5).background(Color.red).clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                        }
                        .padding()
                        VStack{
                            Text(organisation.orgName)
                                .font(.system(size: 35)).padding()
                            Text(organisation.parentOrg)
                            .font(.system(size: 25)).padding()
                            
                            HStack {
                                Text(organisation.city.lowercased()+",").font(.system(size: 20)).padding(0)
                                Text(organisation.country.uppercased()).font(.system(size: 20)).bold().padding(0)
                            }
                        }
                        HStack(alignment: .center) {
                            VisitWebsite(website: $organisation.website)
                            DonateWebsite(website: $organisation.donationLink)
                        }
                       
                    }
                    .foregroundColor(Color.white)
                    .offset(x: 0, y: -100)
                    .padding()
                    Spacer()
                }
            }
            .frame(width: 400)
            .frame(height:700)
            .offset(x: 0, y: 300)
        }
    }

}
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(organisation: Organisation(abbreviation: "WHO", cause: "world health", city: "hyderabad", country: "India", donationLink: "www.google.com", locationLongitude: 10, locationLatitude: -20, orgName: "World Health Organisation", parentOrg: "United Nations", website: "who.int"))
    }

}
struct VisitWebsite: View {
    @Binding var website:String
    var body: some View {
        HStack{
            Image(systemName: "link.circle.fill").font(.title)
            Button(action: {
                print(self.website)
            })
            {
                Text("Website")
            }
            .padding(.horizontal, 10)
        }
        .padding().foregroundColor(Color.white).background(Color.blue).clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous)).padding()
    }

}
struct DonateWebsite: View {
    @Binding var website:String
    var body: some View {
        HStack{
            Image(systemName: "dollarsign.circle.fill").font(.title)
            Button(action: {
                print(self.website)
            })
            {
                Text("Donate")
            }
            .padding(.horizontal, 10)
        }
        .padding().foregroundColor(Color.white).background(Color.green).clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous)).padding()
    }

}
