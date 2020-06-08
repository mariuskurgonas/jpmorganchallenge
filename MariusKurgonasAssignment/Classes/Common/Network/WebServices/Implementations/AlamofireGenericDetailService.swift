//
//  AlamofireGenericDetailService.swift
//  MariusKurgonasAssignment
//
//  Created by Marius Kurgonas on 06/06/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper
import Foundation

class AlamofireGenericDetailService: GenericDetailService {
    func getDetails(urlString: String, completion: @escaping GenericResult) {
        guard let url = URL(string: urlString) else {
            return
        }
        request = Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil)
            .responseJSON(completionHandler: { response in

                DispatchQueue.main.async {
                    completion(response.value as? NSDictionary, response.error)
                }

            })
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
