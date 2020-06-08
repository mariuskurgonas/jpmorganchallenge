//
//  MasterAssembly.swift
//  MariusKurgonasAssignment
//
//  Created by Marius Kurgonas on 05/06/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Foundation
import Swinject
import UIKit

class MasterAssembler: Assembly {
    func assemble(container: Container) {
        container.register(MasterViewController.self) { (r, split: UISplitViewController) in
            let masterController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "master") as! MasterViewController
            let p = r.resolve(MasterPresenter.self, argument: split)
            masterController.presenter = p
            p?.view = masterController
            return masterController
        }

        container.register(MasterPresenter.self) { (r, split: UISplitViewController) in
            let p = MasterPresenter()
            p.router = r.resolve(MasterRouter.self, argument: split)
            let dataSource = r.resolve(MasterDataSource.self)
            p.dataSource = dataSource
            dataSource?.presenter = p
            p.interactor = r.resolve(MasterInteractor.self)
            p.interactor?.presenter = p
            return p
        }

        container.register(MasterInteractor.self) { r in
            let i = MasterInteractor()
            i.personService = r.resolve(AlamofirePersonService.self)
            i.favouriteProviding = r.resolve(UserDefaults.self)
            return i
        }

        container.register(MasterRouter.self) { (_, split: UISplitViewController) in
            let router = MasterRouter()
            router.splitViewController = split
            return router
        }

        container.register(MasterDataSource.self) { _ in
            MasterDataSource()
        }
    }
}
