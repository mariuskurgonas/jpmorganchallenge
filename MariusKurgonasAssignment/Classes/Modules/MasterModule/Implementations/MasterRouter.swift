//
//  MasterRouter.swift
//  MariusKurgonasAssignment
//
//  Created by Marius Kurgonas on 06/06/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Foundation
import UIKit

class MasterRouter: MasterRouting {
    var splitViewController: UISplitViewController?

    var detailNavigation: UINavigationController?

    func showDetailFor(selectedObject: Person) {
        if let navigation = detailNavigation, let detailView = navigation.viewControllers.first as? DetailViewing {
            splitViewController?.showDetailViewController(navigation, sender: self)
            detailView.presenter?.didSelect(object: selectedObject)
        }
    }
}
