//
//  MasterPresenterTests.swift
//  MariusKurgonasAssignmentTests
//
//  Created by Marius Kurgonas on 06/06/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import XCTest
@testable import MariusKurgonasAssignment

class MasterPresenterTests: XCTestCase {

    var presenter: MasterPresenter!
    var view: MasterViewingSpy!
    var router: MasterRoutingSpy!
    var dataSource: MasterDataSourceSpy!
    var interactor: MasterInteractingSpy!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        presenter = MasterPresenter()
        view = MasterViewingSpy()
        presenter.view = view
        router = MasterRoutingSpy()
        presenter.router = router
        dataSource = MasterDataSourceSpy()
        presenter.dataSource = dataSource
        interactor = MasterInteractingSpy()
        presenter.interactor = interactor
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testOnViewDidLoadGetFirstPageOfData() {
        presenter.viewDidLoad()
        
        XCTAssert(interactor.invokedFetchMoreRecords)
    }
    
    func testOnReachingEndOfTableViewGetMoreData() {
        presenter.didReachEndOfTableView()
        
        XCTAssert(interactor.invokedFetchMoreRecords)
    }
    
    func testSelectingRowAtIndexPathForNoReCordsDoesNotCallRouter() {
        presenter.didSelectRowAt(index: 0)
        
        XCTAssert(router.invokedShowDetailFor == false)
    }
    
    func testSelectingRowAtIndexPathForInvalidIndexDoesNotCallRouter() {
        presenter.didSelectRowAt(index: 100)
        
        XCTAssert(router.invokedShowDetailFor == false)
    }
    
    func testSelectingRowAtIndexPathCallsRouter() {
        let personStub = PersonStub()
        personStub.name = "a name"
        dataSource.objects.append(personStub)
        presenter.didSelectRowAt(index: 0)
        
        XCTAssertEqual(router.invokedShowDetailForParameters!.selectedObject.name, personStub.name)
    }
    
    func testSelectingRowAtIndexPathCallsRouter2() {
        let personStub = PersonStub()
        personStub.name = "a name"
        let personStub2 = PersonStub()
        personStub2.name = "a name 2"
        dataSource.objects.append(personStub)
        dataSource.objects.append(personStub2)
        presenter.didSelectRowAt(index: 1)
        
        XCTAssertEqual(router.invokedShowDetailForParameters!.selectedObject.name, personStub2.name)
    }
    
    func testSelectingRowAtIndexPathDoesNotCallRouter() {
        presenter.dataSource = nil
        
        let personStub = PersonStub()
        personStub.name = "a name"
        dataSource.objects.append(personStub)
        presenter.didSelectRowAt(index: 0)
        
        XCTAssertFalse(router.invokedShowDetailFor)
    }
    
    func testSelectingRowAtIndexPathDoesNotCallRouter2() {
        presenter.dataSource = nil
        
        let personStub = PersonStub()
        personStub.name = "a name"
        let personStub2 = PersonStub()
        personStub2.name = "a name 2"
        dataSource.objects.append(personStub)
        dataSource.objects.append(personStub2)
        presenter.didSelectRowAt(index: 1)
        
        XCTAssertFalse(router.invokedShowDetailFor)
    }
    
    func testFinishPersonsRequestCallsViewReload() {
        presenter.didFinishPersonsRequest(persons: [])
        
        XCTAssert(view.invokedReload == true)
    }
    
    func testFinishPersonsRequestCallsAllFavouritesOnInteractor() {
        presenter.didFinishPersonsRequest(persons: [])
        
        XCTAssert(interactor.invokedAllFavourites == true)
    }
    
    func testFinishPersonsRequestWithNonEmptyArrayAppendsItToDataSource() {
        let p1 = PersonStub()
        p1.name = "unique1"
        
        let p2 = PersonStub()
        p2.name = "unique2"
        
        let p3 = PersonStub()
        p3.name = "unique3"
        
        let persons = [p1, p2, p3]
        
        presenter.didFinishPersonsRequest(persons: persons)
        
        for p in persons {
            XCTAssertTrue(dataSource.objects.contains(where: { (person) -> Bool in
                return p.name == person.name
            }))
        }
    }
    
    func testFinishPersonsRequestWithRecordsSetsFavFlags() {
        let p1 = PersonStub()
        p1.name = "unique1"
        
        let p2 = PersonStub()
        p2.name = "unique2"
        
        let p3 = PersonStub()
        p3.name = "unique3"
        
        interactor.stubbedAllFavouritesResult = [p1.name]
        
        let persons = [p1, p2, p3]
        
        presenter.didFinishPersonsRequest(persons: persons)
        
        XCTAssertFalse(p2.isFavourite)
        XCTAssertFalse(p3.isFavourite)
        XCTAssertTrue(p1.isFavourite)
    }
    
    func testFinishPersonsRequestWithRecordsSetsFavFlags2() {
        let p1 = PersonStub()
        p1.name = "unique1"
        
        let p2 = PersonStub()
        p2.name = "unique2"
        
        let p3 = PersonStub()
        p3.name = "unique3"
        
        interactor.stubbedAllFavouritesResult = [p2.name, p3.name]
        
        let persons = [p1, p2, p3]
        
        presenter.didFinishPersonsRequest(persons: persons)
        
        XCTAssertTrue(p2.isFavourite)
        XCTAssertTrue(p3.isFavourite)
        XCTAssertFalse(p1.isFavourite)
    }
    
    func testFinishPersonsRequestDoesNotCallViewReload() {
        presenter.dataSource = nil
        
        presenter.didFinishPersonsRequest(persons: [])
        
        XCTAssert(view.invokedReload == false)
    }
    
    func testFinishPersonsRequestDoesNotCallViewReload2() {
        presenter.interactor = nil
        
        presenter.didFinishPersonsRequest(persons: [])
        
        XCTAssert(view.invokedReload == false)
    }
    
    func testCallingWantToFavouriteForwardsItToInteractor() {
        let string = "string"
        presenter.wantsToFavourite(personName: string)
        
        XCTAssertEqual(interactor.invokedAddFavouriteParameters!.personName, string)
    }
    
    func testCallingWantToFavouriteForwardsItToInteractor2() {
        let string = "string2"
        presenter.wantsToFavourite(personName: string)
        
        XCTAssertEqual(interactor.invokedAddFavouriteParameters!.personName, string)
    }
    
    func testCallingWantToFavouriteForwardsItToInteractor3() {
        let string = "string3"
        presenter.wantsToFavourite(personName: string)
        
        let string2 = "string4"
        presenter.wantsToFavourite(personName: string2)
        
        XCTAssertEqual(interactor.invokedAddFavouriteParametersList.first!.personName, string)
        XCTAssertEqual(interactor.invokedAddFavouriteParametersList.last!.personName, string2)
    }
    
    func testCallingWantToUnfavouriteForwardsItToInteractor() {
        let string = "string"
        presenter.wantsToUnfavourtite(personName: string)
        
        XCTAssertEqual(interactor.invokedRemoveFavouriteParameters!.personName, string)
    }
    
    func testCallingWantToFavouriteUnforwardsItToInteractor2() {
        let string = "string2"
        presenter.wantsToUnfavourtite(personName: string)
        
        XCTAssertEqual(interactor.invokedRemoveFavouriteParameters!.personName, string)
    }
    
    func testCallingWantToFavouriteUnforwardsItToInteractor3() {
        let string = "string3"
        presenter.wantsToUnfavourtite(personName: string)
        
        let string2 = "string4"
        presenter.wantsToUnfavourtite(personName: string2)
        
        XCTAssertEqual(interactor.invokedRemoveFavouriteParametersList.first!.personName, string)
        XCTAssertEqual(interactor.invokedRemoveFavouriteParametersList.last!.personName, string2)
    }
}
