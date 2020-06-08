//
//  DetailViewControllerTests.swift
//  MariusKurgonasAssignmentTests
//
//  Created by Marius Kurgonas on 07/06/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import XCTest
@testable import MariusKurgonasAssignment

class DetailViewControllerTests: XCTestCase {

    var detailViewController: DetailViewController!
    var presenter: DetailPresenterSpy!
    var dataSource: DetailDataSourceSpy!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        presenter = DetailPresenterSpy()
        detailViewController = UIStoryboard(name: "Main", bundle: Bundle(for: ApiPerson.self)).instantiateViewController(withIdentifier: "detail") as! DetailViewController
        detailViewController.presenter = presenter
        dataSource = DetailDataSourceSpy()
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testViewDidLoadCallsPresenterViewDidLoad() {
        detailViewController.loadViewIfNeeded()
        XCTAssertTrue(presenter.invokedViewDidLoad)
    }
    
    func testReloadsDataOnReloadCall() {
        detailViewController.loadViewIfNeeded()
        detailViewController.tableView.dataSource = dataSource
        dataSource.stubbedSections = 1
        detailViewController.reload()
        XCTAssertTrue(dataSource.calledNumberOfRows)
    }
}
