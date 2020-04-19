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
                SocialDetailView(title: NSLocalizedString("social_associative_title", comment: "Vie associative"),
                                 imageName: "team",
                                 exps:viewModel.CVDatas.associative)
                Spacer().frame(height: 32.0)
                SocialDetailView(title: NSLocalizedString("social_sport_title", comment: "Sport"),
                                 imageName: "soccer",
                                 exps:viewModel.CVDatas.sport)
                Spacer().frame(height: 32.0)
                SocialDetailView(title: NSLocalizedString("social_languages_title", comment: "Langues"),
                                 imageName: "earth",
                                 exps:viewModel.CVDatas.languages)
                Spacer().frame(height: 32.0)
                SocialDetailView(title: NSLocalizedString("social_projects_title", comment: "Projets"),
                                 imageName: "light-bulb",
                                 exps:viewModel.CVDatas.projects)
                Spacer().frame(height: 32.0)
                
                
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
