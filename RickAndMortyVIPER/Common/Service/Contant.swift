//
//  Contant.swift
//  RickAndMortyVIPER
//
//  Created by samet on 20.03.2025.
//

import Foundation


protocol EnumProtocol {
    var baseURL: String { get }
}

enum EndPoint {
    case location(id:Int)
    case locations
    case character(id:Int)
    case characters
    case episode(id:Int)
    case episodes
}

extension EndPoint: EnumProtocol {
    var baseURL: String {
        return "https://rickandmortyapi.com/api"
    }
    
    var endPoint:String {
        switch self {
        case .location(id: let id):
            "location/\(id)"
        case .locations:
            "location"
        case .character(id: let id):
            "character/\(id)"
        case .characters:
            "character"
        case .episode(id: let id):
            "episode/\(id)"
        case .episodes:
            "episode"
        }
    }
    
    func rickAndMortyAPI() -> String {
        return "\(baseURL)/\(endPoint)"
    }
    
    func request() -> URLRequest {
        guard let url = URLComponents(string: rickAndMortyAPI()) else {
            fatalError("URL Components Oluşturulamadı")
        }
        
        guard let url = url.url else {
            fatalError("URL oluşturulamadı")
        }
        
        var request = URLRequest(url: url)
        return request
    }
}
