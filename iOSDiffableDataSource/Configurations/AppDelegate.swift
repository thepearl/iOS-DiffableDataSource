//
//  AppDelegate.swift
//  iOSDiffableDataSource
//
//  Created by Ghazi Tozri on 9/1/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    {
        takeMeHome()
        return true
    }
    
    func takeMeHome()
    {
        window?.overrideUserInterfaceStyle = .light
        
        let mainViewController = MainView.instantiateFromStoryboard(MAIN_STORYBOARD)
        let navigationController = UINavigationController(rootViewController: mainViewController)
        navigationController.isNavigationBarHidden = true
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

