//
//  SkillView.swift
//  CV-MVVM-SwiftUI
//
//  Created by Nelson Parrilla on 07/04/2020.
//  Copyright © 2020 Nelson Parrilla. All rights reserved.
//

import SwiftUI

struct SkillView: View {
    
    var text: String
    
    var value: Float
    
    var body: some View {
        VStack {
            Text(text)
                .fontWeight(.bold)
            Spacer()
                .frame(height: 0.0)
            Slider(value: .constant(value))
                .padding(.horizontal, 32.0)
        }
    }
}

struct SkillView_Previews: PreviewProvider {
    
    static var previews: some View {
        return SkillView(text: "Swift", value: 0.8)
    }
}
