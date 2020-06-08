//
//  AlamofirePersonService.swift
//  MariusKurgonasAssignment
//
//  Created by Marius Kurgonas on 05/06/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper
import Foundation

class AlamofirePersonService: AlamofireService, PersonService {
    func getPersonsAt(pageIndex: UInt, completion: @escaping PersonsResult) {
        request = get(at: ApiPeopleRoute.people(pageIndex: pageIndex))
            .responseObject(queue: .global(), keyPath: nil, context: nil) { [weak self] (response: DataResponse<ApiPagingPersons>) in

                self?.request = nil

                DispatchQueue.main.async {
                    completion(response.value, response.error)
                }
            }
    }

    var request: Request? {
        willSet {
            cancel()
        }
    }

    func isRequesting() -> Bool {
        return request != nil
    }

    func cancel() {
        request?.cancel()
    }
}
