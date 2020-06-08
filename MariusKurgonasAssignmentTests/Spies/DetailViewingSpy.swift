//
//  DetailViewingSpy.swift
//  MariusKurgonasAssignmentTests
//
//  Created by Marius Kurgonas on 06/06/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Foundation
import UIKit
@testable import MariusKurgonasAssignment

class DetailViewingSpy: UIViewController, DetailViewing {
    var invokedPresenterSetter = false
    var invokedPresenterSetterCount = 0
    var invokedPresenter: DetailPresenting?
    var invokedPresenterList = [DetailPresenting?]()
    var invokedPresenterGetter = false
    var invokedPresenterGetterCount = 0
    var stubbedPresenter: DetailPresenting!
    var presenter: DetailPresenting?
    var invokedReload = false
    var invokedReloadCount = 0
    func reload() {
        invokedReload = true
        invokedReloadCount += 1
    }
}
