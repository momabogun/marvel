//
//  ApiAuthentication.swift
//  Marvel App
//
//  Created by Momcilo Bogunovic on 13.01.24.
//

import Foundation
import CryptoKit
struct ApiAuthentication{
    
    static var baseURL = "https://gateway.marvel.com/v1/public/characters?ts=\(ts)&apikey=\(publicKey)&hash=\(hashString)"
    static var ts = String((Date().timeIntervalSince1970))
    static var publicKey = "acb9d6cbd013827b5e3f0a5b993ff80f"
    static var privateKey = "3bb018ec57528dc26a7fdb3346f2ff5ff7ed0fc8"
    static var hashString = MD5(data: "\(ts)\(privateKey)\(publicKey)")
    
    
}
    
    
    func MD5(data: String) -> String{
        
        let hash = Insecure.MD5.hash(data: data.data(using: .utf8) ?? Data())
        
        
        return hash.map{
            String(format: "%02hhx", $0)
        }
        .joined()
    }
    

