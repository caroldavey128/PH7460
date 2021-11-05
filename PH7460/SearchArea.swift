//
//  SearchArea.swift
//  PH7460
//
//  Created by John Davey Ferrer on 2021-07-03.
//


import SwiftUI

struct SearchArea: View {
    
    var body: some View {
        VStack
        {
            Spacer()
            ListView()
            Spacer()
        }
        
    }
}
struct ListView: View
        {
    @StateObject var p: Provinces = Provinces()
    @StateObject var c: Cities = Cities()
    @State var destination = ""
    var body: some View {
        VStack
        {
            HStack
            {
            Image(systemName: "magnifyingglass")
                .padding(.init(top: 15, leading: 15, bottom: 15, trailing: 0))
            TextField("Enter Province or City name", text: $destination)
              
            }
            .background(Color(.systemGray4))
            .cornerRadius(30)
            .padding(.horizontal)
            
            
            List()
        {
                ForEach(destination == "" ? self.p.province: self.p.province.filter{$0.name.contains(destination)})
            {
                i in
                
                    NavigationLink(destination: MainContents(contentid: i.id, contentName: i.name, contentDescription: i.description, contentImage: i.image, contentTitle: i.title, contentLatitude: i.latitude, contentLongitude: i.longitude, contentLocations: i), label: {
                    HStack
                    {
                        Image(i.image)
                            .resizable()
                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                            .frame(width: 150, height: 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .cornerRadius(15)
                            .shadow(radius: 3)
                            
                        Spacer()
                        VStack
                        {
                        Text(i.name)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .underline()
                    
                        Text(i.title)
                            .fontWeight(.light)
                        }
                        Spacer()
                    }
                })
            }
                ForEach(destination == "" ? self.c.city: self.c.city.filter{$0.name.contains(destination)})
            {
                i in
                
                    NavigationLink(destination: MainContents(contentid: i.id, contentName: i.name, contentDescription: i.description, contentImage: i.image, contentTitle: i.title, contentLatitude: i.latitude, contentLongitude: i.longitude, contentLocations: i), label: {
                    HStack
                    {
                        Image(i.image)
                            .resizable()
                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                            .frame(width: 150, height: 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .cornerRadius(15)
                            .shadow(radius: 3)
                            
                        Spacer()
                        VStack
                        {
                        Text(i.name)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .underline()
                    
                        Text(i.title)
                            .fontWeight(.light)
                        }
                        Spacer()
                    }
                })
            }
        }
            }
        }
}

struct SearchArea_Previews: PreviewProvider {
    static var previews: some View {
        SearchArea()
    }
}

