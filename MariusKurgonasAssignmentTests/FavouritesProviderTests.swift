//
//  FavouritesProviderTests.swift
//  MariusKurgonasAssignmentTests
//
//  Created by Marius Kurgonas on 06/06/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import XCTest
@testable import MariusKurgonasAssignment

class FavouritesProviderTests: XCTestCase {

    var favouritesProvider: FavouriteProviding!
    var userDefaults = UserDefaults(suiteName: "favourites-suite")

    override func setUp() {
        favouritesProvider = userDefaults
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        userDefaults?.removePersistentDomain(forName: "favourites-suite")
        userDefaults?.synchronize()
    }

    // MARK: Adding and retrieving

    func testCanSaveAndRetrieve() {
        let string = "random"
        favouritesProvider.addFavourite(personName: string)

        let allStrings = favouritesProvider.allFavourites()

        XCTAssertEqual(1, allStrings.count)
        XCTAssertTrue(allStrings.contains(string))
    }

    func testCanSaveMultipleAndRetrieve() {
        let string = "random"
        let string2 = "random2"
        favouritesProvider.addFavourite(personName: string)
        favouritesProvider.addFavourite(personName: string2)

        let allStrings = favouritesProvider.allFavourites()

        XCTAssertEqual(2, allStrings.count)
        XCTAssertTrue(allStrings.contains(string))
        XCTAssertTrue(allStrings.contains(string2))
    }

    func testDoesNotSaveDuplicates1() {
        let string = "random"
        let string2 = "random2"
        let string3 = "random2"
        favouritesProvider.addFavourite(personName: string)
        favouritesProvider.addFavourite(personName: string2)
        favouritesProvider.addFavourite(personName: string3)

        let allStrings = favouritesProvider.allFavourites()

        XCTAssertEqual(2, allStrings.count)
        XCTAssertTrue(allStrings.contains(string))
        XCTAssertTrue(allStrings.contains(string2))
    }

    func testDoesNotSaveDuplicates2() {
        let string = "random"
        let string2 = "random2"
        let string3 = "random"
        favouritesProvider.addFavourite(personName: string)
        favouritesProvider.addFavourite(personName: string2)
        favouritesProvider.addFavourite(personName: string3)

        let allStrings = favouritesProvider.allFavourites()

        XCTAssertEqual(2, allStrings.count)
        XCTAssertTrue(allStrings.contains(string))
        XCTAssertTrue(allStrings.contains(string2))
    }

    // MARK: adding, removing and retrieving

    func testCanRemovePostAdd() {
        let string = "random"
        favouritesProvider.addFavourite(personName: string)
        favouritesProvider.removeFavourite(personName: string)

        let allFav = favouritesProvider.allFavourites()

        XCTAssert(allFav.count == 0)
    }

    func testDoesNotRemoveByWrongKeyPostAdd() {
        let string = "random"
        favouritesProvider.addFavourite(personName: string)
        favouritesProvider.removeFavourite(personName: "not added name")

        let allFav = favouritesProvider.allFavourites()

        XCTAssert(allFav.count == 1)
        XCTAssertTrue(allFav.contains(string))
    }

    func testCanRemoveAfterMultiple1() {
        let string = "random"
        let string2 = "random2"
        favouritesProvider.addFavourite(personName: string)
        favouritesProvider.addFavourite(personName: string2)

        favouritesProvider.removeFavourite(personName: string)

        let allStrings = favouritesProvider.allFavourites()

        XCTAssertEqual(1, allStrings.count)
        XCTAssertTrue(allStrings.contains(string2))
    }

    func testCanRemoveAfterMultiple4() {
        let string = "random"
        let string2 = "random2"
        
        favouritesProvider.addFavourite(personName: string)
        favouritesProvider.addFavourite(personName: string2)
        favouritesProvider.addFavourite(personName: string2)

        favouritesProvider.removeFavourite(personName: string)

        let allStrings = favouritesProvider.allFavourites()

        XCTAssertEqual(1, allStrings.count)
        XCTAssertTrue(allStrings.contains(string2))
    }

    func testCanRemoveAfterMultiple2() {
        let string = "random"
        let string2 = "random2"
        favouritesProvider.addFavourite(personName: string)
        favouritesProvider.addFavourite(personName: string2)

        favouritesProvider.removeFavourite(personName: string2)

        let allStrings = favouritesProvider.allFavourites()

        XCTAssertEqual(1, allStrings.count)
        XCTAssertTrue(allStrings.contains(string))
    }

    func testCanRemoveAfterMultiple3() {
        let string = "random"
        let string2 = "random2"
        favouritesProvider.addFavourite(personName: string)
        favouritesProvider.addFavourite(personName: string2)
        favouritesProvider.addFavourite(personName: string2)

        favouritesProvider.removeFavourite(personName: string2)

        let allStrings = favouritesProvider.allFavourites()

        XCTAssertEqual(1, allStrings.count)
        XCTAssertTrue(allStrings.contains(string))
    }

    func testDoesNotRemoveNotAddedAfterMultiple() {
        let string = "random"
        let string2 = "random2"
        favouritesProvider.addFavourite(personName: string)
        favouritesProvider.addFavourite(personName: string2)

        favouritesProvider.removeFavourite(personName: "not added")

        let allStrings = favouritesProvider.allFavourites()

        XCTAssertEqual(2, allStrings.count)
        XCTAssertTrue(allStrings.contains(string))
        XCTAssertTrue(allStrings.contains(string2))
    }

    // MARK: Retrieving

    func testNothingToRetrieveIfNothingIsSaved() {
        let allStrings = favouritesProvider.allFavourites()
        XCTAssert(allStrings.isEmpty)
    }
}
