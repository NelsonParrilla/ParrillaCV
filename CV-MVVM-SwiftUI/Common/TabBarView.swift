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
        
        HStack(alignment: .top) {

            VStack {
                Button(action: {
                    self.state = .work
                }) {
                    Image("work").renderingMode(.original).resizable().aspectRatio(contentMode: .fit).padding(.all, 10)
                }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                Spacer()
                    .frame(height: 0.0)
                Rectangle().fill(Color("DarkBlue")).frame(height: CGFloat(5.0)).hidden(!(state == .work))
            }
            
            VStack {
                Button(action: {
                    self.state = .school
                }) {
                    Image("school").renderingMode(.original).resizable().aspectRatio(contentMode: .fit).padding(.all, 10)
                }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                Spacer()
                    .frame(height: 0.0)
                Rectangle().fill(Color("DarkBlue")).frame(height: CGFloat(5.0)).hidden(!(state == .school))
            }
            
            VStack {
                Button(action: {
                    self.state = .associative
                }) {
                    Image("team").renderingMode(.original).resizable().aspectRatio(contentMode: .fit).padding(.all, 10)
                }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                Spacer()
                    .frame(height: 0.0)
                Rectangle().fill(Color("DarkBlue")).frame(height: CGFloat(5.0)).hidden(!(state == .associative))
            }
            
        }
        .frame(height: 48.0)
        .hidden(state == .personnalInfos)

    }
}

struct TabBarView_Previews: PreviewProvider {
    
    static var previews: some View {
        return TabBarView(state: .constant(.work))
    }
}
