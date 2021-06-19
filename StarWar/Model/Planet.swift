//
//  Planet.swift
//  StarWar
//
//  Created by Yilei Huang on 2021-06-19.
//

import SwiftUI

struct Planet:Decodable,Hashable{
    let name:String
    let rotation_period:String
    let climate:String
    let terrain:String
}
