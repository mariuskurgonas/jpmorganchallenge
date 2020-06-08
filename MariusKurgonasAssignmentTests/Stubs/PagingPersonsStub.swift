//
//  PagingPersonsStub.swift
//  MariusKurgonasAssignmentTests
//
//  Created by Marius Kurgonas on 06/06/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Foundation
@testable import MariusKurgonasAssignment

class PagingPersonsStub: PagingPersons {
    var invokedPersonsSetter = false
    var invokedPersonsSetterCount = 0
    var invokedPersons: [ApiPerson]?
    var invokedPersonsList = [[ApiPerson]]()
    var invokedPersonsGetter = false
    var invokedPersonsGetterCount = 0
    var stubbedPersons: [ApiPerson]! = []
    var persons: [ApiPerson] {
        set {
            invokedPersonsSetter = true
            invokedPersonsSetterCount += 1
            invokedPersons = newValue
            invokedPersonsList.append(newValue)
        }
        get {
            invokedPersonsGetter = true
            invokedPersonsGetterCount += 1
            return stubbedPersons
        }
    }
    var invokedHasNextPageSetter = false
    var invokedHasNextPageSetterCount = 0
    var invokedHasNextPage: String?
    var invokedHasNextPageList = [String?]()
    var invokedHasNextPageGetter = false
    var invokedHasNextPageGetterCount = 0
    var stubbedHasNextPage: String!
    var hasNextPage: String? {
        set {
            invokedHasNextPageSetter = true
            invokedHasNextPageSetterCount += 1
            invokedHasNextPage = newValue
            invokedHasNextPageList.append(newValue)
        }
        get {
            invokedHasNextPageGetter = true
            invokedHasNextPageGetterCount += 1
            return stubbedHasNextPage
        }
    }
}
