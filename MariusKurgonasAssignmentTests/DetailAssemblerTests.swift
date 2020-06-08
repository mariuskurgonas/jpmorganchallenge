//
//  DetailAssemblerTests.swift
//  MariusKurgonasAssignmentTests
//
//  Created by Marius Kurgonas on 07/06/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import XCTest
import Swinject
@testable import MariusKurgonasAssignment

class DetailAssemblerTests: XCTestCase {

    var assembler: Assembler!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        assembler = Assembler([DetailAssembler()])
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCanResolveDetailElements() {
        XCTAssertNotNil(assembler.resolver.resolve(DetailViewController.self))
        XCTAssertNotNil(assembler.resolver.resolve(DetailPresenter.self))
        XCTAssertNotNil(assembler.resolver.resolve(DetailDataSource.self))
    }
}
