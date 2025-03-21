//
//  NetworkCaller.swift
//  RickAndMortyVIPER
//
//  Created by samet on 20.03.2025.
//

import Foundation


protocol NetworkServiceProtocol {
    func fetchData<T:Decodable>(_ endpoint: EndPoint, completion: @escaping(Result<T,Error>) -> Void)
}

final class NetworkCaller: NetworkServiceProtocol {
    func fetchData<T>(_ endpoint: EndPoint, completion: @escaping (Result<T, any Error>) -> Void) where T : Decodable {
        
        let task = URLSession.shared.dataTask(with: endpoint.request()) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode >= 200, response.statusCode <= 299 else {
                return
            }
            
            guard let data = data else {
                completion(.failure(URLError(.badURL)))
                return
            }
            
            do {
                let decodeData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodeData))
                
            } catch let error {
                print(error)
            }
            
            
        }
        
        task.resume()
    }
}
