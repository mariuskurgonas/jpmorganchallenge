//
//  MasterInteractorTests.swift
//  MariusKurgonasAssignmentTests
//
//  Created by Marius Kurgonas on 06/06/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import XCTest
@testable import MariusKurgonasAssignment

class MasterInteractorTests: XCTestCase {
    var interactor: MasterInteractor!
    var personService: PersonServiceSpy!
    var presenter: MasterPresenterSpy!
    var favouritesProvider: FavouritesProvidingSpy!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        interactor = MasterInteractor()
        personService = PersonServiceSpy()
        interactor.personService = personService
        presenter = MasterPresenterSpy()
        interactor.presenter = presenter
        favouritesProvider = FavouritesProvidingSpy()
        interactor.favouriteProviding = favouritesProvider
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCurrentPageInitiallyOne() {
        XCTAssertEqual(interactor.currentPage, 1)
    }
    
    func testHasNextPageInitiallyTrue() {
        XCTAssertTrue(interactor.hasNext)
    }
    
    func testFetchMoreRecordsReturnsIfDoesNotHaveNextPage() {
        interactor.hasNext = false
        interactor.fetchMoreRecords()
        
        XCTAssertFalse(personService.invokedCancel)
        XCTAssertFalse(personService.invokedGetPersonsAt)
    }
    
    func testFetchMoreRecordsCallsServiceIfHasNextPage() {
        interactor.fetchMoreRecords()
        
        XCTAssertTrue(personService.invokedCancel)
        XCTAssertTrue(personService.invokedGetPersonsAt)
    }
    
    func testServiceSucceeds() {
        let previousPage = interactor.currentPage
        let pagingPersons = PagingPersonsStub()
        personService.stubbedGetPersonsAtCompletionResult = (pagingPersons, nil)
        
        interactor.fetchMoreRecords()
        
        for person in presenter.invokedDidFinishPersonsRequestParameters!.persons {
            
            XCTAssertTrue(pagingPersons.persons.contains(where: { (p) -> Bool in
                return p.name == person.name
            }))
        }
        
        XCTAssertEqual(previousPage + 1, interactor.currentPage)
        XCTAssertEqual(interactor.hasNext, pagingPersons.hasNextPage != nil)
    }
    
    func testServiceFails() {
        let previousPage = interactor.currentPage
        let previousNext = interactor.hasNext
        personService.stubbedGetPersonsAtCompletionResult = (nil, NSError())
        
        interactor.fetchMoreRecords()
        
        XCTAssertFalse(presenter.invokedDidFinishPersonsRequest)
        XCTAssertEqual(previousPage, interactor.currentPage)
        XCTAssertEqual(interactor.hasNext, previousNext)
    }
    
    func testAddFavouriteCallsCache() {
        let name = "name"
        interactor.addFavourite(personName: name)
        
        XCTAssertEqual(favouritesProvider.invokedAddFavouriteParameters!.personName, name)
    }
    
    func testRemoveFavouriteCallsCache() {
        let name = "name"
        interactor.removeFavourite(personName: name)
        
        XCTAssertEqual(favouritesProvider.invokedRemoveFavouriteParameters!.personName, name)
    }
    
    func testAllFavouriteCallsCache() {
        let stubbedAllFavourites = ["a", "s", "g", "asdfasdfs"]
        favouritesProvider.stubbedAllFavouritesResult = stubbedAllFavourites
        let allFav = interactor.allFavourites()
        
        XCTAssertTrue(favouritesProvider.invokedAllFavourites)
        for i in 0..<allFav.count {
            XCTAssertEqual(allFav[i], stubbedAllFavourites[i])
        }
    }
    
    func testAllFavouritesReturnEmptyIfFavProviderNotSet() {
        interactor.favouriteProviding = nil
        
        XCTAssertTrue(interactor.allFavourites().isEmpty)
    }
}
