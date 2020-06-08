//
//  DetailViewing.swift
//  MariusKurgonasAssignment
//
//  Created by Marius Kurgonas on 05/06/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Foundation

protocol DetailViewing: AnyObject {
    var presenter: DetailPresenting? { get set }

    func reload()
}
