//
//  FavouriteProviding.swift
//  MariusKurgonasAssignment
//
//  Created by Marius Kurgonas on 06/06/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Foundation

protocol FavouriteProviding {
    func addFavourite(personName: String)

    func removeFavourite(personName: String)

    func allFavourites() -> [String]
}
