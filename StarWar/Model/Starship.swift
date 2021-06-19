//
//  Starships.swift
//  StarWar
//
//  Created by Yilei Huang on 2021-06-19.
//

import SwiftUI

struct Starship:Decodable,Hashable {
    let name:String
    let manufacturer:String
    let crew:String
    let MGLT:String
    let consumables:String
}
