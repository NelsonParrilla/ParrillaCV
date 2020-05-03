//
//  CV.swift
//  CV-MVVM-SwiftUI
//
//  Created by parrilla nelson on 05/03/2020.
//  Copyright © 2020 parrilla nelson. All rights reserved.
//

import Foundation

struct CV: Codable, Equatable {
    let image: String
    let role: String
    let adresse: String
    let phone: String
    let email: String
    let skills: [Skill]
    let professionalExp: [Experience]
    let associative: Experience
    let sport: Experience
    let languages: Experience
    let projects: Experience
}
