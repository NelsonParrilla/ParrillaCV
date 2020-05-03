//
//  Experience.swift
//  CV-MVVM-SwiftUI
//
//  Created by Nelson Parrilla on 01/04/2020.
//  Copyright © 2020 Nelson Parrilla. All rights reserved.
//

import Foundation

struct Experience: Codable, Hashable {
    let title: String
    let image: String?
    let exp: [ExperienceDetail]
}

struct ExperienceDetail: Codable, Hashable {
    let date: String
    let description: String
}
