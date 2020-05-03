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
                ExpDetailView(exp: Experience(title: NSLocalizedString("school_polytech", comment: "Polytech Nantes"),
                                                    image: "polytech",
                                                    exp: [ExperienceDetail(date: "2015",
                                                                                description: NSLocalizedString("school_2015_polytech",
                                                                                                               comment: ""))]))
                ExpDetailView(exp: Experience(title: NSLocalizedString("school_design", comment: "Ecole de design de Nantes"),
                                                    image: "ecole_design",
                                                    exp: [ExperienceDetail(date: "2015",
                                                                                description: NSLocalizedString("school_2015_dessiin", comment: ""))]))
                ExpDetailView(exp: Experience(title: NSLocalizedString("school_iut", comment: "I.U.T. de Tours"),
                                                    image: "iut",
                                                    exp: [ExperienceDetail(date: "2012",
                                                                                description: NSLocalizedString("school_2012", comment: ""))]))
                ExpDetailView(exp: Experience(title: NSLocalizedString("school_benjam", comment: "Lycée Benjamin Franklin - Orléans"),
                                                    image: "benjam",
                                                    exp: [ExperienceDetail(date: "2010",
                                                                                description: NSLocalizedString("school_2010", comment: ""))]))
                ExpDetailView(exp: Experience(title: NSLocalizedString("school_benjam", comment: "Lycée Benjamin Franklin - Orléans"),
                                                    image: "benjam",
                                                    exp: [ExperienceDetail(date: "2008",
                                                                                description: NSLocalizedString("school_2008", comment: ""))]))
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
