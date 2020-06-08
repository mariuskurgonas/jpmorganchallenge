//
//  MasterInteractor.swift
//  MariusKurgonasAssignment
//
//  Created by Marius Kurgonas on 06/06/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Foundation

class MasterInteractor: MasterInteracting {
    var personService: PersonService?

    var favouriteProviding: FavouriteProviding?

    weak var presenter: MasterPresenting?

    var currentPage: UInt = 1

    var hasNext = true

    func fetchMoreRecords() {
        if hasNext {
            personService?.cancel()
            personService?.getPersonsAt(pageIndex: currentPage, completion: { [weak self] persons, error in
                if let persons = persons {
                    self?.presenter?.didFinishPersonsRequest(persons: persons.persons)
                    self?.currentPage += 1
                    self?.hasNext = persons.hasNextPage != nil
                }
                else if let _ = error {
                    // TODO: Handle error
                }
            })
        }
    }

    func addFavourite(personName: String) {
        favouriteProviding?.addFavourite(personName: personName)
    }

    func removeFavourite(personName: String) {
        favouriteProviding?.removeFavourite(personName: personName)
    }

    func allFavourites() -> [String] {
        return favouriteProviding?.allFavourites() ?? []
    }
}
