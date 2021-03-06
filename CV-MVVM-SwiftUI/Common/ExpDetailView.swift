//
//  ExpDetailView.swift
//  CV-MVVM-SwiftUI
//
//  Created by parrilla nelson on 13/04/2020.
//  Copyright © 2020 Nelson Parrilla. All rights reserved.
//

import SwiftUI

struct ExpDetailView: View {
    
    var exp: Experience
    
    var body: some View {
        VStack {
            
            Text(exp.title).fontWeight(.bold).multilineTextAlignment(.center)
            if (UIImage(named: exp.image ?? "") != nil) {
                Image(exp.image ?? "")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: CGFloat(50.0), height: CGFloat(50.0))
                .foregroundColor(Color("Green"))

            } else {
                ImageView(withURL: exp.image ?? "")
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50.0, height: 50.0)
            }

            
            VStack {
                ForEach(exp.exp, id: \.self) { exp in
                    VStack {
                        Spacer().frame(height: 16.0)
                        Text(exp.date)
                        Spacer().frame(height: 8.0)
                        HStack {
                            Text(exp.description).font(.system(size: 12))
                            Spacer()
                        }
                    }.padding(.horizontal, 16.0)
                    
                }
            }
            Spacer().frame(height: 32.0)
            
        }
        
    }
}

struct ExpDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        return ExpDetailView(exp: Experience(title: "Work", image: "", exp: [ExperienceDetail(date: "2018/2019", description: "Experience 1")]))
    }
}
