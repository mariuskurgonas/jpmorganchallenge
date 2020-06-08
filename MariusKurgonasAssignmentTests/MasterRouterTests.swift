//
//  MasterRouterTests.swift
//  MariusKurgonasAssignmentTests
//
//  Created by Marius Kurgonas on 06/06/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import XCTest
import UIKit
@testable import MariusKurgonasAssignment

class MasterRouterTests: XCTestCase {

    var router: MasterRouter!
    var split: UISplitViewControllerMock!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        router = MasterRouter()
        split = UISplitViewControllerMock()
        router.splitViewController = split
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDoesNotPropelDetailIfSplitNotSet() {
        router.splitViewController = nil
        
        let person = PersonStub()
        
        router.showDetailFor(selectedObject: person)
        
        XCTAssertFalse(split.showDetailCalled)
    }
    
    func testDoesNotPropelDetailIfNavNotSet() {
        router.detailNavigation = nil
        
        let person = PersonStub()
        
        router.showDetailFor(selectedObject: person)
        
        XCTAssertFalse(split.showDetailCalled)
    }
    
    func testDoesNotPropelDetailIfHierarchyWrong() {
        router.detailNavigation = UINavigationController()
        
        let person = PersonStub()
        
        router.showDetailFor(selectedObject: person)
        
        XCTAssertFalse(split.showDetailCalled)
    }
    
    func testPropelsDetailIfHierarchyRight() {
        let detailView = DetailViewingSpy()
        let presenter = DetailPresenterSpy()
        detailView.presenter = presenter
        let navigation = UINavigationController(rootViewController: detailView)
        router.detailNavigation = navigation
        split.viewControllers = [UINavigationController(), navigation]
        
        let person = PersonStub()
        person.name = "a name"
        
        router.showDetailFor(selectedObject: person)
        
        XCTAssertTrue(split.showDetailCalled)
        XCTAssertEqual(navigation, split.invokedShowDetailsResult!)
        XCTAssertEqual(presenter.invokedDidSelectParameters!.object.name, person.name)
    }
}
