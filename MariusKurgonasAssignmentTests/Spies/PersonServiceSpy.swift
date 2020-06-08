//
//  PersonServiceSpy.swift
//  MariusKurgonasAssignmentTests
//
//  Created by Marius Kurgonas on 06/06/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Foundation
@testable import MariusKurgonasAssignment

class PersonServiceSpy: PersonService {
    var invokedGetPersonsAt = false
    var invokedGetPersonsAtCount = 0
    var invokedGetPersonsAtParameters: (pageIndex: UInt, Void)?
    var invokedGetPersonsAtParametersList = [(pageIndex: UInt, Void)]()
    var stubbedGetPersonsAtCompletionResult: (PagingPersons?, Error?)?
    func getPersonsAt(pageIndex: UInt, completion: @escaping PersonsResult) {
        invokedGetPersonsAt = true
        invokedGetPersonsAtCount += 1
        invokedGetPersonsAtParameters = (pageIndex, ())
        invokedGetPersonsAtParametersList.append((pageIndex, ()))
        if let result = stubbedGetPersonsAtCompletionResult {
            completion(result.0, result.1)
        }
    }
    var invokedCancel = false
    var invokedCancelCount = 0
    func cancel() {
        invokedCancel = true
        invokedCancelCount += 1
    }
}
