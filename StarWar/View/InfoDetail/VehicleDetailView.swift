//
//  VehicleDetailView.swift
//  StarWar
//
//  Created by Yilei Huang on 2021-06-19.
//

import SwiftUI

struct VehicleDetailView:View{
    let vehicle:Vehicle
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
                    HeaderTitle(title: vehicle.name)
                    HStack{
                        Text("manufacturer: ")
                        Text(vehicle.manufacturer)
                    }

                    
                    HStack{
                        Text("length: ")
                        Text(vehicle.length)
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
