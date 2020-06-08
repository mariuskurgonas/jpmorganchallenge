//
//  APIRoute.swift
//  MariusKurgonasAssignment
//
//  Created by Marius Kurgonas on 05/06/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Foundation

protocol ApiRoute {
    var path: String { get }

    func url(for environment: Environment) -> String
}
