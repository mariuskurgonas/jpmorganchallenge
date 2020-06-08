//
//  MasterViewingSpy.swift
//  MariusKurgonasAssignmentTests
//
//  Created by Marius Kurgonas on 06/06/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Foundation
@testable import MariusKurgonasAssignment

class MasterViewingSpy: MasterViewing {
    var invokedPresenterSetter = false
    var invokedPresenterSetterCount = 0
    var invokedPresenter: MasterPresenting?
    var invokedPresenterList = [MasterPresenting?]()
    var invokedPresenterGetter = false
    var invokedPresenterGetterCount = 0
    var stubbedPresenter: MasterPresenting!
    var presenter: MasterPresenting? {
        set {
            invokedPresenterSetter = true
            invokedPresenterSetterCount += 1
            invokedPresenter = newValue
            invokedPresenterList.append(newValue)
        }
        get {
            invokedPresenterGetter = true
            invokedPresenterGetterCount += 1
            return stubbedPresenter
        }
    }
    var invokedReload = false
    var invokedReloadCount = 0
    func reload() {
        invokedReload = true
        invokedReloadCount += 1
    }
}
