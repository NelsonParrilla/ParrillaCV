//
//  MainViewModel.swift
//  CV-MVVM-SwiftUI
//
//  Created by parrilla nelson on 05/03/2020.
//  Copyright © 2020 parrilla nelson. All rights reserved.
//

import Foundation
import SwiftUI

protocol MainViewModelInterface {
    
    func getCV()
}

class MainViewModel: ObservableObject, MainViewModelInterface {
    
    @Published var CVDatas: CV?
    
    @Published var imageURL = URL(string:"test")

    let factory: MainFactoryInterface
    
    lazy var serverAPI: MainServerAPIClient = factory.makeServerAPI()

    init(factory: MainFactoryInterface) {
        
        self.factory = factory
        getCV()
    }
    
    func getCV() {
        
        serverAPI.getCV() { result in
            switch result {
                
            case .success(let cv):
                self.CVDatas = cv
                break
            case .failure(_):
                break
            }
        }
    }
    
}
