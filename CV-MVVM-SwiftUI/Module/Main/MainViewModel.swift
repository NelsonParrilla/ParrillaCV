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
    
    @Published var CVDatas = CV(image: defaultImage, role: "", adresse: "", phone: "", email: "", skills: [], professionalExp: [], associative: "", sport: "", languages: "", projects: "")
        
    @Published var isDataLoaded = false
    
    @Published var state = MainViewState.personnalInfos

    let factory: MainFactoryInterface
    
    lazy var serverAPI: MainServerAPIClient = factory.makeServerAPI()
    
    static let defaultImage = "https://www.eastcottvets.co.uk/uploads/Animals/gingerkitten.jpg"

    init(factory: MainFactoryInterface) {
        
        self.factory = factory
        getCV()
    }
    
    func getCV() {
        
        serverAPI.getCV() { result in
            
            self.isDataLoaded = true
            
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
