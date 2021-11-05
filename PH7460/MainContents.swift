//
//  MainContents.swift
//  PH7460
//
//  Created by John Davey Ferrer on 2021-06-27.
//

import SwiftUI
import MapKit

struct Locations: Identifiable, Hashable {
    var id: Int
    var title: String
    var name: String
    var description: String
    var image: String
    var latitude: Double
    var longitude: Double
    var isFavorite: Bool
 
}



struct MainContents: View {
    let contentid: Int
    let contentName: String
    let contentDescription: String
    let contentImage: String
    let contentTitle: String
    let contentLatitude: Double
    let contentLongitude: Double
    var contentLocations: Locations
    @EnvironmentObject var provData: Provinces
    var locationIndex: Int {
        provData.province.firstIndex (where: {$0.name == contentLocations.name})!
        /* (where: { $0.id == contentLocations.id })! */
    }
    var body: some View {
        VStack
        {
            Spacer()
            ZStack
            {
                Image(contentImage)
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .frame(width: 350, height: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .cornerRadius(15)
                    .shadow(radius: 3)
                  
                Text(contentName)
                    .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                        .padding().offset(y: -90)
           
                Spacer()
             
            }
            HStack
            {
                Spacer()
                
                VStack
                {
            
                    NavigationLink(destination:
                                    MapView(region: MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: contentLatitude, longitude: contentLongitude), span: MKCoordinateSpan(latitudeDelta: 1.5, longitudeDelta: 1.5)),coordinate: CLLocationCoordinate2D(latitude: contentLatitude, longitude: contentLongitude), locations: MainContents(contentid: contentid, contentName: contentName, contentDescription: contentDescription, contentImage: contentImage, contentTitle: contentTitle, contentLatitude: contentLatitude, contentLongitude: contentLongitude, contentLocations: contentLocations)), label: {
                    
                    Image(systemName: "location").renderingMode(.template)
                        .frame(width: 10, height: 10, alignment: .center).foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                })
                    Text("View Map")
                        .padding(0.5)
                }
                .padding()
                Spacer()
                
                VStack
                {
                    /* FavoriteButton(isSet: $provData.province[locationIndex].isFavorite)

                     */
                    Button(action: {
                    
                  }, label: {
                        
                        Image(systemName: "heart").renderingMode(.template)
                        .frame(width: 10, height: 10, alignment: .center)
                    })
                    Text("Save to Favorites")
                        .padding(0.5)
               }
                Spacer()
            }
            HStack
            {
            Text("Description:")
                .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.black)
                .padding(.init(top: 0, leading: 10, bottom: 0, trailing: 0))
                
            Spacer()
            }
            ScrollView(.vertical)
            {
            Text(contentDescription)
                .padding()
            }
            Spacer()
        }
        .navigationTitle(contentTitle)
}
}


class Provinces: ObservableObject {
    @Published var province = [
        Locations(id: 0, title: "Province", name: "Cebu", description: "Cebu Island is long and narrow, stretching 196 kilometres from north to south, and only 32 kilometres across its widest point. It has countless coves and beaches, but it is the tiny islands just offshore that will capture your heart. Boasting sugar-white beaches, clear azure waters and astounding coral reefs just offshore, they are holiday-brochure perfect, but without the crowds. Bantayan Island is probably the most famous, with its dazzling white beaches, cool breezes and friendly locals. Camotes Island boasts beautiful beaches too, particularly around Mangodlong and Santiago Bay, but offers other activities for visitors as well. Danao Lake is worth a visit, as is Bukilat Cave, or trek to the Altavista view point for a breathtaking panorama of the whole island. Finally, Nalusuan Island is perfect for divers, surrounded by a protected marine garden, with colourful fish and neon coral. Make sure you try the fresh seafood served in beach shack restaurants here too. But be warned: you may never want to leave.", image: "CebuImage", latitude: 10.3157, longitude: 123.8854, isFavorite: false),
        Locations(id: 1, title: "Province", name: "Pampanga", description: "Explore Pampanga,  the Culinary Capital of the Philippines, on your next getaway. Here’s a guide on what to eat, places to see, and things to do there. Pampanga is one of the most famous provinces in the Central Luzon region because it holds the title of being the Culinary Capital of the Philippines. Pampanga is definitely a foodie’s heaven with dishes ranging from the iconic sizzling pork dish called sisig to the family favorites like pangat na ulang (sour soup with fresh water prawns). Pampanga’s modern city of Clark is famous for its well-preserved ancestral homes, a lineup of themed and amusement parks, and bright and colorful year-round festivals.", image: "PampangaImage", latitude: 15.0794, longitude: 120.6200, isFavorite: false),
        Locations(id: 2, title: "Province", name: "Pangasinan", description: "Pangasinan is a destination for tourists who wish to explore islands and beaches, waterfalls, and feast on tasty local cuisine—all just 3-4 hours of drive from Manila. Pangasinan translates to “place of salt” as it is a major producer of salt. In fact, two of their main products are bagoong (shrimp paste) and alamang (krill) that give additional flavor to dishes. Add Pangasinan to your bucket list if you're looking for a quick escape from the city.", image: "PangasinanImage", latitude: 15.8949, longitude: 120.2863, isFavorite: false),
        Locations(id: 3, title: "Province", name: "Zambales", description: "Want a quick beach and island escape from the bustling cities of Metro Manila? Hop on a bus or drive your way to Zambales! Zambales is blessed with pristine attractions for sun worshipers because of its location on the western shores of Luzon, along the West Philippine Sea. It’s home to many coves and islands like Anawangin Cove, Nagsasa Cove, Potipot Island, and Capones Island to name a few. Zambales is also where you can find another top destination in the North, Subic. The active stratovolcano Mount Pinatubo’s summit and crater lake also lies in the Botolan area of Zambales. Zambales is known to being a weekend getaway destination for city-dwellers so there are numerous accommodation types situated around the area from hotels, resorts, to private houses for rent for every budget.", image: "ZambalesImage", latitude: 15.5082, longitude: 119.9698, isFavorite: true)
    ]
}


struct Prov: View {
    @StateObject var p: Provinces = Provinces()
    var body: some View {
        GroupBox (label: Text("Provinces")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.gray))
        {
            ScrollView(.horizontal){
                HStack {
                    ForEach(self.p.province)
                    {
                        i in
                        
                        NavigationLink(destination: MainContents(contentid: i.id, contentName: i.name, contentDescription: i.description, contentImage: i.image, contentTitle: i.title, contentLatitude: i.latitude, contentLongitude: i.longitude, contentLocations: i), label: {
                        
                        ZStack
                        {
                        Image(i.image)
                            .resizable()
                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                            .frame(width: 140, height: 140, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .cornerRadius(15)
                            .shadow(radius: 3)
                          
                            Text(i.name)
                                .font(.footnote)
                                .fontWeight(.heavy)
                                .foregroundColor(Color.white)
                                .padding().offset(y: -50)
                        }
                        }
                        )
                }
                }
            }
            
            
        }
        .frame(width: 375, height: 200
               , alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
        .shadow(radius: 15)
    }
}

class Cities: ObservableObject {
    @Published var city = [
        Locations(id: 0, title: "City", name: "Baguio", description: "Baguio is a mountain resort city located in Benguet of Northern Luzon, Philippines. Considered to be the country's Summer Capital, Baguio is undoubtedly one of the top tourist destinations in the Philippines. Also nicknamed The City of Pines, it is a popular weekend getaway for local travelers based in the metro.", image: "BaguioImage", latitude: 16.4023, longitude: 120.5960, isFavorite: false),
        Locations(id: 1, title: "City", name: "Olongapo", description: "A major city in the province of Zambales in the Philippines, Olongapo has a growing population of 230,000 as per the 2015 census. Metro Olongapo, along with the municipality of Subic, is one of the twelve metropolitan areas in the Philippines. Though it has a notorious red light district reputation brought by the presence of night clubs catering to American servicemen, the city has gradually shifted into a more wholesome image. Olongapo is known for its culturally relevant sites – Marikit Park, Olongapo Lighthouse, Kalapati (The Dove Monument) along with Olongapo’s City Hall, Convention Center, Museum, Public Library, and Public Market.", image: "OlongapoImage", latitude: 14.8386, longitude: 120.2842, isFavorite: false),
        Locations(id: 2, title: "City", name: "Puerto Princesa", description: "Puerto Princesa in Palawan is most famous for the Puerto Princesa Subterranean River National Park or the Underground River, a UNESCO World Heritage site and holds a place in the New7Wonders of Nature. It is also the gateway to famous paradise-like destinations in Palawan like El Nido and San Vicente because it has its own international airport. But there's more to Puerto Princesa than being just a jump-off site and location to the famous natural wonder. Puerto Princesa, also known as The City in a Forest, is rich in various unknown but must-see tourist spots that make it worth a visit for more than just a day.", image: "PuertoPrincesaImage", latitude: 9.7638, longitude: 118.7473, isFavorite: false),
        Locations(id: 3, title: "City", name: "Taguig", description: "Taguig contains the Bonifacio Global City (popularly known simply as BGC), Metro Manila's second most important business district and a major tourism, shopping, dining and entertainment destination. Other attractions include the Manila American Cemetery and the affluent neighbourhood of McKinley Hill.", image: "TaguigImage", latitude: 14.5176, longitude: 121.0509, isFavorite: false)
    ]
}
struct Cit: View {
    @StateObject var c: Cities = Cities()
    var body: some View {
        GroupBox (label: Text("Cities")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.gray))
        {
            ScrollView(.horizontal){
                HStack {
                    ForEach(self.c.city)
                    {
                        i in
                        
                        NavigationLink(destination: MainContents(contentid: i.id, contentName: i.name, contentDescription: i.description, contentImage: i.image, contentTitle: i.title, contentLatitude: i.latitude, contentLongitude: i.longitude, contentLocations: i), label: {                        ZStack
                        {
                        Image(i.image)
                            .resizable()
                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                            .frame(width: 140, height: 140, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .cornerRadius(15)
                            .shadow(radius: 3)
                          
                            Text(i.name)
                                .font(.footnote)
                                .fontWeight(.heavy)
                                .foregroundColor(Color.white)
                                .padding().offset(y: -50)
                        }
                        }
                        )
                        
                    
                }
                }
            }
                        
        }
        .frame(width: 375, height: 200
               , alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
        .shadow(radius: 15)

    }
}

//favorites


struct MainContents_Previews: PreviewProvider {
    static let provData = Provinces()
    static var previews: some View {
        MainContents(contentid: 00, contentName: "Name", contentDescription: "Description", contentImage: "Image", contentTitle: "Title", contentLatitude: 12.1, contentLongitude: 12.2, contentLocations: provData.province[0]).environmentObject(provData)
    }
}


