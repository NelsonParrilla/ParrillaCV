//
//  AnyGestureRecognizer.swift
//  CV-MVVM-SwiftUI
//
//  Created by parrilla nelson on 02/03/2020.
//  Copyright © 2020 parrilla nelson. All rights reserved.
//

import UIKit

class AnyGestureRecognizer: UIGestureRecognizer {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        state = .began
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
       state = .ended
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent) {
        state = .cancelled
    }
}
