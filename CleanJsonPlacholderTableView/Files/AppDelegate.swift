//
//  AppDelegate.swift
//  CleanJsonPlacholderTableView
//
//  Created by aykut ipek on 2.05.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.rootViewController = JSONPlaceHolderViewController()
        window?.makeKeyAndVisible()
        return true
    }
}

