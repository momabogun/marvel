//
//  MarvelHomeView.swift
//  Marvel App
//
//  Created by Momcilo Bogunovic on 14.01.24.
//

import SwiftUI

struct MarvelHomeView: View {
    @StateObject var marvelViewModel: MarvelViewModel = MarvelViewModel()
    var body: some View {
        
            TabView{
                MarvelCharListView(marvelViewModel: marvelViewModel)
                    .tabItem{
                        Label("Characters",systemImage: "person.3.fill")
                    }
                Text("dsadadsasd")
                    .tabItem{
                        Label("Comics",systemImage: "books.vertical.fill")
                    }
            }
        
    }
}

#Preview {
    MarvelHomeView()
}
