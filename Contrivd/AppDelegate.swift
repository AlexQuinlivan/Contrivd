//
//  AppDelegate.swift
//  Contrivd
//
//  Created by Alex Quinlivan on 20/07/15.
//  Copyright (c) 2015 Alex Quinlivan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
        globalStyle()
        let window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window = window
        let navCtrl = UINavigationController(rootViewController: ListViewController())
        window.rootViewController = navCtrl
        window.makeKeyAndVisible()
        return true
    }
    
    func globalStyle() {
        let navAppearance = UINavigationBar.appearance()
        navAppearance.barTintColor = HLMResources.uiColorValue("@color/white")
        navAppearance.tintColor = HLMResources.uiColorValue("@color/accent")
    }
    
}
