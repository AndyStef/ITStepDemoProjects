//
//  NetworkManager.swift
//  RickAndMortyDemo
//
//  Created by Andy Stef on 05.11.2020.
//

import Foundation
import Alamofire
import UIKit

class NetworkManager {
    
    private let baseURL = "https://rickandmortyapi.com/api/character/"
    private let manager = URLSession.shared
    
    func baseGetCharactersRequest(callback: @escaping (([Character]) -> ())) {
        guard let url = URL(string: baseURL) else {
            print("Failed to create URL")
            return
        }
        
        let urlRequest = URLRequest(url: url)
        let dataTask = manager.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                print("Failed to do request - \(error.localizedDescription)")
                return
            }
            
            // Check if there is data
            guard let data = data else {
                print("No data")
                return
            }
            
            // Decoding JSON
            guard let charactersResults = try? JSONDecoder().decode(CharactersResults.self, from: data) else {
                print("Failed to decode")
                return
            }
            
            let characters = charactersResults.results
            callback(characters)
        }
        
        // This is very important to trigger request
        dataTask.resume()
    }
    
    func baseGetCharactersRequest(species: String, callback: @escaping (([Character]) -> ())) {
        let urlString = baseURL + "?species=\(species)"
        guard let url = URL(string: urlString) else {
            print("Failed to create URL")
            return
        }
        
        let urlRequest = URLRequest(url: url)
        let dataTask = manager.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                print("Failed to do request - \(error.localizedDescription)")
                return
            }
            
            // Check if there is data
            guard let data = data else {
                print("No data")
                return
            }
            
            // Decoding JSON
            guard let charactersResults = try? JSONDecoder().decode(CharactersResults.self, from: data) else {
                print("Failed to decode")
                return
            }
            
            let characters = charactersResults.results
            callback(characters)
        }
        
        // This is very important to trigger request
        dataTask.resume()
    }
    
    func getCharacters(species: String, callback: @escaping (([Character]) -> ())) {
        
        // Form complete URL
        var components = URLComponents()
        components.scheme = "https"
        components.host = "rickandmortyapi.com"
        components.path = "/api/character/"
        components.queryItems = [
            URLQueryItem(name: "species", value: species)
        ]
                
        guard let url = components.url else {
            print("Failed to create URL")
            return
        }
        
        let urlRequest = URLRequest(url: url)
        let dataTask = manager.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                print("Failed to do request - \(error.localizedDescription)")
                return
            }
            
            // Check if there is data
            guard let data = data else {
                print("No data")
                return
            }
            
            // Decoding JSON
            guard let charactersResults = try? JSONDecoder().decode(CharactersResults.self, from: data) else {
                print("Failed to decode")
                return
            }
            
            let characters = charactersResults.results
            callback(characters)
        }
        
        // This is very important to trigger request
        dataTask.resume()
    }
    
    // Just example how it can be done more flexible
    enum Path: String {
        case character
        case episodes
    }
    
    func makeRequest<T: Codable>(path: Path, parameters: [String: String], callback: @escaping (T) -> Void) {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "rickandmortyapi.com"
        
        components.path = "/api/\(path.rawValue)/"
        parameters.forEach {
            components.queryItems?.append(.init(name: $0.key, value: $0.value))
        }
        
        guard let url = components.url else {
            print("Failed to create URL")
            return
        }
        
        let urlRequest = URLRequest(url: url)
        let dataTask = manager.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                print("Failed to do request - \(error.localizedDescription)")
                return
            }
            
            // Check if there is data
            guard let data = data else {
                print("No data")
                return
            }
            
            // Decoding JSON
            guard let results = try? JSONDecoder().decode(T.self, from: data) else {
                print("Failed to decode")
                return
            }
            
            callback(results)
        }
        
        // This is very important to trigger request
        dataTask.resume()
    }
    
    func alamofireGetCharacters(parameters: [String: String], callback: @escaping (([Character]) -> ())) {
        let request = AF.request(baseURL, parameters: parameters)
        request
            .validate()
            .responseDecodable(of: CharactersResults.self) { response in
                guard let characters = response.value else { return }
                callback(characters.results)
        }
    }
    
    func testNetworkCall() {
        AF.request("https://topImages.com/MarvelUniverse.jpg")
            .validate()
            .responseData(queue: .main) { response in
                if let error = response.error {
                    print("Error: \(error)")
                    return
                }
                
                guard let data = response.value else {
                    return
                }
                
                self.imageView.image = UIImage(data: data)
            }
    }
    
    let imageView = UIImageView()
    
    func postExample() {
        // Form complete URL
        var components = URLComponents()
        components.scheme = "https"
        components.host = "rickandmortyapi.com"
        components.path = "/api/character/"
        components.queryItems = [
            URLQueryItem(name: "species", value: "species")
        ]
                
        guard let url = components.url else {
            print("Failed to create URL")
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("User access token", forHTTPHeaderField: "Authorization")
        
        let parameters: [String: Any] = ["id": 13, "name": "jack"]
        urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
        
        let dataTask = manager.dataTask(with: urlRequest) { data, response, error in
            
        }
        
        dataTask.resume()
    }
}
