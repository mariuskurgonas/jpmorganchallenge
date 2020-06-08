//
//  DetailViewController.swift
//  MariusKurgonasAssignment
//
//  Created by Marius Kurgonas on 05/06/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, DetailViewing {
    var presenter: DetailPresenting?

    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(DetailTableViewCell.nib(), forCellReuseIdentifier: DetailTableViewCell.reuseIdentifier())
        tableView.dataSource = presenter?.dataSource

        presenter?.viewDidLoad()
    }

    func reload() {
        if isViewLoaded {
            tableView.reloadData()
        }
    }
}
