//
//  UITableViewCell+Extensions.swift
//  MariusKurgonasAssignment
//
//  Created by Marius Kurgonas on 06/06/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewCell {
    static func reuseIdentifier() -> String {
        return "\(self)"
    }

    static func nib() -> UINib {
        return UINib(nibName: reuseIdentifier(), bundle: nil)
    }
}
