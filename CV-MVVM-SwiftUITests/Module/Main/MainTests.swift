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
        let responseCV = CV(image: "test.png", role: "dev", adresse: "home", phone: "0289839401", email: "nelson.test@gmail.com", skills: [Skill(techno: "C++", value: 80)], professionalExp: [ProfessionalExp(image: "test", date: "17/10/20", description: "blablabla")], associative: [ProfessionalExp(image: "test", date: "17/10/20", description: "blobloblo")], sport: [], languages: [], projects: [])
        serverAPIClientMock.response = .success(responseCV)
        let originalCV =  CV(image: "tsldqsdq.png", role: "bank", adresse: "67 rue du pain", phone: "0989372839", email: "test@gmail.com", skills: [Skill(techno: "C--", value: 60)], professionalExp: [ProfessionalExp(image: "", date: "", description: "")], associative: [ProfessionalExp(image: "test", date: "", description: "blobloblo")], sport: [], languages: [], projects: [])
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
        let originalCV =  CV(image: "tsldqsdq.png", role: "bank", adresse: "67 rue du pain", phone: "0989372839", email: "test@gmail.com", skills: [Skill(techno: "C--", value: 60)], professionalExp: [ProfessionalExp(image: "", date: "", description: "")], associative: [ProfessionalExp(image: "test", date: "", description: "blobloblo")], sport: [], languages: [], projects: [])
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
