//
//  FeatureFlags.swift
//  CV-MVVM-SwiftUI
//
//  Created by parrilla nelson on 26/04/2020.
//  Copyright © 2020 Nelson Parrilla. All rights reserved.
//

import Foundation

struct FeatureFlags {
    
    static var forceGetCV: Bool {
        return CommandLine.arguments.contains("--force_get_cv_response")
    }
}
