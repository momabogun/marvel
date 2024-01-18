//
//  MArvelView.swift
//  Marvel App
//
//  Created by Momcilo Bogunovic on 13.01.24.
//

import SwiftUI

struct MarvelCharListView: View {
    @ObservedObject var marvelViewModel: MarvelViewModel
    var body: some View {
        NavigationStack{
            
                ScrollView{
                    ForEach(marvelViewModel.characters, id: \.id){ char in
                        CharacterView(character: char)
                            .environmentObject(marvelViewModel)
                    }.padding(8)
                }.navigationTitle("Marvel Characters")
                    .searchable(text: $marvelViewModel.search)
                    .onChange(of: marvelViewModel.search) {
                        marvelViewModel.fetchCharacters()
                    }
            }
    }
    
    
}


