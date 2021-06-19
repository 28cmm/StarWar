//
//  MovieDetailView.swift
//  StarWar
//
//  Created by Yilei Huang on 2021-06-19.
//

import SwiftUI


struct MovieDetailView:View{
    let film:Film
    @State var characters:[Character] = []
    @ObservedObject private var starWarVM = StarWarViewModel()
    @Environment(\.presentationMode) var presentationMode
    func fetchAllApi(){
        starWarVM.setUpPeople(charcters: film.characters)
        starWarVM.setUpPlanets(charcters: film.planets)
        starWarVM.setUpSpecies(charcters: film.species)
        starWarVM.setUpVehicles(charcters: film.vehicles)
        starWarVM.setUpStarships(charcters: film.starships)
    }
    var body: some View{
        VStack{
            //top back button
            HStack{
                Button(action:{self.presentationMode.wrappedValue.dismiss()}){
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("Movie")
                    }
                }
                Spacer()
            }
            .padding(.top,50)
            
            //bottom info
            ScrollView(showsIndicators: false){
                VStack(alignment:.leading){
                    //general info
                    VStack(alignment:.leading){
                        HeaderTitle(title: "GeneraL Info")
                        
                        HStack{
                            Text("Director: ")
                            Text(film.director)
                        }
                        
                        HStack{
                            Text("Episode: ")
                            Text("\(film.episode_id)")
                        }
                        HStack{
                            Text("Opening Crawl:")
                            Text(" \(film.opening_crawl)")
                            
                        }
                        HStack{
                            Text("Producer: ")
                            Text("\(film.producer)")
                        }
                        
                        HStack{
                            Text("ReleaseDate:")
                            Text(" \(film.release_date)")
                        }
                    }
                    // Detail Info
                    VStack(alignment:.leading){
                        HStack(alignment:.center){
                            Text("Characters :")
                            Spacer()
                            VStack{
                                List(starWarVM.myCharacters, id:\.self){ character in
                                    NavigationLink(destination:CharcterDetailView(character: character)){
                                        Text(character.name)
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                }
                            }
                        }
                        
                        HStack(alignment:.center){
                            Text("Planet :")
                            Spacer()
                            VStack{
                                List(starWarVM.myPlanets, id:\.self){ character in
                                    NavigationLink(destination:PlanetDetailView(planet: character)){
                                        Text(character.name)
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                }
                            }
                        }
                        HStack(alignment:.center){
                            Text("Vehicle :")
                            Spacer()
                            VStack{
                                List(starWarVM.myVehicles, id:\.self){ character in
                                    NavigationLink(destination:VehicleDetailView(vehicle: character)){
                                        Text(character.name)
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                }
                            }
                        }
                        HStack(alignment:.center){
                            Text("Specie :")
                            VStack{
                                List(starWarVM.mySpecies, id:\.self){ character in
                                    NavigationLink(destination:SpecieDetailView(specie: character)){
                                        Text(character.name)
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                }
                            }
                        }
                        HStack(alignment:.center){
                            Text("Starship :")
                            VStack{
                                List(starWarVM.myStarships, id:\.self){ character in
                                    NavigationLink(destination:StarshipDetailView(starship: character)){
                                        Text(character.name)
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                }
                            }
                        }
                    }
                    
                }
                .padding(.bottom,50)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .padding(.horizontal)
        .onAppear{
            fetchAllApi()
        }
    }
}



struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieHomeView()
    }
}
