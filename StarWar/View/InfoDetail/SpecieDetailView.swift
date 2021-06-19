//
//  SpecieDetailView.swift
//  StarWar
//
//  Created by Yilei Huang on 2021-06-19.
//

import SwiftUI

struct SpecieDetailView:View{
    let specie:Specie
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
                    HeaderTitle(title: specie.name)
                    HStack{
                        Text("classification: ")
                        Text(specie.classification)
                    }

                    
                    HStack{
                        Text("designation: ")
                        Text(specie.designation)
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
