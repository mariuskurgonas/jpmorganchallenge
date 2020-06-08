//
//  DetailDataSourceSpy.swift
//  MariusKurgonasAssignmentTests
//
//  Created by Marius Kurgonas on 07/06/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Foundation
import UIKit
@testable import MariusKurgonasAssignment

@objcMembers
class DetailDataSourceSpy: DetailDataSource {
    var calledNumberOfSections = false
    var stubbedSections = 0
    override func numberOfSections(in tableView: UITableView) -> Int {
        calledNumberOfSections = true
        return stubbedSections
    }
    
    var calledNumberOfRows = false
    var stubbedRows = 0
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        calledNumberOfRows = true
        return stubbedRows
    }
    
    var calledTitleForHeaderInSection = false
    var stubbedHeaderTitle = ""
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        calledTitleForHeaderInSection = true
        return stubbedHeaderTitle
    }
    
    var calledCellForIndexPath = false
    var stubbedCell = UITableViewCell()
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        calledCellForIndexPath = true
        return stubbedCell
    }
    
    var calledKeyForSectionName = false
    var stubbedKey = ""
    override func keyPathFor(sectionName: String) -> String {
        calledKeyForSectionName = true
        return stubbedKey
    }
}
