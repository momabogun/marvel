//
//  Character.swift
//  Marvel App
//
//  Created by Momcilo Bogunovic on 13.01.24.
//

import Foundation
struct CharacterDataWrapper: Codable{
    let data: CharacterDataContainer
}

struct CharacterDataContainer: Codable{
    let results: [MarvelCharacter]
}

struct MarvelCharacter: Codable{
    let id: Int
    let name: String
    let description: String
    let thumbnail: [String:String]
    let urls: [[String:String]]
}


