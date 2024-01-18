//
//  MarvelViewModel.swift
//  Marvel App
//
//  Created by Momcilo Bogunovic on 13.01.24.
//

import Foundation
class MarvelViewModel: ObservableObject{
    
    init(){
        
        fetchCharacters()
    }
    @Published var characters = [MarvelCharacter]()
    
    @Published var search = ""
    
    
    
    
    
    func fetchCharacters(){
        Task{
            do{
                self.characters = try await MarvelRepository.fetchAllCharacters(search: search)
                
                
                

            }catch {
                print("Request failed with error: \(error)")
            }
        }
    }
}
