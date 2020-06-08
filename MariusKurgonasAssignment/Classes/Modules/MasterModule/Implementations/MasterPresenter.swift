//
//  MasterPresenter.swift
//  MariusKurgonasAssignment
//
//  Created by Marius Kurgonas on 05/06/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Foundation

class MasterPresenter: MasterPresenting {
    var interactor: MasterInteracting?

    var router: MasterRouting?

    var dataSource: MasterDataSource?

    weak var view: MasterViewing?

    func viewDidLoad() {
        interactor?.fetchMoreRecords()
    }

    func didReachEndOfTableView() {
        interactor?.fetchMoreRecords()
    }

    func didSelectRowAt(index: Int) {
        guard let dataSource = dataSource else {
            return
        }

        if index < dataSource.objects.count {
            let selectedObject = dataSource.objects[index]
            router?.showDetailFor(selectedObject: selectedObject)
        }
    }

    func didFinishPersonsRequest(persons: [Person]) {
        guard let dataSource = dataSource else {
            return
        }

        guard let interactor = interactor else {
            return
        }

        let allFav = interactor.allFavourites()
        for var object in persons {
            dataSource.objects.append(object)
            object.isFavourite = allFav.contains(object.name)
        }
        view?.reload()
    }

    func wantsToFavourite(personName: String) {
        interactor?.addFavourite(personName: personName)
    }

    func wantsToUnfavourtite(personName: String) {
        interactor?.removeFavourite(personName: personName)
    }
}
