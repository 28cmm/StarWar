//
//  StarshipDetailView.swift
//  StarWar
//
//  Created by Yilei Huang on 2021-06-19.
//

import SwiftUI

struct StarshipDetailView:View{
    let starship:Starship
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
                    HeaderTitle(title: starship.name)
                    HStack{
                        Text("manufacturer: ")
                        Text(starship.manufacturer)
                    }

                    
                    HStack{
                        Text("crew: ")
                        Text(starship.crew)
                    }
                    HStack{
                        Text("MGLT: ")
                        Text(starship.MGLT)
                    }
                    HStack{
                        Text("consumables: ")
                        Text(starship.consumables)
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
