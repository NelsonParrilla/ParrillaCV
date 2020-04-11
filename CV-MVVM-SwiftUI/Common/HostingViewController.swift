//
//  HostingViewController.swift
//  CV-MVVM-SwiftUI
//
//  Created by parrilla nelson on 28/02/2020.
//  Copyright © 2020 parrilla nelson. All rights reserved.
//

import SwiftUI

class HostingViewController: UIHostingController<AnyView> {
    
    @objc override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
}
