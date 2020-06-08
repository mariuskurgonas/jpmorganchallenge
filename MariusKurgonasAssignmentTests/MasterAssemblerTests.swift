//
//  MasterAssemblerTests.swift
//  MariusKurgonasAssignmentTests
//
//  Created by Marius Kurgonas on 07/06/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import XCTest
import Swinject
@testable import MariusKurgonasAssignment

class MasterAssemblerTests: XCTestCase {
    
    var assembler: Assembler!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        assembler = Assembler([MasterAssembler()])
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCanResolveDetailElements() {
        XCTAssertNotNil(assembler.resolver.resolve(MasterViewController.self))
        XCTAssertNotNil(assembler.resolver.resolve(MasterPresenter.self))
        XCTAssertNotNil(assembler.resolver.resolve(MasterDataSource.self))
        XCTAssertNotNil(assembler.resolver.resolve(MasterInteractor.self))
        XCTAssertNotNil(assembler.resolver.resolve(MasterRouter.self))
    }
}
