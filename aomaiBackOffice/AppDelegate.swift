//
//  AppDelegate.swift
//  aomaiBackOffice
//
//  Created by li qiang on 8/6/2559 BE.
//  Copyright © 2559 aomai. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var rootView = Menu()

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        //no storyboard
        FIRApp.configure()
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = rootView
        return true
    }
}

