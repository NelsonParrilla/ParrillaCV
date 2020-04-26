//
//  ServerAPIClient.swift
//  VelcoCoreKit
//
//  Created by Nicolas Garcia on 21/03/2019.
//  Copyright © 2019 Velco. All rights reserved.
//

import Foundation

public final class ServerAPIClient {
    
    let scheme = CommandLine.arguments.contains("--uitesting") ? "http" : "http"
    
    let session: URLSession
    
    let acceptLanguage = Locale.preferredLanguages.prefix(6).enumerated().map { index, languageCode in
        let quality = 1.0 - (Double(index) * 0.1)
        return "\(languageCode);q=\(quality)"
        }.joined(separator: ", ")
    
    let host: String
    
    public init(host: String) {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 10
        configuration.timeoutIntervalForResource = 10
        self.session = URLSession(configuration: configuration)
        
        self.host = host
    }
    
    private func dataTask(request: URLRequest, then: @escaping (Result<Data, NSError>) -> Void) {
        let task = session.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                guard error == nil else {
                    then(.failure(error! as NSError))
                    return
                }
                
                guard let data = data else {
                    let error = NSError(domain: "",
                                        code: 0,
                                        userInfo: [NSLocalizedDescriptionKey : "Data was not retrieved from request"])
                    then(.failure(error))
                    return
                }
                
                then(.success(data))
            }
        }
        
        task.resume()
    }
    
    public func post(path: String, requestBody: Serializable?, authToken: String?, then: @escaping (Result<Data, NSError>) -> Void) {
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = CommandLine.arguments.contains("--uitesting") ? "localhost" : host
        urlComponents.path = path
        
        if CommandLine.arguments.contains("--uitesting") {
            urlComponents.port = 8080
        }
        
        guard let url = urlComponents.url else { fatalError("Could not create URL from components") }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(acceptLanguage, forHTTPHeaderField: "Accept-Language")
        if let authToken = authToken {
            request.setValue(authToken, forHTTPHeaderField: "Authorization")
        }
        
        if let requestBody = requestBody {
            switch requestBody.serialize() {
            case .success(let value):
                request.httpBody = value
                dataTask(request: request, then: then)
                
            case .failure(let error):
                then(.failure(error))
            }
        } else {
            dataTask(request: request, then: then)
        }
    }
    
    public func get(path: String, queryItems: [URLQueryItem], authToken: String?, then: @escaping (Result<Data, NSError>) -> Void) {
        get(path: path, queryItems: queryItems, authToken: authToken) { (result, response) in
            then(result)
        }
    }
    
    public func get(path: String, queryItems: [URLQueryItem], authToken: String?, then: @escaping (Result<Data, NSError>, HTTPURLResponse?) -> Void) {
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = CommandLine.arguments.contains("--uitesting") ? "localhost" : host
        urlComponents.path = path
        urlComponents.queryItems = queryItems
        
        if CommandLine.arguments.contains("--uitesting") {
            urlComponents.port = 8080
        }
        
        guard let url = urlComponents.url else { fatalError("Could not create URL from components") }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(acceptLanguage, forHTTPHeaderField: "Accept-Language")
        if let authToken = authToken {
            request.setValue(authToken, forHTTPHeaderField: "Authorization")
        }
        
        let task = session.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                guard error == nil else {
                    then(.failure(error! as NSError), response as? HTTPURLResponse)
                    return
                }
                
                guard let data = data else {
                    let error = NSError(domain: "",
                                        code: 0,
                                        userInfo: [NSLocalizedDescriptionKey : "Data was not retrieved from request"])
                    then(.failure(error), response as? HTTPURLResponse)
                    return
                }
                
                then(.success(data), response as? HTTPURLResponse)
            }
        }
        
        task.resume()
    }
}


extension JSONDecoder {
    
    public func decodeResponse<T: Decodable>(from response: Result<Data, NSError>) -> Result<T, NSError> {
        switch response {
        case .success(let data):
            do {
                let response = try decode(T.self, from: data)
                return .success(response)
            } catch let error {
                return .failure(error as NSError)
            }
            
        case .failure(let error):
            return .failure(error)
        }
    }
}
