//
//  DetailDataSource.swift
//  MariusKurgonasAssignment
//
//  Created by Marius Kurgonas on 06/06/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Foundation
import UIKit

class DetailDataSource: NSObject, UITableViewDataSource {
    var sectionNames = [String]()

    var objectsForSection = [String: [String]]()

    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionNames.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard sectionNames.count > section, let items = objectsForSection[sectionNames[section]] else {
            return 0
        }
        return items.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionNames[section]
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.reuseIdentifier(), for: indexPath) as! DetailTableViewCell
        let sectionName = sectionNames[indexPath.section]
        guard let objects = objectsForSection[sectionName] else {
            return cell
        }

        let object = objects[indexPath.row]
        cell.configureCell(keyPath: keyPathFor(sectionName: sectionName), urlString: object)
        return cell
    }

    func keyPathFor(sectionName: String) -> String {
        if sectionName.lowercased() == "films" {
            return "title"
        }

        return "name"
    }
}
