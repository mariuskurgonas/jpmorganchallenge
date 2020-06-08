//
//  DetailDataSourceTests.swift
//  MariusKurgonasAssignmentTests
//
//  Created by Marius Kurgonas on 07/06/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import XCTest
@testable import MariusKurgonasAssignment

class DetailDataSourceTests: XCTestCase {

    var dataSource: DetailDataSource!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        dataSource = DetailDataSource()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testNumberOfSectionsAlwaysSectionsNamesCount() {
        XCTAssertEqual(dataSource.sectionNames.count, dataSource.numberOfSections(in: UITableView()))
    }
    
    func testNumberOfSectionsAlwaysSectionsNamesCount2() {
        dataSource.sectionNames = ["asfsad"]
        XCTAssertEqual(dataSource.sectionNames.count, dataSource.numberOfSections(in: UITableView()))
    }
    
    func testNumberOfSectionsAlwaysSectionsNamesCount3() {
        dataSource.sectionNames = ["asfs", "asdfsaf"]
        XCTAssertEqual(dataSource.sectionNames.count, dataSource.numberOfSections(in: UITableView()))
    }
    
    func testNumberOfSectionsAlwaysSectionsNamesCount4() {
        dataSource.sectionNames = ["asfs", "asdfsaf", "asdfasdfa", "asdfsadfs"]
        XCTAssertEqual(dataSource.sectionNames.count, dataSource.numberOfSections(in: UITableView()))
    }
    
    func testNumberOfRowsObjectsForSectionCount() {
        let section = "asfasd"
        dataSource.sectionNames = [section, "asdfsaf", "asdfasdfa", "asdfsadfs"]
        let numberOfRows = ["ha"]
        dataSource.objectsForSection = [section : numberOfRows]
        XCTAssertEqual(dataSource.objectsForSection[section]!.count, dataSource.tableView(UITableView(), numberOfRowsInSection: 0))
    }
    
    func testNumberOfRowsObjectsForSectionCount2() {
        let section = "asasdfasffasd"
        dataSource.sectionNames = ["asfsadf", section, "asdfasdfa", "asdfsadfs"]
        let numberOfRows = ["ha", "asdfasd", "asdfas"]
        dataSource.objectsForSection = [section : numberOfRows]
        XCTAssertEqual(dataSource.objectsForSection[section]!.count, dataSource.tableView(UITableView(), numberOfRowsInSection: 1))
    }
    
    func testNumberOfRowsObjectsForSectionCountZero() {
        dataSource.sectionNames = ["asdfsaf", "asdfasdfa", "asdfsadfs"]
        XCTAssertEqual(0, dataSource.tableView(UITableView(), numberOfRowsInSection: 0))
    }
    
    func testNumberOfRowsObjectsForSectionCountZero2() {
        let section = "asasdfasffasd"
        dataSource.sectionNames = ["asfsadf", section, "asdfasdfa", "asdfsadfs"]
        let numberOfRows = ["ha", "asdfasd", "asdfas"]
        dataSource.objectsForSection = [section : numberOfRows]
        XCTAssertEqual(0, dataSource.tableView(UITableView(), numberOfRowsInSection: 0))
    }
    
    func testNumberOfRowsObjectsForSectionCountZero3() {
        let section = "asasdfasffasd"
        dataSource.sectionNames = ["asfsadf", section, "asdfasdfa", "asdfsadfs"]
        let numberOfRows = [String]()
        dataSource.objectsForSection = [section : numberOfRows]
        XCTAssertEqual(0, dataSource.tableView(UITableView(), numberOfRowsInSection: 0))
    }
    
    func testNumberOfRowsObjectsForSectionCountZero4() {
        let section = "asasdfasffasd"
        dataSource.sectionNames = ["asfsadf", section, "asdfasdfa", "asdfsadfs"]
        XCTAssertEqual(0, dataSource.tableView(UITableView(), numberOfRowsInSection: 0))
    }
    
    func testHeaderSectionTitleAlwaysFromSectionNames() {
        let sectionName = "asdfas"
        dataSource.sectionNames = [sectionName]
        XCTAssertEqual(sectionName, dataSource.tableView(UITableView(), titleForHeaderInSection: 0))
    }
    
    func testHeaderSectionTitleAlwaysFromSectionNames2() {
        let sectionName = "asdfadsfasas"
        dataSource.sectionNames = ["safsad", sectionName]
        XCTAssertEqual(sectionName, dataSource.tableView(UITableView(), titleForHeaderInSection: 1))
    }
    
    func testHeaderSectionTitleAlwaysFromSectionNames3() {
        let sectionName = "asasdfsdafdfas"
        dataSource.sectionNames = ["safsad", sectionName, "asdfasfasd"]
        XCTAssertEqual(sectionName, dataSource.tableView(UITableView(), titleForHeaderInSection: 1))
    }
    
    func testKeyPathForName() {
        XCTAssertEqual(dataSource.keyPathFor(sectionName: "FiLmS"), "title")
    }
    
    func testKeyPathForName2() {
        XCTAssertEqual(dataSource.keyPathFor(sectionName: "FILMS"), "title")
    }
    
    func testKeyPathForName3() {
        XCTAssertEqual(dataSource.keyPathFor(sectionName: "films"), "title")
    }
    
    func testKeyPathForName4() {
        XCTAssertEqual(dataSource.keyPathFor(sectionName: "asdfasdfa"), "name")
    }
    
    func testKeyPathForName5() {
        XCTAssertEqual(dataSource.keyPathFor(sectionName: ""), "name")
    }
    
    func testKeyPathForName6() {
        XCTAssertEqual(dataSource.keyPathFor(sectionName: "daf adfa adfa"), "name")
    }
    
    func testCellForIndexPath() {
        let indexRow = 0
        
        let tableView = UITableView()
        tableView.register(DetailTableViewCell.nib(), forCellReuseIdentifier: DetailTableViewCell.reuseIdentifier())
        let section = "asasdfasffasd"
        dataSource.sectionNames = ["asfsadf", section, "asdfasdfa", "asdfsadfs"]
        let numberOfRows = ["ha", "asdfasd", "asdfas"]
        dataSource.objectsForSection = [section : numberOfRows]
        
        let c = dataSource.tableView(tableView, cellForRowAt: IndexPath(row: indexRow, section: 1))
        
        guard let cell = c as? DetailTableViewCell else {
            return XCTFail()
        }
        
        XCTAssertEqual(cell.textLabel?.text, "Receiving...")
    }
    
    func testCellForIndexPath2() {
        let indexRow = 2
        
        let tableView = UITableView()
        tableView.register(DetailTableViewCell.nib(), forCellReuseIdentifier: DetailTableViewCell.reuseIdentifier())
        let section = "asasdsd"
        dataSource.sectionNames = [section, "asfasdfdf", "fasdfa"]
        let numberOfRows = ["ha", "asdfasd", "asdfas"]
        dataSource.objectsForSection = [section : numberOfRows]
        
        let c = dataSource.tableView(tableView, cellForRowAt: IndexPath(row: indexRow, section: 0))
        
        guard let cell = c as? DetailTableViewCell else {
            return XCTFail()
        }
        
        XCTAssertEqual(cell.textLabel?.text, "Receiving...")
    }
    
    func testCellForIndexPathFAIL() {
        let indexRow = 2
        
        let tableView = UITableView()
        tableView.register(DetailTableViewCell.nib(), forCellReuseIdentifier: DetailTableViewCell.reuseIdentifier())
        let section = "asasdsd"
        dataSource.sectionNames = [section, "asfasdfdf", "fasdfa"]
        let numberOfRows = ["ha", "asdfasd", "asdfas"]
        dataSource.objectsForSection = [section : numberOfRows]
        
        let c = dataSource.tableView(tableView, cellForRowAt: IndexPath(row: indexRow, section: 1))
        
        guard let cell = c as? DetailTableViewCell else {
            return XCTFail()
        }
        
        XCTAssertNotEqual(cell.textLabel?.text, "Receiving...")
    }
}
