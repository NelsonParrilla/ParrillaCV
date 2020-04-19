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
    
    var backButton: some View {
        Button(action: {
            self.viewModel.state = .personnalInfos
            self.viewModel.isExpInfosVisible = false
        }) {
            HStack(spacing: 4) {
                Image(systemName: "chevron.left")
            }
            .foregroundColor(Color("DarkBlue"))
        }
        .frame(width: 20.0, height: 20.0)
    }
    
    var body: some View {
        
            VStack {
                ZStack {
                    WorkView(viewModel: viewModel).hidden(viewModel.state != .work)
                    SchoolView(viewModel: viewModel).hidden(viewModel.state != .school)
                }
                TabBarView(state: $viewModel.state)
            }.navigationBarTitle(Text(viewModel.state.navBarTitle), displayMode: .inline)
        .navigationBarItems(leading: backButton)

        
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
