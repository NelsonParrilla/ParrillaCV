//
//  ExperienceInfosView.swift
//  CV-MVVM-SwiftUI
//
//  Created by parrilla nelson on 13/04/2020.
//  Copyright © 2020 Nelson Parrilla. All rights reserved.
//

import SwiftUI

struct ExperienceInfosView: View {
    
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        
        VStack {
            ZStack {
                containedView()
            }
            TabBarView(state: $viewModel.state)
        }.navigationBarTitle(Text(viewModel.state.navBarTitle), displayMode: .inline)
        
    }
    
    func containedView() -> some View {
        switch viewModel.state {
        case .work:
            return AnyView(WorkView(viewModel: viewModel)).id("WorkView")
        case .school:
            return AnyView(SchoolView(viewModel: viewModel)).id("SchoolView")
        case .social:
            return AnyView(SocialView(viewModel: viewModel)).id("SocialView")
        case .personnalInfos:
            return AnyView(EmptyView()).id("EmptyView")
        }
    }
}

struct ExperienceInfosView_Previews: PreviewProvider {
    
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
        
        return ExperienceInfosView(viewModel: viewModel)
    }
}
