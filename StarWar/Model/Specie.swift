//
//  Species.swift
//  StarWar
//
//  Created by Yilei Huang on 2021-06-19.
//

import SwiftUI


struct Specie:Decodable,Hashable {
    let name:String
    let classification:String
    let designation:String
}
