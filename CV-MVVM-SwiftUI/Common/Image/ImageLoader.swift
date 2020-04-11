//
//  ImageLoader.swift
//  CV-MVVM-SwiftUI
//
//  Created by Nelson Parrilla on 05/04/2020.
//  Copyright © 2020 Nelson Parrilla. All rights reserved.
//

import SwiftUI

class ImageLoader: ObservableObject {
    @Published var data:Data?

    init(urlString:String) {
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.data = data
            }
        }
        task.resume()
    }
}
