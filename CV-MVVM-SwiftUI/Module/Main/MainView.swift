//
//  MainView.swift
//  CV-MVVM-SwiftUI
//
//  Created by parrilla nelson on 28/02/2020.
//  Copyright © 2020 parrilla nelson. All rights reserved.
//

import SwiftUIX

struct MainView: View {
    
    @ObservedObject var viewModel: MainViewModel
            
    var body: some View {
        
        NavigationView{
            
            ZStack {
                Color("LightBlue").edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                        .frame(height: CGFloat(120.0))
                    PersonnalInfosView(viewModel: viewModel)
                    Spacer()
                }.edgesIgnoringSafeArea([.top, .bottom]).hidden((!viewModel.isDataLoaded) || (viewModel.state != .personnalInfos))
                
                VStack {
                    EmptyView()
                    TabBarView(state: $viewModel.state)

                }.edgesIgnoringSafeArea([.top, .bottom])
                
            }
        }
        
    }
    
}

struct MainView_Previews: PreviewProvider {
    @State var test: String
    
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
        
        return MainView(viewModel: viewModel)
    }
}
