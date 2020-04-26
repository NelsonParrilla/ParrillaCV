//
//  WorkDetailView.swift
//  CV-MVVM-SwiftUI
//
//  Created by parrilla nelson on 13/04/2020.
//  Copyright © 2020 Nelson Parrilla. All rights reserved.
//

import SwiftUI

struct WorkDetailView: View {
    
    var exp: ProfessionalExp
    
    var body: some View {
        VStack {
            
            Text(exp.title).fontWeight(.bold).multilineTextAlignment(.center)
            ImageView(withURL: exp.image ?? "")
                .aspectRatio(contentMode: .fill)
                .frame(width: 50.0, height: 50.0)
            
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
                        Spacer().frame(height: 16.0)
                    }
                    
                }
            }
            Spacer().frame(height: 32.0)
            
        }
        
    }
}

struct WorkDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        return WorkDetailView(exp: ProfessionalExp(title: "Work", image: "", exp: [ProfessionalExpDetail(date: "2018/2019", description: "Experience 1")]))
    }
}
