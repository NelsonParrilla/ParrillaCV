//
//  AssociativeView.swift
//  CV-MVVM-SwiftUI
//
//  Created by parrilla nelson on 19/04/2020.
//  Copyright © 2020 Nelson Parrilla. All rights reserved.
//

import SwiftUI

struct SocialView: View {
    
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        
        List {
            
            VStack {
                Spacer().frame(height: 32.0)
                ExpDetailView(exp: Experience(title: NSLocalizedString("social_associative_title", comment: "Vie associative"), image: "team", exp: viewModel.CVDatas.associative.exp))
                ExpDetailView(exp: Experience(title: NSLocalizedString("social_sport_title", comment: "Sport"), image: "soccer", exp: viewModel.CVDatas.sport.exp))
                ExpDetailView(exp: Experience(title: NSLocalizedString("social_languages_title", comment: "Langues"), image: "earth", exp: viewModel.CVDatas.languages.exp))
                ExpDetailView(exp: Experience(title: NSLocalizedString("social_projects_title", comment: "Projets"), image: "light-bulb", exp: viewModel.CVDatas.projects.exp))
            }
            
        }
        
    }
    
}

struct SocialView_Previews: PreviewProvider {
    
    static var previews: some View {
        let dependencyContainer = DependencyContainer()
        let viewModel = MainViewModel(factory: dependencyContainer.makeMainFactory() as! MainFactory)
        
        if let path = Bundle.main.path(forResource: "getCVMock", ofType: "json") {
            do {
                let decoder = JSONDecoder()
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                viewModel.CVDatas = try decoder.decode(CV.self, from: data)
            } catch { fatalError("No getCVMock file") }
        }
        
        return SocialView(viewModel: viewModel)
    }
}
