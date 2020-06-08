//
//  ApiPeopleRouteTests.swift
//  MariusKurgonasAssignmentTests
//
//  Created by Marius Kurgonas on 07/06/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import XCTest
@testable import MariusKurgonasAssignment

class ApiPeopleRouteTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testReturnCorrectPathAndUrl() {
        let route = ApiPeopleRoute.people(pageIndex: 1)
        let ending = "people/?page=1"
        XCTAssertEqual(route.path, ending)
        XCTAssertEqual(route.url(for: ApiEnvironment.production), ApiEnvironment.production.url+"/"+ending)
    }
    
    func testReturnCorrectPathAndUrl2() {
        let route = ApiPeopleRoute.people(pageIndex: 2)
        let ending = "people/?page=2"
        XCTAssertEqual(route.path, ending)
        XCTAssertEqual(route.url(for: ApiEnvironment.production), ApiEnvironment.production.url+"/" + ending)
    }
    
    func testReturnCorrectPathAndUrl3() {
        let route = ApiPeopleRoute.people(pageIndex: 99)
        let ending = "people/?page=99"
        XCTAssertEqual(route.path, ending)
        XCTAssertEqual(route.url(for: ApiEnvironment.production), ApiEnvironment.production.url+"/" + ending)
    }
}
