//
//  MainFactory.swift
//  CV-MVVM-SwiftUI
//
//  Created by parrilla nelson on 05/03/2020.
//  Copyright © 2020 parrilla nelson. All rights reserved.
//

import Foundation

protocol MainFactoryInterface {
    
    func makeServerAPI() -> MainServerAPIClient
}

final class MainFactory: MainFactoryInterface {
    
    let serverAPIClient: ServerAPIClient
    
    init(serverAPIClient: ServerAPIClient) {
        self.serverAPIClient = serverAPIClient
    }
    
    func makeServerAPI() -> MainServerAPIClient {
        return serverAPIClient
    }
}
