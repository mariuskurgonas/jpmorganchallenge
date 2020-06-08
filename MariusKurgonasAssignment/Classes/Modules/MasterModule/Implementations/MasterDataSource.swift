//
//  MasterDataSource.swift
//  MariusKurgonasAssignment
//
//  Created by Marius Kurgonas on 06/06/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Foundation
import UIKit

class MasterDataSource: NSObject, UITableViewDataSource, MasterTableViewCellDelegate {
    weak var presenter: MasterPresenting?

    var objects = [Person]()

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MasterTableViewCell.reuseIdentifier(), for: indexPath) as! MasterTableViewCell

        let object = objects[indexPath.row]
        cell.configWith(person: object)
        cell.person = object
        cell.delegate = self
        return cell
    }

    // MARK: MasterTableViewCellDelegate

    func didFavourite(personName: String) {
        presenter?.wantsToFavourite(personName: personName)
    }

    func didUnfavourite(personName: String) {
        presenter?.wantsToUnfavourtite(personName: personName)
    }
}
