//
//  SchoolDetailView.swift
//  CV-MVVM-SwiftUI
//
//  Created by parrilla nelson on 19/04/2020.
//  Copyright © 2020 Nelson Parrilla. All rights reserved.
//

import SwiftUI

struct SchoolDetailView: View {
    
    var date: String
    
    var text: String
    
    var imageName: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 75.0, height: 75.0)
            Spacer().frame(height: 8.0)
            Text(date)
            Spacer().frame(height: 16.0)
            HStack {
                Text(text).font(.system(size: 12))
                Spacer()
            }
        }
    }
}

struct SchoolDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        return SchoolDetailView(date: "2018/2019", text: "Diplôme d'ingénieur en électronique et technologies numériques\nDiplôme universitaire Polytech / Ecole de design de Nantes sur les objets connectés\nPolytech Nantes", imageName: "")
    }
}
