//
//  Character.swift
//  StarWar
//
//  Created by Yilei Huang on 2021-06-19.
//

import SwiftUI

struct Character:Decodable,Hashable {
    let name:String
    let height:String
    let mass:String
    let hair_color:String
    let gender:String
}
