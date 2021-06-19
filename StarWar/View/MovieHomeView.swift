//
//  MovieHomeView.swift
//  StarWar
//
//  Created by Yilei Huang on 2021-06-18.
//

import SwiftUI

struct MovieHomeView: View {
    @ObservedObject private var starWarVM = StarWarViewModel()
    
    @State var searchText:String = ""
    var body: some View {
        let sortedFilm = starWarVM.myFilms.sorted{
            return $0.episode_id < $1.episode_id
        }.filter{
            self.searchText == "" ? true : $0.title.lowercased().contains(searchText.lowercased())
        }
        NavigationView{
            VStack{
                HeaderTitle(title: "Star War Movie")
                    .padding(.top,100)
                ZStack{
                    SearchBar(text: $searchText, placeHolderText : "")
                    
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(searchText.count == 0 ? .black: .clear)
                        Text("Search")
                            .foregroundColor(searchText.count == 0 ? .black: .clear)
                        Spacer()
                    }.padding(.leading, 5)
                }
                List(sortedFilm, id:\.self){ film in
                    NavigationLink(destination: NavigationLazyView( MovieDetailView(film: film))){
                        HStack{
                            Image(systemName: "film")
                            Text("\(film.episode_id)")
                            Text(film.title)
                            Spacer()
                        }
                    }
                }
                Spacer()
            }
            
            .edgesIgnoringSafeArea(.all)
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .onAppear{
                self.starWarVM.fetchApi()
                
            }
        }
        
    }
}








struct MovieHomeView_Previews: PreviewProvider {
    static var previews: some View {
        MovieHomeView()
    }
}
