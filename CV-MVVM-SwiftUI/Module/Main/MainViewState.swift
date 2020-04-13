//
//  MainViewState.swift
//  CV-MVVM-SwiftUI
//
//  Created by parrilla nelson on 12/04/2020.
//  Copyright © 2020 Nelson Parrilla. All rights reserved.
//

import SwiftUI

enum MainViewState: Equatable {
    case personnalInfos
    case work
    case school
    case associative
}

extension MainViewState {
    
    var navBarTitle: String {
        switch self {
        case .personnalInfos:
            return ""

        case .work:
            return "Expériences professionnelles"
            
        case .school:
            return "Parcours scolaire et universitaire"
            
        case .associative:
            return "Activités extra-professionnelles"

        }
    }

}
