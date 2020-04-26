//
//  SerializableType.swift
//  VelcoCoreKit
//
//  Created by Nicolas Garcia on 21/03/2019.
//  Copyright © 2019 Velco. All rights reserved.
//

import Foundation

//TODO: rename to Serializable. I needed to change its name because theres a colission with a type on Serpent framework
public protocol Serializable: Codable {
    
    func serialize() -> Result<Data, NSError>
}

public extension Serializable {
    
    func serialize() -> Result<Data, NSError> {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(self)
            return .success(data)
        } catch let error {
            return .failure(error as NSError)
        }
    }
}
