//
//  DetailAssembler.swift
//  MariusKurgonasAssignment
//
//  Created by Marius Kurgonas on 05/06/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Foundation
import Swinject
import UIKit

class DetailAssembler: Assembly {
    func assemble(container: Container) {
        container.register(DetailViewController.self) { r in
            guard let masterController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "detail") as? DetailViewController else {
                assert(false)
                return DetailViewController()
            }
            masterController.presenter = r.resolve(DetailPresenter.self)
            return masterController
        }

        container.register(DetailPresenter.self) { r in
            let p = DetailPresenter()
            p.dataSource = r.resolve(DetailDataSource.self)
            return p
        }.initCompleted { r, p in
            p.view = r.resolve(DetailViewController.self)
        }

        container.register(DetailDataSource.self) { _ in
            DetailDataSource()
        }
    }
}
