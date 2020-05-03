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
    
    /**
    *  Get CV datas
    */
    func getCV()
    
    /**
    *  Show experience infos screen
    */
    func displayExperienceInfosView()
}

class MainViewModel: ObservableObject, MainViewModelInterface {
    
    @Published var CVDatas = CV(image: defaultImage, role: "", adresse: "", phone: "", email: "", skills: [], professionalExp: [], associative: Experience(title: "", image: "", exp: []), sport: Experience(title: "", image: "", exp: []), languages: Experience(title: "", image: "", exp: []), projects: Experience(title: "", image: "", exp: []))
        
    @Published var isDataLoaded = false
    
    @Published var state = MainViewState.personnalInfos
    
    @Published var isExpInfosVisible = false

    let factory: MainFactoryInterface
    
    lazy var serverAPI: MainServerAPIClient = factory.makeServerAPI()
    
    static let defaultImage = "https://www.eastcottvets.co.uk/uploads/Animals/gingerkitten.jpg"

    init(factory: MainFactoryInterface) {
        
        self.factory = factory
        getCV()
    }
    
    func getCV() {
        
        serverAPI.getCV() { result in
                        
            switch result {
            case .success(let cv):
                self.CVDatas = cv
                self.isDataLoaded = true
                break
            case .failure(_):
                if let path = Bundle.main.path(forResource: "getCVMock", ofType: "json") {
                    do {
                        let decoder = JSONDecoder()
                        let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                        self.CVDatas = try decoder.decode(CV.self, from: data)
                        self.isDataLoaded = true
                    } catch { fatalError("No getCVMock file") }
                }
            }
        }
    }
    
    func displayExperienceInfosView() {
        self.state = .work
        self.isExpInfosVisible = true
    }
}
