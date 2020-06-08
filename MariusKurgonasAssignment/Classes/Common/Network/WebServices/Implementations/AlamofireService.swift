//
//  AlamofireService.swift
//  MariusKurgonasAssignment
//
//  Created by Marius Kurgonas on 05/06/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Alamofire
import Foundation

class AlamofireService {
    init(context: ApiContext) {
        self.context = context
    }

    var context: ApiContext

    func get(at route: ApiRoute) -> DataRequest {
        let url = route.url(for: context.environment)
        return Alamofire.request(url,
                                 method: .get,
                                 parameters: nil,
                                 encoding: URLEncoding.default)
    }
}
