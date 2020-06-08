//
//  Person.swift
//  MariusKurgonasAssignment
//
//  Created by Marius Kurgonas on 05/06/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Foundation

protocol Person {
    var isFavourite: Bool { get set }
    var name: String { get }
    var height: String { get }
    var dob: String { get }
    var homeWorld: String { get }
    var films: [String] { get }
    var species: [String] { get }
    var vehicles: [String] { get }
    var starships: [String] { get }
}
