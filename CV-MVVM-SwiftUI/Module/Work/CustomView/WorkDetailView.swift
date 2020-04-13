//
//  WorkDetailView.swift
//  CV-MVVM-SwiftUI
//
//  Created by parrilla nelson on 13/04/2020.
//  Copyright © 2020 Nelson Parrilla. All rights reserved.
//

import SwiftUI

struct WorkDetailView: View {
    
    var date: String
    
    var text: String
    
    var imageURLString: String
    
    var body: some View {
        VStack {
            ImageView(withURL: imageURLString)
                .aspectRatio(contentMode: .fill)
                .frame(width: 50.0, height: 50.0)
            Spacer().frame(height: 8.0)
            Text(date)
            Spacer().frame(height: 16.0)
            Text(text).font(.system(size: 12))
        }
    }
}

struct WorkDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        return WorkDetailView(date: "2018/2019", text: "Experience 1", imageURLString: "")
    }
}
