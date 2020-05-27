//
//  TabBarView.swift
//  CV-MVVM-SwiftUI
//
//  Created by parrilla nelson on 12/04/2020.
//  Copyright © 2020 Nelson Parrilla. All rights reserved.
//

import SwiftUI
import Combine

struct TabBarView: View {
            
    @Binding var state: MainViewState
        
    var body: some View {
        
        HStack {

            VStack {
                Button(action: {
                    self.state = .work
                }) {
                    Image("work").renderingMode(.original).resizable().aspectRatio(contentMode: .fit).padding(.all, 5)
                }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                Spacer()
                    .frame(height: 0.0)
                if state == .work {
                    Rectangle().fill(Color("DarkBlue")).frame(height: CGFloat(5.0))
                }
            }
            
            VStack {
                Button(action: {
                    self.state = .school
                }) {
                    Image("school").renderingMode(.original).resizable().aspectRatio(contentMode: .fit).padding(.all, 5)
                }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                Spacer()
                    .frame(height: 0.0)
                if state == .school {
                    Rectangle().fill(Color("DarkBlue")).frame(height: CGFloat(5.0))
                }
            }
            
            VStack {
                Button(action: {
                    self.state = .social
                }) {
                    Image("man").renderingMode(.original).resizable().aspectRatio(contentMode: .fit).padding(.all, 5)
                }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                Spacer()
                    .frame(height: 0.0)
                if state == .social {
                    Rectangle().fill(Color("DarkBlue")).frame(height: CGFloat(5.0))
                }
            }
            
        }
        .frame(height: 48.0)
        .background(Rectangle().fill(Color.white).shadow(radius: 8))
        
    }
}

struct TabBarView_Previews: PreviewProvider {
    
    static var previews: some View {
        return TabBarView(state: .constant(.work))
    }
}
