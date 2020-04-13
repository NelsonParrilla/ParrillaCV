//
//  WorkView.swift
//  CV-MVVM-SwiftUI
//
//  Created by parrilla nelson on 13/04/2020.
//  Copyright © 2020 Nelson Parrilla. All rights reserved.
//

import SwiftUI

struct WorkView: View {
    
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        
        
        VStack {
            
            Text("Expérience professionnelle")
                .font(.title)
            
            List {
                
                VStack {

                ForEach(viewModel.CVDatas.professionalExp, id: \.self) { exp in
                    WorkDetailView(date: exp.date, text: exp.description, imageURLString: exp.image)
                    
                }
                    
                }
                
            }.frame(height: UIScreen.main.bounds.height - 180)
            
        }
            
    }
    
}

struct WorkView_Previews: PreviewProvider {
    
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
        
        return WorkView(viewModel: viewModel)
    }
}
