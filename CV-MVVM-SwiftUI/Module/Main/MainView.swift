//
//  MainView.swift
//  CV-MVVM-SwiftUI
//
//  Created by parrilla nelson on 28/02/2020.
//  Copyright © 2020 parrilla nelson. All rights reserved.
//

import SwiftUI

struct MainView: View {
        
    @ObservedObject var viewModel: MainViewModel
    
    @Binding var address: String
    
    static let defaultImage = "https://www.eastcottvets.co.uk/uploads/Animals/gingerkitten.jpg"
    
    var body: some View {
        NavigationView{
            
            ZStack {
                Color("LightBlue").edgesIgnoringSafeArea(.all)
                
                // Your other content here
                // Other layers will respect the safe area edges
                
                VStack {
                    /*Image(uiImage: <#T##UIImage#>)
                    ImageViewContainer(imageURL: viewModel.CVDatas?.image)*/
                    //Text("tesrtsdf")
                    ImageView(withURL: viewModel.CVDatas?.image ?? MainView.defaultImage)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200.0, height: 200.0)
                    .cornerRadius(100)
                    ForEach(viewModel.CVDatas?.skills ?? [], id: \.self) { skill in
                        SkillView(text: skill.techno, value: Float(skill.value) / 100)
                    }
                    Spacer()

                }
            }
            
        }
        
    }
    
}

struct MainView_Previews: PreviewProvider {
    @State var test: String
    
    static var previews: some View {
        let dependencyContainer = DependencyContainer()
        let viewModel = MainViewModel(factory: dependencyContainer.makeMainFactory() as! MainFactory)
        return MainView(viewModel: viewModel, address: .constant(""))
    }
}
