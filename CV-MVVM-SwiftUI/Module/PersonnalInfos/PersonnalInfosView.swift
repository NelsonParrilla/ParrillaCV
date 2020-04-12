//
//  FirstView.swift
//  CV-MVVM-SwiftUI
//
//  Created by parrilla nelson on 12/04/2020.
//  Copyright © 2020 Nelson Parrilla. All rights reserved.
//

import SwiftUI

struct PersonnalInfosView: View {
    
    @ObservedObject var viewModel: MainViewModel
        
    var body: some View {
        
        VStack {
            ImageView(withURL: viewModel.CVDatas.image)              .aspectRatio(contentMode: .fill)
                .frame(width: 150.0, height: 150.0)
                .cornerRadius(100)
                .shadow(color: Color(.sRGB, white: 0, opacity: 0.3), radius: 5, x: 0, y: 5).onTapGesture {
                    self.viewModel.state = .work
            }
            
            
            Text("Nelson PARRILLA")
                .font(.largeTitle)
            Text(viewModel.CVDatas.role)
                .font(.title)
            
            VStack(alignment: .leading) {
                
                HStack {
                    Image("phone").resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20.0, height: 20.0)
                    Text(viewModel.CVDatas.phone).font(.system(size: 12))
                }
                
                HStack {
                    Image("mail").resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20.0, height: 20.0)
                    Text(viewModel.CVDatas.email).font(.system(size: 12))
                }
                
                HStack {
                    Image("home").resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20.0, height: 20.0)
                    Text(viewModel.CVDatas.adresse).font(.system(size: 12))
                }.fixedSize()
            }
            .padding(.leading, -110.0)
            
            ForEach(viewModel.CVDatas.skills, id: \.self) { skill in
                VStack {
                    Spacer()
                        .frame(height: 24.0)
                    SkillView(text: skill.techno, value: Float(skill.value) / 100)
                        .frame(height: 32.0)
                }
                
            }
        }
        
    }
    
}

struct PersonnalInfosView_Previews: PreviewProvider {
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
        
        return PersonnalInfosView(viewModel: viewModel)
    }
}
