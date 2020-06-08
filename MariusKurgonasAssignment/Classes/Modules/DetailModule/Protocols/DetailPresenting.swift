//
//  DetailPresenting.swift
//  MariusKurgonasAssignment
//
//  Created by Marius Kurgonas on 05/06/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Foundation

protocol DetailPresenting {
    var view: DetailViewing? { get set }

    var dataSource: DetailDataSource? { get set }

    func didSelect(object: Person)

    func viewDidLoad()
}
