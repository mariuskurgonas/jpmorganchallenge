//
//  PagingPersons.swift
//  MariusKurgonasAssignment
//
//  Created by Marius Kurgonas on 06/06/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Foundation

protocol PagingPersons {
    var persons: [ApiPerson] { get set }
    var hasNextPage: String? { get set }
}
