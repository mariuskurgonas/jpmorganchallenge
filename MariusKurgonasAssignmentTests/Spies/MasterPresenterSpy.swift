//
//  MasterPresenterSpy.swift
//  MariusKurgonasAssignmentTests
//
//  Created by Marius Kurgonas on 06/06/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Foundation
@testable import MariusKurgonasAssignment

class MasterPresenterSpy: MasterPresenting {
    var invokedViewSetter = false
    var invokedViewSetterCount = 0
    var invokedView: MasterViewing?
    var invokedViewList = [MasterViewing?]()
    var invokedViewGetter = false
    var invokedViewGetterCount = 0
    var stubbedView: MasterViewing!
    var view: MasterViewing? {
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
    var invokedRouterSetter = false
    var invokedRouterSetterCount = 0
    var invokedRouter: MasterRouting?
    var invokedRouterList = [MasterRouting?]()
    var invokedRouterGetter = false
    var invokedRouterGetterCount = 0
    var stubbedRouter: MasterRouting!
    var router: MasterRouting? {
        set {
            invokedRouterSetter = true
            invokedRouterSetterCount += 1
            invokedRouter = newValue
            invokedRouterList.append(newValue)
        }
        get {
            invokedRouterGetter = true
            invokedRouterGetterCount += 1
            return stubbedRouter
        }
    }
    var invokedInteractorSetter = false
    var invokedInteractorSetterCount = 0
    var invokedInteractor: MasterInteracting?
    var invokedInteractorList = [MasterInteracting?]()
    var invokedInteractorGetter = false
    var invokedInteractorGetterCount = 0
    var stubbedInteractor: MasterInteracting!
    var interactor: MasterInteracting? {
        set {
            invokedInteractorSetter = true
            invokedInteractorSetterCount += 1
            invokedInteractor = newValue
            invokedInteractorList.append(newValue)
        }
        get {
            invokedInteractorGetter = true
            invokedInteractorGetterCount += 1
            return stubbedInteractor
        }
    }
    var invokedDataSourceSetter = false
    var invokedDataSourceSetterCount = 0
    var invokedDataSource: MasterDataSource?
    var invokedDataSourceList = [MasterDataSource?]()
    var invokedDataSourceGetter = false
    var invokedDataSourceGetterCount = 0
    var stubbedDataSource: MasterDataSource!
    var dataSource: MasterDataSource? {
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
    var invokedDidReachEndOfTableView = false
    var invokedDidReachEndOfTableViewCount = 0
    func didReachEndOfTableView() {
        invokedDidReachEndOfTableView = true
        invokedDidReachEndOfTableViewCount += 1
    }
    var invokedViewDidLoad = false
    var invokedViewDidLoadCount = 0
    func viewDidLoad() {
        invokedViewDidLoad = true
        invokedViewDidLoadCount += 1
    }
    var invokedDidSelectRowAt = false
    var invokedDidSelectRowAtCount = 0
    var invokedDidSelectRowAtParameters: (index: Int, Void)?
    var invokedDidSelectRowAtParametersList = [(index: Int, Void)]()
    func didSelectRowAt(index: Int) {
        invokedDidSelectRowAt = true
        invokedDidSelectRowAtCount += 1
        invokedDidSelectRowAtParameters = (index, ())
        invokedDidSelectRowAtParametersList.append((index, ()))
    }
    var invokedDidFinishPersonsRequest = false
    var invokedDidFinishPersonsRequestCount = 0
    var invokedDidFinishPersonsRequestParameters: (persons: [Person], Void)?
    var invokedDidFinishPersonsRequestParametersList = [(persons: [Person], Void)]()
    func didFinishPersonsRequest(persons: [Person]) {
        invokedDidFinishPersonsRequest = true
        invokedDidFinishPersonsRequestCount += 1
        invokedDidFinishPersonsRequestParameters = (persons, ())
        invokedDidFinishPersonsRequestParametersList.append((persons, ()))
    }
    var invokedWantsToFavourite = false
    var invokedWantsToFavouriteCount = 0
    var invokedWantsToFavouriteParameters: (personName: String, Void)?
    var invokedWantsToFavouriteParametersList = [(personName: String, Void)]()
    func wantsToFavourite(personName: String) {
        invokedWantsToFavourite = true
        invokedWantsToFavouriteCount += 1
        invokedWantsToFavouriteParameters = (personName, ())
        invokedWantsToFavouriteParametersList.append((personName, ()))
    }
    var invokedWantsToUnfavourtite = false
    var invokedWantsToUnfavourtiteCount = 0
    var invokedWantsToUnfavourtiteParameters: (personName: String, Void)?
    var invokedWantsToUnfavourtiteParametersList = [(personName: String, Void)]()
    func wantsToUnfavourtite(personName: String) {
        invokedWantsToUnfavourtite = true
        invokedWantsToUnfavourtiteCount += 1
        invokedWantsToUnfavourtiteParameters = (personName, ())
        invokedWantsToUnfavourtiteParametersList.append((personName, ()))
    }
}
