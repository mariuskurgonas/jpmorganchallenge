//
//  MasterInteractingSpy.swift
//  MariusKurgonasAssignmentTests
//
//  Created by Marius Kurgonas on 06/06/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Foundation
@testable import MariusKurgonasAssignment

class MasterInteractingSpy: MasterInteracting {
    var invokedPresenterSetter = false
    var invokedPresenterSetterCount = 0
    var invokedPresenter: MasterPresenting?
    var invokedPresenterList = [MasterPresenting?]()
    var invokedPresenterGetter = false
    var invokedPresenterGetterCount = 0
    var stubbedPresenter: MasterPresenting!
    var presenter: MasterPresenting? {
        set {
            invokedPresenterSetter = true
            invokedPresenterSetterCount += 1
            invokedPresenter = newValue
            invokedPresenterList.append(newValue)
        }
        get {
            invokedPresenterGetter = true
            invokedPresenterGetterCount += 1
            return stubbedPresenter
        }
    }
    var invokedFavouriteProvidingSetter = false
    var invokedFavouriteProvidingSetterCount = 0
    var invokedFavouriteProviding: FavouriteProviding?
    var invokedFavouriteProvidingList = [FavouriteProviding?]()
    var invokedFavouriteProvidingGetter = false
    var invokedFavouriteProvidingGetterCount = 0
    var stubbedFavouriteProviding: FavouriteProviding!
    var favouriteProviding: FavouriteProviding? {
        set {
            invokedFavouriteProvidingSetter = true
            invokedFavouriteProvidingSetterCount += 1
            invokedFavouriteProviding = newValue
            invokedFavouriteProvidingList.append(newValue)
        }
        get {
            invokedFavouriteProvidingGetter = true
            invokedFavouriteProvidingGetterCount += 1
            return stubbedFavouriteProviding
        }
    }
    var invokedFetchMoreRecords = false
    var invokedFetchMoreRecordsCount = 0
    func fetchMoreRecords() {
        invokedFetchMoreRecords = true
        invokedFetchMoreRecordsCount += 1
    }
    var invokedAddFavourite = false
    var invokedAddFavouriteCount = 0
    var invokedAddFavouriteParameters: (personName: String, Void)?
    var invokedAddFavouriteParametersList = [(personName: String, Void)]()
    func addFavourite(personName: String) {
        invokedAddFavourite = true
        invokedAddFavouriteCount += 1
        invokedAddFavouriteParameters = (personName, ())
        invokedAddFavouriteParametersList.append((personName, ()))
    }
    var invokedRemoveFavourite = false
    var invokedRemoveFavouriteCount = 0
    var invokedRemoveFavouriteParameters: (personName: String, Void)?
    var invokedRemoveFavouriteParametersList = [(personName: String, Void)]()
    func removeFavourite(personName: String) {
        invokedRemoveFavourite = true
        invokedRemoveFavouriteCount += 1
        invokedRemoveFavouriteParameters = (personName, ())
        invokedRemoveFavouriteParametersList.append((personName, ()))
    }
    var invokedAllFavourites = false
    var invokedAllFavouritesCount = 0
    var stubbedAllFavouritesResult: [String]! = []
    func allFavourites() -> [String] {
        invokedAllFavourites = true
        invokedAllFavouritesCount += 1
        return stubbedAllFavouritesResult
    }
}
