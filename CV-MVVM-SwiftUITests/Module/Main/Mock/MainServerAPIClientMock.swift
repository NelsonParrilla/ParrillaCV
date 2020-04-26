//
//  MainServerAPIClientMock.swift
//  CV-MVVM-SwiftUITests
//
//  Created by parrilla nelson on 26/04/2020.
//  Copyright © 2020 Nelson Parrilla. All rights reserved.
//

import Foundation
@testable import CV_MVVM_SwiftUI

final class MainServerAPIClientMock: MainServerAPIClient {

    var response: (Result<CV, NSError>)?
    
    func getCV(then: @escaping (Result<CV, NSError>) -> Void) {
        if let response = response {
            then(response)
        }
    }
}
