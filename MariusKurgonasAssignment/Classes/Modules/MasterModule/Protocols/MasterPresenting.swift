//
//  MasterPresenting.swift
//  MariusKurgonasAssignment
//
//  Created by Marius Kurgonas on 05/06/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Foundation

protocol MasterPresenting: AnyObject {
    var view: MasterViewing? { get set }

    var router: MasterRouting? { get set }

    var interactor: MasterInteracting? { get set }

    var dataSource: MasterDataSource? { get set }

    func didReachEndOfTableView()

    func viewDidLoad()

    func didSelectRowAt(index: Int)

    // MARK: Interactor

    func didFinishPersonsRequest(persons: [Person])

    // MARK: Data source

    func wantsToFavourite(personName: String)

    func wantsToUnfavourtite(personName: String)
}
