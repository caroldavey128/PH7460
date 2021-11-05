//
//  PH7460App.swift
//  PH7460
//
//  Created by John Davey Ferrer on 2021-06-27.
//

import SwiftUI

@main
struct PH7460App: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                NavigationView
                {
                    ContentView()
                        .navigationTitle("Home")
                }
                    .tabItem {
                        Image(systemName:"house.circle.fill").renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                        Text("Home")
                    }
                NavigationView
                 {
                    SearchArea()
                        .navigationTitle("Search Destination")
                 }
                     .tabItem {
                         Image(systemName:"magnifyingglass.circle").renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                         Text("Discover")
                     }
                NavigationView
                {
                    FavoritesView().environmentObject(Provinces())
                        .navigationTitle("Saved Destinations")
                }
                    .tabItem {
                        Image(systemName:"heart.circle").renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                        Text("Favorites")
                    }
            }
        }
    }
}
