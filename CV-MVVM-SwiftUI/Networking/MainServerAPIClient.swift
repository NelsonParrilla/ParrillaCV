//
//  MainServerAPIClient.swift
//  CV-MVVM-SwiftUI
//
//  Created by parrilla nelson on 05/03/2020.
//  Copyright © 2020 parrilla nelson. All rights reserved.
//

import Foundation

protocol MainServerAPIClient {
    
    func getCV(then: @escaping (Result<CV, NSError>) -> Void)
    
}

extension ServerAPIClient: MainServerAPIClient {
    
    func getCV(then: @escaping (Result<CV, NSError>) -> Void) {
        let path: String
        #if DEVELOPMENT
        path = "/CV"
        #else
        path = "/CV"
        #endif
        
        get(path: path, queryItems: [], authToken: "", then: { result in
            switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    let string1 = String(data: data, encoding: String.Encoding.utf8) ?? "Data could not be printed"
                    print("voici la reponse :\(string1)")
                    let response = try decoder.decode(CV.self, from: data)
                    then(.success(response))
                    
                } catch let error {
                    then(.failure(error as NSError))
                }
                
            case .failure(let error):
                then(.failure(error))
            }
        })
    }
    
}
