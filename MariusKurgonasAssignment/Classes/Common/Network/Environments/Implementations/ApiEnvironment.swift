//
//  ApiEnvironment.swift
//  MariusKurgonasAssignment
//
//  Created by Marius Kurgonas on 05/06/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Foundation

enum ApiEnvironment: Environment { case

    production

    var url: String {
        switch self {
        case .production:
            return "https://swapi.co/api"
        }
    }
}
