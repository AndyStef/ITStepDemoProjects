//
//  AppDelegate.swift
//  NavigationExample
//
//  Created by Andy Stef on 14.03.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        UITabBar.appearance().unselectedItemTintColor = UIColor.white
        return true
    }
}

