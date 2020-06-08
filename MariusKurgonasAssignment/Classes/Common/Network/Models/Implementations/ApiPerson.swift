//
//  ApiPerson.swift
//  MariusKurgonasAssignment
//
//  Created by Marius Kurgonas on 05/06/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Foundation
import ObjectMapper

class ApiPerson: Person, Mappable {
    var homeWorld: String = ""

    var films: [String] = []

    var species: [String] = []

    var vehicles: [String] = []

    var starships: [String] = []

    var isFavourite: Bool = false

    var name: String = ""

    var height: String = ""

    var dob: String = ""

    public required init?(map: Map) {}

    func mapping(map: Map) {
        name <- map["name"]
        height <- map["height"]
        dob <- map["birth_year"]
        homeWorld <- map["homeworld"]
        films <- map["films"]
        vehicles <- map["vehicles"]
        starships <- map["starships"]
        species <- map["species"]
    }
}
