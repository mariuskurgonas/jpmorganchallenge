//
//  UserDefaults+Extensions.swift
//  MariusKurgonasAssignment
//
//  Created by Marius Kurgonas on 06/06/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Foundation

let kFavouritesUDKey = "kFavouritesUDKey"

extension UserDefaults: FavouriteProviding {
    func addFavourite(personName: String) {
        var array = [String]()
        if let existingArray = value(forKey: kFavouritesUDKey) as? [String] {
            array = existingArray
        }

        if !array.contains(personName) {
            array.append(personName)
        }

        set(array, forKey: kFavouritesUDKey)
        synchronize()
    }

    func removeFavourite(personName: String) {
        var array = [String]()
        if let existingArray = value(forKey: kFavouritesUDKey) as? [String] {
            array = existingArray
        }

        if let index = array.firstIndex(of: personName) {
            array.remove(at: index)
        }

        set(array, forKey: kFavouritesUDKey)
        synchronize()
    }

    func allFavourites() -> [String] {
        var array = [String]()
        if let existingArray = value(forKey: kFavouritesUDKey) as? [String] {
            array = existingArray
        }

        return array
    }
}
