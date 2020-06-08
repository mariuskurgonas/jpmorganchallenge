//
//  DetailPresenterSpy.swift
//  MariusKurgonasAssignmentTests
//
//  Created by Marius Kurgonas on 06/06/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Foundation
@testable import MariusKurgonasAssignment

class DetailPresenterSpy: DetailPresenting {
    var invokedViewSetter = false
    var invokedViewSetterCount = 0
    var invokedView: DetailViewing?
    var invokedViewList = [DetailViewing?]()
    var invokedViewGetter = false
    var invokedViewGetterCount = 0
    var stubbedView: DetailViewing!
    var view: DetailViewing? {
        set {
            invokedViewSetter = true
            invokedViewSetterCount += 1
            invokedView = newValue
            invokedViewList.append(newValue)
        }
        get {
            invokedViewGetter = true
            invokedViewGetterCount += 1
            return stubbedView
        }
    }
    var invokedDataSourceSetter = false
    var invokedDataSourceSetterCount = 0
    var invokedDataSource: DetailDataSource?
    var invokedDataSourceList = [DetailDataSource?]()
    var invokedDataSourceGetter = false
    var invokedDataSourceGetterCount = 0
    var stubbedDataSource: DetailDataSource!
    var dataSource: DetailDataSource? {
        set {
            invokedDataSourceSetter = true
            invokedDataSourceSetterCount += 1
            invokedDataSource = newValue
            invokedDataSourceList.append(newValue)
        }
        get {
            invokedDataSourceGetter = true
            invokedDataSourceGetterCount += 1
            return stubbedDataSource
        }
    }
    var invokedDidSelect = false
    var invokedDidSelectCount = 0
    var invokedDidSelectParameters: (object: Person, Void)?
    var invokedDidSelectParametersList = [(object: Person, Void)]()
    func didSelect(object: Person) {
        invokedDidSelect = true
        invokedDidSelectCount += 1
        invokedDidSelectParameters = (object, ())
        invokedDidSelectParametersList.append((object, ()))
    }
    var invokedViewDidLoad = false
    var invokedViewDidLoadCount = 0
    func viewDidLoad() {
        invokedViewDidLoad = true
        invokedViewDidLoadCount += 1
    }
}
