//
//  PersonService.swift
//  MariusKurgonasAssignment
//
//  Created by Marius Kurgonas on 05/06/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

typealias PersonsResult = (_ pagingPersons: PagingPersons?, _ error: Error?) -> Void

protocol PersonService: AnyObject {
    func getPersonsAt(pageIndex: UInt, completion: @escaping PersonsResult)

    func cancel()
}
