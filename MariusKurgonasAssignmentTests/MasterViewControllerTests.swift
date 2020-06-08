//
//  MasterViewControllerTests.swift
//  MariusKurgonasAssignmentTests
//
//  Created by Marius Kurgonas on 07/06/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import XCTest
@testable import MariusKurgonasAssignment

class MasterViewControllerTests: XCTestCase {

    var view: MasterViewController!
    var presenter: MasterPresenterSpy!
    var dataSource: MasterDataSourceSpy!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        presenter = MasterPresenterSpy()
        view = UIStoryboard(name: "Main", bundle: Bundle(for: ApiPerson.self)).instantiateViewController(withIdentifier: "master") as! MasterViewController
        view.presenter = presenter
        dataSource = MasterDataSourceSpy()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testViewDidLoadCallsPresenterViewDidLoad() {
        view.loadViewIfNeeded()
        XCTAssertTrue(presenter.invokedViewDidLoad)
    }
    
    func testViewWillAppearWithoutSplitReturnsEarly() {
        view.loadViewIfNeeded()
        view.viewWillAppear(false)
    }
    
    func testDidSelectRowCallsPresenterDidSelectRow() {
        let row = 0
        view.tableView(UITableView(), didSelectRowAt: IndexPath(row: row, section: 1))
        XCTAssertEqual(presenter.invokedDidSelectRowAtParameters!.index, row)
    }
    
    func testDidSelectRowCallsPresenterDidSelectRow2() {
        let row = 99
        view.tableView(UITableView(), didSelectRowAt: IndexPath(row: row, section: 1))
        XCTAssertEqual(presenter.invokedDidSelectRowAtParameters!.index, row)
    }
    
    func testWillDisplayCellCallsPresenter() {
        view.loadViewIfNeeded()
        view.tableView.dataSource = dataSource
        
        let p = PersonStub()
        p.name = "asdfsad"
        dataSource.objects = [p]
        dataSource.stubbedNumberOfRowsInSection = dataSource.objects.count
        view.tableView(view.tableView, willDisplay: UITableViewCell(), forRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(presenter.invokedDidReachEndOfTableView)
    }
    
    func testReloadsTableOnReloadCall() {
        view.loadViewIfNeeded()
        view.tableView.dataSource = dataSource
        dataSource.stubbedNumberOfSection = 1
        view.reload()
        XCTAssertTrue(dataSource.numberOfSectionsCalled)
    }
}
