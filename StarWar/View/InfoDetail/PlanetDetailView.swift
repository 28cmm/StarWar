//
//  PlanetDetailView.swift
//  StarWar
//
//  Created by Yilei Huang on 2021-06-19.
//

import SwiftUI

struct PlanetDetailView:View{
    let planet:Planet
    @Environment(\.presentationMode) var presentationMode
    var body: some View{
        VStack{
            HStack{
                Button(action:{self.presentationMode.wrappedValue.dismiss()}){
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("Info")
                    }
                }
                Spacer()
            }
            .padding(.top,50)
            ScrollView{
                VStack(alignment:.leading){
                    HeaderTitle(title: planet.name)
                    HStack{
                        Text("rotation_period: ")
                        Text(planet.rotation_period)
                    }
                    HStack{
                        Text("terrain: ")
                        Text(planet.terrain)
                    }
                    
                    HStack{
                        Text("climate: ")
                        Text(planet.climate)
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .padding(.horizontal)
    }
}
