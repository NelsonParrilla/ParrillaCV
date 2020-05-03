//
//  MainTests.swift
//  CV-MVVM-SwiftUITests
//
//  Created by parrilla nelson on 26/04/2020.
//  Copyright © 2020 Nelson Parrilla. All rights reserved.
//

import XCTest
@testable import CV_MVVM_SwiftUI

final class MainTests: XCTestCase {
    
    var sut: MainViewModel!
    var serverAPIClientMock: MainServerAPIClientMock!
    
    override func setUp() {
        serverAPIClientMock = MainServerAPIClientMock()
        sut = MainViewModel(factory: MainFactoryInterfaceMock(serverAPIClient: serverAPIClientMock))
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGetCV() {
        // Given
        let respExp = ProfessionalExp(title: "titleResp", image: "", exp: [])
        let responseCV = CV(image: "test.png", role: "dev", adresse: "home", phone: "0289839401", email: "nelson.test@gmail.com", skills: [Skill(techno: "C++", value: 80)], professionalExp: [respExp], associative: respExp, sport: respExp, languages: respExp, projects: respExp)
        serverAPIClientMock.response = .success(responseCV)
        let originalExp = ProfessionalExp(title: "originalResp", image: "", exp: [])
        let originalCV =  CV(image: "tsldqsdq.png", role: "bank", adresse: "67 rue du pain", phone: "0989372839", email: "test@gmail.com", skills: [Skill(techno: "C--", value: 60)], professionalExp: [originalExp], associative: originalExp, sport: originalExp, languages: originalExp, projects: originalExp)
        sut.CVDatas = originalCV
        
        // When
        sut.getCV()
        
        // Then
        XCTAssertEqual(sut.CVDatas, responseCV)
        XCTAssertEqual(sut.isDataLoaded, true)
    }
    
    func testGetCVError() {
        // Given
        serverAPIClientMock.response = .failure(NSError(domain: "CV", code: 1, userInfo: [:]))
        let originalExp = ProfessionalExp(title: "originalResp", image: "", exp: [])
        let originalCV =  CV(image: "tsldqsdq.png", role: "bank", adresse: "67 rue du pain", phone: "0989372839", email: "test@gmail.com", skills: [Skill(techno: "C--", value: 60)], professionalExp: [originalExp], associative: originalExp, sport: originalExp, languages: originalExp, projects: originalExp)
        sut.CVDatas = originalCV
        
        // When
        sut.getCV()
        
        // Then
        XCTAssertNotEqual(sut.CVDatas, originalCV)
        XCTAssertTrue(sut.isDataLoaded)
    }
    
    func testDisplayExperienceInfosView() {
        // When
        sut.displayExperienceInfosView()
        
        // Then
        XCTAssertEqual(sut.state, .work)
        XCTAssertTrue(sut.isExpInfosVisible)
    }
}
