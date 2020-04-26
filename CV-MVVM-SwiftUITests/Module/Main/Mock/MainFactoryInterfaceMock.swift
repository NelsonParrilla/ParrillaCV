//
//  MainFactoryInterfaceMock.swift
//  CV-MVVM-SwiftUITests
//
//  Created by parrilla nelson on 26/04/2020.
//  Copyright © 2020 Nelson Parrilla. All rights reserved.
//

import Foundation
@testable import CV_MVVM_SwiftUI

final class MainFactoryInterfaceMock: MainFactoryInterface {

    let serverAPIClient: MainServerAPIClientMock
    
    init(serverAPIClient: MainServerAPIClientMock){
        self.serverAPIClient = serverAPIClient
    }

    func makeServerAPI() -> MainServerAPIClient {
        return serverAPIClient
    }
}

