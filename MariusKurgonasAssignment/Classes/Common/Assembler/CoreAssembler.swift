//
//  CoreAssembler.swift
//  MariusKurgonasAssignment
//
//  Created by Marius Kurgonas on 05/06/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Foundation
import Swinject

class CoreAssembler: Assembly {
    func assemble(container: Container) {
        container.register(AlamofirePersonService.self) { r in
            let context = r.resolve(ApiContext.self)!
            return AlamofirePersonService(context: context)
        }

        container.register(ApiContext.self) { r in
            let environment = r.resolve(ApiEnvironment.self)!
            return ApiContext(environment: environment)
        }

        container.register(ApiEnvironment.self) { _ in
            ApiEnvironment.production
        }

        container.register(UserDefaults.self) { _ in
            UserDefaults.standard
        }
    }
}
