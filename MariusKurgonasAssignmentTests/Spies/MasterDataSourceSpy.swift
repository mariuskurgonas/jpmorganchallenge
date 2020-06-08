//
//  MasterDataSourceSpy.swift
//  MariusKurgonasAssignmentTests
//
//  Created by Marius Kurgonas on 06/06/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Foundation
import UIKit
@testable import MariusKurgonasAssignment

@objcMembers
class MasterDataSourceSpy: MasterDataSource {
    var favouriteCalled = false
    override func didFavourite(personName: String) {
        favouriteCalled = true
    }
    
    var unfavouriteCalled = false
    override func didUnfavourite(personName: String) {
        unfavouriteCalled = true
    }
    
    var numberOfSectionsCalled = false
    var stubbedNumberOfSection = 1
    override func numberOfSections(in tableView: UITableView) -> Int {
        numberOfSectionsCalled = true
        return stubbedNumberOfSection
    }
    
    var numberOfRowsCalled = false
    var stubbedNumberOfRowsInSection = 1
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        numberOfRowsCalled = true
        return stubbedNumberOfRowsInSection
    }
    
    var cellForIndexPathCalled = false
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cellForIndexPathCalled = true
        return UITableViewCell()
    }
}
