//
//  DetailPresenter.swift
//  MariusKurgonasAssignment
//
//  Created by Marius Kurgonas on 05/06/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Foundation

class DetailPresenter: DetailPresenting {
    var dataSource: DetailDataSource?

    weak var view: DetailViewing?

    var selectedPerson: Person?

    func didSelect(object: Person) {
        selectedPerson = object
        let section1 = "Films"
        let section2 = "Species"
        let section3 = "Vehicles"
        let section4 = "Starships"
        dataSource?.sectionNames = [section1, section2, section3, section4]
        dataSource?.objectsForSection = [section1: [], section2: [], section3: [], section4: []]
        for film in object.films {
            dataSource?.objectsForSection[section1]?.append(film)
        }

        for specie in object.species {
            dataSource?.objectsForSection[section2]?.append(specie)
        }

        for vehicle in object.vehicles {
            dataSource?.objectsForSection[section3]?.append(vehicle)
        }

        for starship in object.starships {
            dataSource?.objectsForSection[section4]?.append(starship)
        }

        view?.reload()
    }

    func viewDidLoad() {
        view?.reload()
    }
}
