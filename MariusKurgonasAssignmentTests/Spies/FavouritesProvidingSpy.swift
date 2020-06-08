//
//  FavouritesProvidingSpy.swift
//  MariusKurgonasAssignmentTests
//
//  Created by Marius Kurgonas on 06/06/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Foundation
@testable import MariusKurgonasAssignment

class FavouritesProvidingSpy: FavouriteProviding {
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
