//
//  StarWarAPI.swift
//  StarWar
//
//  Created by Yilei Huang on 2021-06-18.
//

import SwiftUI
import Combine

struct StarWarAPI{
    
    
    // first initial fetch
    func fetchFilm() -> AnyPublisher<GetDataDTO, Error>{
        var components:URLComponents{
            var componenets = URLComponents()
            componenets.scheme = "https"
            componenets.host = "swapi.dev"
            componenets.path = "/api/films"
            return componenets
        }
        return URLSession.shared.dataTaskPublisher(for: components.url!)
            .map{$0.data}
            .decode(type: GetDataDTO.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    
    
    func fetchPlanets(urlString:String, completion:@escaping(Planet)->Void){
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            
            if let data = data{
                do{
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode(Planet.self, from: data)
                    DispatchQueue.main.async {
                        completion(decodedData)
                    }
                    
                }catch{
                    print(err?.localizedDescription)
                }
            }
            
        }
        .resume()
        
    }
    func fetchVehicle(urlString:String, completion:@escaping(Vehicle)->Void){
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            
            if let data = data{
                do{
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode(Vehicle.self, from: data)
                    DispatchQueue.main.async {
                        completion(decodedData)
                    }
                    
                }catch{
                    print(err?.localizedDescription)
                }
                
            }
        }
        .resume()
        
    }
    
    func fetchStarship(urlString:String, completion:@escaping(Starship)->Void){
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            
            if let data = data{
                do{
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode(Starship.self, from: data)
                    DispatchQueue.main.async {
                        completion(decodedData)
                    }
                    
                }catch{
                    print(err?.localizedDescription)
                }
            }
            
        }
        .resume()
        
    }
    func fetchSpecie(urlString:String, completion:@escaping(Specie)->Void){
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let data = data{
                do{
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode(Specie.self, from: data)
                    DispatchQueue.main.async {
                        completion(decodedData)
                    }
                }catch{
                    print(err?.localizedDescription)
                }
            }
        }
        .resume()
        
    }
    
    func fetchPeople(urlString:String, completion:@escaping(Character)->Void){
        //        let urlString = "https://swapi.dev/api/people/81"
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let data = data{
                do{
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode(Character.self, from: data)
                    DispatchQueue.main.async {
                        completion(decodedData)
                    }
                }catch{
                    print(err?.localizedDescription)
                }
            }
        }
        .resume()
        
    }
    
    
}

























