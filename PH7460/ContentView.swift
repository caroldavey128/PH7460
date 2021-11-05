//
//  ContentView.swift
//  PH7460
//
//  Created by John Davey Ferrer on 2021-06-27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack
        {
            ZStack
            {
            Image("HomeCard")
                .resizable()
                .frame(width: 350, height: 300, alignment: .center).aspectRatio(contentMode: .fit)
                .border(/*@START_MENU_TOKEN@*/Color.gray/*@END_MENU_TOKEN@*/, width: 0.8)
                .cornerRadius(/*@START_MENU_TOKEN@*/15.0/*@END_MENU_TOKEN@*/).shadow(radius: 7)
                VStack {
                    ZStack {
                
            Rectangle().frame(width: 310, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/).cornerRadius(20).shadow(radius: 15)
                        
                        Text("Discover the 7,460 Islands of the Philippines").font(.headline).fontWeight(.heavy).multilineTextAlignment(.center).foregroundColor(.white).padding()
                            
            
                    }
                    Spacer()
                }
                
            }
           
            Spacer()
            
            Text("Browse from the Categories Below:")
                .font(.subheadline)
                .fontWeight(.bold)
                .padding()
            Spacer()
            
            ScrollView(.vertical)
            {
            Prov()
                Spacer()
            Cit()
                Spacer()
            }
            Spacer()
        }
  
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
