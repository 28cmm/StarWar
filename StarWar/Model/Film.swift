//
//  Film.swift
//  StarWar
//
//  Created by Yilei Huang on 2021-06-19.
//

import SwiftUI

struct GetDataDTO:Decodable{
    let count:Int
    let results:[Film]
}

struct Film:Decodable,Hashable{
    let title:String
    let episode_id: Int
    let opening_crawl:String
    let director:String
    let producer:String
    let release_date:String
    let characters:[String]
    let planets:[String]
    let starships:[String]
    let vehicles:[String]
    let species:[String]
}
