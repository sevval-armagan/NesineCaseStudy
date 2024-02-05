//
//  AppDelegate.swift
//  NesineCaseStudy
//
//  Created by Şevval Armağan on 6.02.2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.makeKeyAndVisible()
        
        window?.rootViewController = ViewController()
        
        return true
    }
}
