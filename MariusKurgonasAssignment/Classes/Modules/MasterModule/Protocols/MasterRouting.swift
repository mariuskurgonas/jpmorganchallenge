//
//  MasterRouting.swift
//  MariusKurgonasAssignment
//
//  Created by Marius Kurgonas on 06/06/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Foundation
import UIKit

protocol MasterRouting {
    var splitViewController: UISplitViewController? { get set }

    var detailNavigation: UINavigationController? { get set }

    func showDetailFor(selectedObject: Person)
}
