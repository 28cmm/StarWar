//
//  SearchBar.swift
//  StarWar
//
//  Created by Yilei Huang on 2021-06-19.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text:String
    @State private var isEditing = false
    var placeHolderText:String?
    func setPlaceHolderText() ->String{
        if let placeHolder = placeHolderText{
            return placeHolder
        }
        return "Search"
    }
    var body: some View {
        HStack{
            TextField(setPlaceHolderText(), text: $text)
                .padding(.leading, 30)
                .padding(.top,10)
                .padding(.bottom,10)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .onTapGesture {
                    self.isEditing = true
                }
        }
    }
}


