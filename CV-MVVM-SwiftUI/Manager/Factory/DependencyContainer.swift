//
//  DependencyContainer.swift
//  velco tour
//
//  Created by Nicolas Garcia on 28/03/2019.
//  Copyright © 2019 Velco. All rights reserved.
//

import Foundation

final class DependencyContainer {
    
    private var hostURL: String {
        #if DEVELOPMENT
            return "45.32.235.88"
        #else
            return "45.32.235.88"
        #endif
    }
    
    lazy var serverAPIClient = ServerAPIClient(host: hostURL)

    func makeMainFactory() -> MainFactoryInterface {
        let factory = MainFactory(serverAPIClient: serverAPIClient)
        return factory
    }
    
}
