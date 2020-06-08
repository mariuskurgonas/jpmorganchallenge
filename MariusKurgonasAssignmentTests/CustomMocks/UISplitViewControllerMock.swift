//
//  UISplitViewControllerMock.swift
//  MariusKurgonasAssignmentTests
//
//  Created by Marius Kurgonas on 06/06/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Foundation
import UIKit

class UISplitViewControllerMock: UISplitViewController {
    
    var showDetailCalled = false
    var invokedShowDetailsResult: UIViewController?
    override func showDetailViewController(_ vc: UIViewController, sender: Any?) {
        showDetailCalled = true
        invokedShowDetailsResult = vc
    }
}
