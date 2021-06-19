//
//  MovieDetailView.swift
//  StarWar
//
//  Created by Yilei Huang on 2021-06-19.
//

import SwiftUI

struct CharcterDetailView:View{
    let character:Character
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
                    HeaderTitle(title: character.name)
                    HStack{
                        Text("mass: ")
                        Text(character.mass)
                    }
                    HStack{
                        Text("gender: ")
                        Text(character.gender)
                    }
                    
                    HStack{
                        Text("hairColor: ")
                        Text(character.hair_color)
                    }
                    
                    HStack{
                        Text("height: ")
                        Text(character.height)
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

struct CharcterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieHomeView()
    }
}
