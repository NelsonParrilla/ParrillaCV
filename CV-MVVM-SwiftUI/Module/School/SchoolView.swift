//
//  SchoolView.swift
//  CV-MVVM-SwiftUI
//
//  Created by parrilla nelson on 19/04/2020.
//  Copyright © 2020 Nelson Parrilla. All rights reserved.
//

import SwiftUI

struct SchoolView: View {
    
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        
        List {
            VStack {
                Spacer().frame(height: 32.0)
                SchoolDetailView(date: "2015", text: NSLocalizedString("school_2015_polytech", comment: ""), imageName: "polytech")
                SchoolDetailView(date: "2015", text: NSLocalizedString("school_2015_dessiin", comment: ""), imageName: "ecole_design")
                SchoolDetailView(date: "2012", text: NSLocalizedString("school_2012", comment: ""), imageName: "iut")
                SchoolDetailView(date: "2010", text: NSLocalizedString("school_2010", comment: ""), imageName: "benjam")
                SchoolDetailView(date: "2008", text: NSLocalizedString("school_2008", comment: ""), imageName: "benjam")
            }
            
        }
        
    }
    
}

struct SchoolView_Previews: PreviewProvider {
    
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
        
        return SchoolView(viewModel: viewModel)
    }
}
