//
//  MainTestCase.swift
//  CV-MVVM-SwiftUIUITests
//
//  Created by parrilla nelson on 26/04/2020.
//  Copyright © 2020 Nelson Parrilla. All rights reserved.
//

import XCTest


class MainTestCase: SnapshotTestCase {
    
    func setUpAndLaunch() {
        app.launchEnvironment = ["DISABLE_ANIMATIONS": "1"]
        app.launchArguments.append("--force_get_cv_response")
        app.launch()
        sleep(2)
    }
    
    func displayWorkScreenFromPersonnalInfosScreen() {
        app.navigationBars["_TtGC7SwiftUI19UIHosting"].buttons["chevron.right"].tap()
        sleep(2)
    }
    
    func displaySchoolScreenFromMainScreen() {
        app.buttons["school"].tap()
        sleep(2)
    }
    
    func displaySocialScreenFromMainScreen() {
        app.buttons["man"].tap()
        sleep(2)
    }
    
    func goBackFromWorkScreen() {
        app.navigationBars["Expériences professionnelles"].buttons["chevron.left"].tap()
        sleep(2)
    }

}
