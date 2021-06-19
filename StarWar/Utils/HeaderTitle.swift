//
//  HeaderTitle.swift
//  StarWar
//
//  Created by Yilei Huang on 2021-06-19.
//

import SwiftUI

struct HeaderTitle:View {
    let title:String
    var body: some View{
        Text(title)
            .font(.title)
            .fontWeight(.bold)
            
    }
}
