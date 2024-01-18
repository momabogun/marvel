//
//  MarvelRepository.swift
//  Marvel App
//
//  Created by Momcilo Bogunovic on 13.01.24.
//

import Foundation
class MarvelRepository{
    
    
    static func fetchAllCharacters(search: String) async throws -> [MarvelCharacter] {
        
    
        guard let url = URL(string: "https://gateway.marvel.com/v1/public/characters?nameStartsWith=\(search)&ts=\(ApiAuthentication.ts)&apikey=\(ApiAuthentication.publicKey)&hash=\(ApiAuthentication.hashString)") else {
            throw HTTPError.invalidURL
        }
  
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let result = try JSONDecoder().decode(CharacterDataWrapper.self, from: data)
        return result.data.results
        
    }
}
