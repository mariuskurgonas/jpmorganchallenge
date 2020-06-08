//
//  DetailPresenterTests.swift
//  MariusKurgonasAssignmentTests
//
//  Created by Marius Kurgonas on 07/06/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import XCTest
import ObjectMapper
@testable import MariusKurgonasAssignment

class DetailPresenterTests: XCTestCase {

    var presenter: DetailPresenter!
    var view: DetailViewingSpy!
    var dataSource: DetailDataSource!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        presenter = DetailPresenter()
        view = DetailViewingSpy()
        presenter.view = view
        dataSource = DetailDataSourceSpy()
        presenter.dataSource = dataSource
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testViewDidLoadCallsReload() {
        presenter.viewDidLoad()
        XCTAssertTrue(view.invokedReload)
    }
    
    func testDidSelectCallsViewReload() {
        let p = PersonStub()
        presenter.didSelect(object: p)
        XCTAssertTrue(view.invokedReload)
    }
    
    func testDidSelectSetsSelectedPerson() {
        XCTAssertNil(presenter.selectedPerson)
        
        let p = PersonStub()
        p.name = "hi"
        
        presenter.didSelect(object: p)
        
        XCTAssertEqual(p.name, presenter.selectedPerson!.name)
    }
    
    func testDidSelectSetsSelectedPerson2() {
        XCTAssertNil(presenter.selectedPerson)
        
        let p = PersonStub()
        p.name = "ma"
        
        presenter.didSelect(object: p)
        
        XCTAssertEqual(p.name, presenter.selectedPerson!.name)
    }
    
    func testDidSelectSetsSectionNamesWithEmptyObjects() {
        let section1 = "Films"
        let section2 = "Species"
        let section3 = "Vehicles"
        let section4 = "Starships"
        
        let p = PersonStub()
        p.name = "name"
        
        presenter.didSelect(object: p)
        
        XCTAssertEqual(dataSource.sectionNames.count, 4)
        XCTAssertTrue(dataSource.sectionNames.contains(section1))
        XCTAssertTrue(dataSource.sectionNames.contains(section2))
        XCTAssertTrue(dataSource.sectionNames.contains(section3))
        XCTAssertTrue(dataSource.sectionNames.contains(section4))
        
        var count = 0
        
        for array in dataSource.objectsForSection.values {
            XCTAssertTrue(array.isEmpty)
            count += 1
        }
        
        XCTAssertEqual(count, 4)
    }
    
    func testDidSelectSetsSectionNamesWithFullObjects() {
        let section1 = "Films"
        let section2 = "Species"
        let section3 = "Vehicles"
        let section4 = "Starships"
        
        let p = PersonStub()
        p.name = "name"
        p.films = ["1", "2", "3", "4"]
        p.species = ["sfgd", "asdf", "sdfg", "t3"]
        p.vehicles = ["5", "3", "36", "e"]
        p.starships = ["545", "gd", "456", "34"]
        
        presenter.didSelect(object: p)
        
        XCTAssertEqual(dataSource.sectionNames.count, 4)
        XCTAssertTrue(dataSource.sectionNames.contains(section1))
        XCTAssertTrue(dataSource.sectionNames.contains(section2))
        XCTAssertTrue(dataSource.sectionNames.contains(section3))
        XCTAssertTrue(dataSource.sectionNames.contains(section4))
        
        let filmsObjects = dataSource.objectsForSection[section1]!
        
        XCTAssertEqual(filmsObjects.count, p.films.count)
        
        for object in filmsObjects {
            XCTAssertTrue(p.films.contains(object))
        }
        
        let speciesObjects = dataSource.objectsForSection[section2]!
        
        XCTAssertEqual(speciesObjects.count, p.species.count)
        
        for object in speciesObjects {
            XCTAssertTrue(p.species.contains(object))
        }
        
        let vehiclesObjects = dataSource.objectsForSection[section3]!
        
        XCTAssertEqual(vehiclesObjects.count, p.vehicles.count)
        
        for object in vehiclesObjects {
            XCTAssertTrue(p.vehicles.contains(object))
        }
        
        let starshipsObjects = dataSource.objectsForSection[section4]!
        
        XCTAssertEqual(starshipsObjects.count, p.starships.count)
        
        for object in starshipsObjects {
            XCTAssertTrue(p.starships.contains(object))
        }
    }
}
