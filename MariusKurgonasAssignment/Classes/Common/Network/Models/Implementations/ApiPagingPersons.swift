//
//  ApiPagingPersons.swift
//  MariusKurgonasAssignment
//
//  Created by Marius Kurgonas on 06/06/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Foundation
import ObjectMapper

class ApiPagingPersons: PagingPersons, Mappable {
    var persons: [ApiPerson] = []

    var hasNextPage: String?

    required init?(map: Map) {}

    func mapping(map: Map) {
        hasNextPage <- map["next"]
        persons <- map["results"]
    }
}
