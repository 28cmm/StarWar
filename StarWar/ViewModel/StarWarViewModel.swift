//
//  StarWarViewModel.swift
//  StarWar
//
//  Created by Yilei Huang on 2021-06-19.
//

import SwiftUI
import Combine

class StarWarViewModel:ObservableObject{
    private let starWarAPI = StarWarAPI()
    @Published var myFilms:[Film] = []
    @Published var myCharacters:[Character] = []
    @Published var myPlanets:[Planet] = []
    @Published var myVehicles:[Vehicle] = []
    @Published var mySpecies:[Specie] = []
    @Published var myStarships:[Starship] = []
    
    
    var cancellable:AnyCancellable?
    
    func fetchApi(){
        cancellable = starWarAPI.fetchFilm().sink(receiveCompletion: { err in
        }, receiveValue: { filmContainer in
            self.myFilms = filmContainer.results
        })
    }
    func setUpPeople(charcters:[String]){
        for char in charcters{
            starWarAPI.fetchPeople(urlString: char, completion: { charcter in
                self.myCharacters.append(charcter)
            })
        }
        
    }
    func setUpPlanets(charcters:[String]){
        for char in charcters{
            starWarAPI.fetchPlanets(urlString: char, completion: { charcter in
                self.myPlanets.append(charcter)
                print(self.myPlanets)
            })
        }
        
    }
    func setUpVehicles(charcters:[String]){
        for char in charcters{
            starWarAPI.fetchVehicle(urlString: char, completion: { charcter in
                self.myVehicles.append(charcter)
            })
        }
        
    }
    func setUpStarships(charcters:[String]){
        for char in charcters{
            starWarAPI.fetchStarship(urlString: char, completion: { charcter in
                self.myStarships.append(charcter)
            })
        }
        
    }
    func setUpSpecies(charcters:[String]){
        for char in charcters{
            starWarAPI.fetchSpecie(urlString: char, completion: { charcter in
                self.mySpecies.append(charcter)
            })
        }
        
    }
    
   
    
    
}
