//
//  SocialDetailView.swift
//  CV-MVVM-SwiftUI
//
//  Created by parrilla nelson on 19/04/2020.
//  Copyright © 2020 Nelson Parrilla. All rights reserved.
//

import SwiftUI

struct SocialDetailView: View {
    
    var title: String
    
    var imageName: String
    
    var exps : [ProfessionalExp]
    
    var body: some View {
        HStack {
            VStack {
                Text(title).multilineTextAlignment(.center).fixedSize()
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: CGFloat(75.0), height: CGFloat(75.0))
            }

            Spacer().frame(width: CGFloat(32.0))
            VStack {
                ForEach(exps, id: \.self) { exp in
                    VStack {
                        Text(exp.date)
                        Spacer().frame(height: 16.0)
                        HStack {
                            Text(exp.description).font(.system(size: 12))
                            Spacer()
                        }
                        Spacer().frame(height: 16.0)
                    }

                }
            }

        }
    }
}

struct SocialDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        return SocialDetailView(title: "Sport", imageName: "polytech", exps:[ProfessionalExp(image: "", date: "2019", description: "test")])
    }
}
