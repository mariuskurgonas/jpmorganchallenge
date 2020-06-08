//
//  MasterRoutingSpy.swift
//  MariusKurgonasAssignmentTests
//
//  Created by Marius Kurgonas on 06/06/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Foundation
import UIKit
@testable import MariusKurgonasAssignment

class MasterRoutingSpy: MasterRouting {
    var invokedSplitViewControllerSetter = false
    var invokedSplitViewControllerSetterCount = 0
    var invokedSplitViewController: UISplitViewController?
    var invokedSplitViewControllerList = [UISplitViewController?]()
    var invokedSplitViewControllerGetter = false
    var invokedSplitViewControllerGetterCount = 0
    var stubbedSplitViewController: UISplitViewController!
    var splitViewController: UISplitViewController? {
        set {
            invokedSplitViewControllerSetter = true
            invokedSplitViewControllerSetterCount += 1
            invokedSplitViewController = newValue
            invokedSplitViewControllerList.append(newValue)
        }
        get {
            invokedSplitViewControllerGetter = true
            invokedSplitViewControllerGetterCount += 1
            return stubbedSplitViewController
        }
    }
    var invokedDetailNavigationSetter = false
    var invokedDetailNavigationSetterCount = 0
    var invokedDetailNavigation: UINavigationController?
    var invokedDetailNavigationList = [UINavigationController?]()
    var invokedDetailNavigationGetter = false
    var invokedDetailNavigationGetterCount = 0
    var stubbedDetailNavigation: UINavigationController!
    var detailNavigation: UINavigationController? {
        set {
            invokedDetailNavigationSetter = true
            invokedDetailNavigationSetterCount += 1
            invokedDetailNavigation = newValue
            invokedDetailNavigationList.append(newValue)
        }
        get {
            invokedDetailNavigationGetter = true
            invokedDetailNavigationGetterCount += 1
            return stubbedDetailNavigation
        }
    }
    var invokedShowDetailFor = false
    var invokedShowDetailForCount = 0
    var invokedShowDetailForParameters: (selectedObject: Person, Void)?
    var invokedShowDetailForParametersList = [(selectedObject: Person, Void)]()
    func showDetailFor(selectedObject: Person) {
        invokedShowDetailFor = true
        invokedShowDetailForCount += 1
        invokedShowDetailForParameters = (selectedObject, ())
        invokedShowDetailForParametersList.append((selectedObject, ()))
    }
}
