//
//  CV_MVVM_SwiftUIUITests.swift
//  CV-MVVM-SwiftUIUITests
//
//  Created by Nelson Parrilla on 06/03/2020.
//  Copyright © 2020 Nelson Parrilla. All rights reserved.
//

import XCTest
import FBSnapshotTestCase

let app = XCUIApplication()

class MainUITests: MainTestCase {

    override func setUp() {
        
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // Uncomment this line if you want to record screenshots
        //recordMode = true

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPersonnalInfos() {

        setUpAndLaunch()
        
        sleep(2)
        
        verifyView()
    }
    
    func testWork() {
        
        setUpAndLaunch()

        sleep(2)
        
        displayWorkScreenFromPersonnalInfosScreen()
        
        verifyView()
    }
    
    func testSchool() {
        
        setUpAndLaunch()
                
        displayWorkScreenFromPersonnalInfosScreen()
        
        displaySchoolScreenFromMainScreen()

        verifyView()
    }
    
    func testSocial() {
        
        setUpAndLaunch()
        
        displayWorkScreenFromPersonnalInfosScreen()
                
        displaySocialScreenFromMainScreen()
        
        verifyView()
    }
    
    func testBackButton() {
                
        setUpAndLaunch()
        
        displayWorkScreenFromPersonnalInfosScreen()
        
        goBackFromWorkScreen()
        
        verifyView()
    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }

    
}
