

import SwiftUI

struct FavoritesView: View
        {
    @EnvironmentObject var provData: Provinces
    @State private var showFavoritesOnly = false

    var filteredLocation: [Locations] {
        provData.province.filter { i in
            (!showFavoritesOnly || i.isFavorite)
        }
    }
    var body: some View {
      
          List
            {
            Toggle(isOn: $showFavoritesOnly) {
                Text("Favorites only")
            }
            ForEach(filteredLocation)
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



struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView().environmentObject(Provinces())
    }
}

