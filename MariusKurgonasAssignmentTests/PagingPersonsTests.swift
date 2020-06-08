//
//  PagingPersonsTests.swift
//  MariusKurgonasAssignmentTests
//
//  Created by Marius Kurgonas on 07/06/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import XCTest
import ObjectMapper
@testable import MariusKurgonasAssignment

class PagingPersonsTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testConstructingPagingPersons() {
        let json: [String : Any] = ["next" : "asdf",
                    "results": [["name": "asdf",
                                 "height" : "afasd",
                                 "birth_year": "asfasd",
                                 "homeworlds": "asfsadf",
                                 "films": [],
                                 "vehicles": [],
                                 "starships": [],
                                 "spiecies": []]]]
        let map = Map(mappingType: MappingType.fromJSON, JSON: json)
        let pagingPersons = ApiPagingPersons(map: map)
        
        pagingPersons?.mapping(map: map)
        
        XCTAssertEqual(pagingPersons!.persons.count, 1)
        XCTAssertNotNil(pagingPersons!.hasNextPage)
    }
}
