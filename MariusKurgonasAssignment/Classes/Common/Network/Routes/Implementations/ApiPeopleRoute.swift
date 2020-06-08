//
//  ApiPeopleRoute.swift
//  MariusKurgonasAssignment
//
//  Created by Marius Kurgonas on 05/06/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Foundation

enum ApiPeopleRoute: ApiRoute { case

    people(pageIndex: UInt)

    var path: String {
        switch self {
        case .people(let pageIndex):
            return "people/?page=\(pageIndex)"
        }
    }

    func url(for environment: Environment) -> String {
        return "\(environment.url)/\(path)"
    }
}
