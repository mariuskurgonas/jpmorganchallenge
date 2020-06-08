//
//  AppDelegate.swift
//  MariusKurgonasAssignment
//
//  Created by Marius Kurgonas on 05/06/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Swinject
import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {
    var window: UIWindow?

    var assembler: Assembler?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        assembler = avengersAssemble()

        window = UIWindow(frame: UIScreen.main.bounds)

        guard let assembler = assembler else {
            assert(false)
            return false
        }

        let splitViewController = UISplitViewController()
        splitViewController.preferredDisplayMode = .allVisible

        let mc = assembler.resolver.resolve(MasterViewController.self, argument: splitViewController)
        let dc = assembler.resolver.resolve(DetailViewController.self)
        guard let detailController = dc else {
            assert(false)
            return false
        }
        guard let masterController = mc else {
            assert(false)
            return false
        }

        let masterNavigation = UINavigationController(rootViewController: masterController)
        let detailNavigation = UINavigationController(rootViewController: detailController)
        mc?.presenter?.router?.detailNavigation = detailNavigation
        splitViewController.viewControllers = [masterNavigation, detailNavigation]
        splitViewController.delegate = self

        window?.rootViewController = splitViewController
        window?.makeKeyAndVisible()

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {}

    func applicationDidEnterBackground(_ application: UIApplication) {}

    func applicationWillEnterForeground(_ application: UIApplication) {}

    func applicationDidBecomeActive(_ application: UIApplication) {}

    func applicationWillTerminate(_ application: UIApplication) {}

    // MARK: - Split view

    func splitViewController(_ splitViewController: UISplitViewController,
                             collapseSecondary secondaryViewController: UIViewController,
                             onto primaryViewController: UIViewController) -> Bool {
        guard let secondaryAsNavController = secondaryViewController as? UINavigationController else {
            return false
        }
        guard let topAsDetailController = secondaryAsNavController.topViewController
            as? DetailViewController else { return false }
        if topAsDetailController.presenter?.dataSource?.sectionNames.isEmpty == Optional(true) {
            return true
        }
        return false
    }

    func avengersAssemble() -> Assembler {
        return Assembler([
            CoreAssembler(),
            MasterAssembler(),
            DetailAssembler()
        ])
    }
}
