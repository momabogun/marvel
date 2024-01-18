//
//  CharacterView.swift
//  Marvel App
//
//  Created by Momcilo Bogunovic on 14.01.24.
//

import SwiftUI

struct CharacterView: View {
    var character: MarvelCharacter
    @EnvironmentObject var marvelViewModel: MarvelViewModel
    var body: some View {
        HStack(alignment: .top,spacing: 15){
            AsyncImage(url: extractImage(data: character.thumbnail)){image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    
            } placeholder: {
                Image(systemName: "pencil")
            }.frame(width: 150, height: 150)
                .cornerRadius(25)
            
            VStack(alignment: .leading,spacing: 8){
                Text(character.name)
                    .font(.title3)
                    .fontWeight(.bold)
                Text(character.description)
                    .font(.caption)
                    .foregroundStyle(.gray)
                    .lineLimit(4)
                    .multilineTextAlignment(.leading)
                
                HStack(spacing: 10){
                    ForEach(character.urls, id:\.self){ data in
                        NavigationLink(destination: WebView(url: extractURL(data: data)).navigationTitle(extractURLType(data: data))) {
                            Text(extractURLType(data: data))
                        }
                        
                    }
                }
            }
            Spacer(minLength: 0)
        }.padding(8)
            .background{
                Color.gray.opacity(0.3)
            }.cornerRadius(25)
            
    }
    func extractImage(data: [String:String])->URL{
        
        let path = data["path"] ?? ""
        let ext = data["extension"] ?? ""
        
        return URL(string: "\(path).\(ext)")!
    }
    
    
    func extractURL(data: [String:String]) -> URL{
        let url = data["url"] ?? ""
        return URL(string: url)!
    }
    
    func extractURLType(data: [String:String])-> String{
        let type = data["type"] ?? ""
        
        return type.capitalized
    }
}


