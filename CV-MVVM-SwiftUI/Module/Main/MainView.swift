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
               /* VStack {
                    Text("voila")
                    Spacer()

                }
                
                VStack {
                    Text("oui")
                    Spacer()
                }
                
                VStack {
                    Spacer()
                    Text("ooooh")
                }*/
                
                
                Color("MediumBlue").edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                        .frame(height: 0.0)
                    PersonnalInfosView(viewModel: viewModel)
                    Spacer()
                }.hidden((!viewModel.isDataLoaded) || (viewModel.state != .personnalInfos))
                
                /*Stack {
                    WorkView(viewModel: viewModel)

                }.edgesIgnoringSafeArea([.top, .bottom])
                .hidden((viewModel.state != .work))
                */
                
                VStack {
                    WorkView(viewModel: viewModel).hidden(viewModel.state != .work)

                    TabBarView(state: $viewModel.state)
                }
                //.hidden(viewModel.state == .personnalInfos)

            }
        }.edgesIgnoringSafeArea([.top, .bottom])
        
    }
    
}

struct MainView_Previews: PreviewProvider {
    
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
