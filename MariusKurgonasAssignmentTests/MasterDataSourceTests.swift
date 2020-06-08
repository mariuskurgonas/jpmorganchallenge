//
//  MasterDataSourceTests.swift
//  MariusKurgonasAssignmentTests
//
//  Created by Marius Kurgonas on 06/06/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import XCTest
@testable import MariusKurgonasAssignment

class MasterDataSourceTests: XCTestCase {

    var dataSource: MasterDataSource!
    var presenter: MasterPresenterSpy!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        dataSource = MasterDataSource()
        presenter = MasterPresenterSpy()
        dataSource.presenter = presenter
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNumberOfSectionsAlwaysOne() {
        XCTAssertEqual(dataSource.numberOfSections(in: UITableView()), 1)
    }
    
    func testNumberOfSectionsAlwaysOne2() {
        XCTAssertEqual(dataSource.numberOfSections(in: UITableView()), 1)
    }
    
    func testNumberOfRowsReturnsObjectsCount() {
        XCTAssertEqual(dataSource.objects.count, dataSource.tableView(UITableView(), numberOfRowsInSection: 1))
    }
    
    func testNumberOfRowsReturnsObjectsCount2() {
        XCTAssertEqual(dataSource.objects.count, dataSource.tableView(UITableView(), numberOfRowsInSection: 1000))
    }
    
    func testNumberOfRowsReturnsObjectsCount3() {
        dataSource.objects.append(PersonStub())
        XCTAssertEqual(dataSource.objects.count, dataSource.tableView(UITableView(), numberOfRowsInSection: 99))
    }
    
    func testNumberOfRowsReturnsObjectsCount4() {
        dataSource.objects.append(PersonStub())
        dataSource.objects.append(PersonStub())
        dataSource.objects.append(PersonStub())
        XCTAssertEqual(dataSource.objects.count, dataSource.tableView(UITableView(), numberOfRowsInSection: 13))
    }
    
    func testAddFavouriteCallsPresenterAddFavourite() {
        let name = "aname"
        dataSource.didFavourite(personName: name)
        XCTAssertEqual(presenter.invokedWantsToFavouriteParameters!.personName, name)
    }
    
    func testAddFavouriteCallsPresenterAddFavourite2() {
        let name = "aname1"
        dataSource.didFavourite(personName: name)
        XCTAssertEqual(presenter.invokedWantsToFavouriteParameters!.personName, name)
    }
    
    func testRemoveFavouriteCallsPresenterRemoveFavourite() {
        let name = "aname"
        dataSource.didUnfavourite(personName: name)
        XCTAssertEqual(presenter.invokedWantsToUnfavourtiteParameters!.personName, name)
    }
    
    func testRemoveFavouriteCallsPresenterRemoveFavourite2() {
        let name = "aname1"
        dataSource.didUnfavourite(personName: name)
        XCTAssertEqual(presenter.invokedWantsToUnfavourtiteParameters!.personName, name)
    }
    
    func testCellForIndexPath() {
        let tableView = UITableView()
        tableView.register(MasterTableViewCell.nib(), forCellReuseIdentifier: MasterTableViewCell.reuseIdentifier())
        let p = PersonStub()
        p.name = "ha"
        p.height = "ta"
        p.dob = "2"
        dataSource.objects = [p]
        
        let c = dataSource.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        
        guard let cell = c as? MasterTableViewCell else {
            return XCTFail()
        }
        
        XCTAssertEqual(cell.nameLabel.text, p.name)
        XCTAssertEqual(cell.heightLabel.text, p.height)
        XCTAssertEqual(cell.dobLabel.text, p.dob)
    }
}
