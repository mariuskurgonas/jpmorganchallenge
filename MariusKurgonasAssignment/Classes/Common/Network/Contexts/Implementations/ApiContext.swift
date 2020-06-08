//
//  NonPersistentApiContext.swift
//  MariusKurgonasAssignment
//
//  Created by Marius Kurgonas on 05/06/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Foundation

class ApiContext: Context {
    init(environment: Environment) {
        self.environment = environment
    }

    var environment: Environment
}
