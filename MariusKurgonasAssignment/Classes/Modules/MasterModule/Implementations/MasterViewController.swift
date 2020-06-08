//
//  MasterViewController.swift
//  MariusKurgonasAssignment
//
//  Created by Marius Kurgonas on 05/06/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController, MasterViewing {
    var presenter: MasterPresenting?

    var objects = [NSDate()]

    func reload() {
        tableView.reloadData()
    }

    // MARK: ViewController

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(MasterTableViewCell.nib(), forCellReuseIdentifier: MasterTableViewCell.reuseIdentifier())

        tableView.dataSource = presenter?.dataSource

        presenter?.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        guard let split = splitViewController else {
            return
        }
        clearsSelectionOnViewWillAppear = split.isCollapsed
    }

    // MARK: UITableViewDelegate

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectRowAt(index: indexPath.row)
    }

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let dataSource = tableView.dataSource {
            if indexPath.row == dataSource.tableView(tableView, numberOfRowsInSection: 0) - 1 {
                presenter?.didReachEndOfTableView()
            }
        }
    }
}
