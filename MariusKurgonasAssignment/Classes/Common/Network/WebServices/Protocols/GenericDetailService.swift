//
//  GenericDetailService.swift
//  MariusKurgonasAssignment
//
//  Created by Marius Kurgonas on 06/06/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Foundation

typealias GenericResult = (_ json: NSDictionary?, _ error: Error?) -> Void

protocol GenericDetailService: AnyObject {
    func getDetails(urlString: String, completion: @escaping GenericResult)

    func cancel()
}
