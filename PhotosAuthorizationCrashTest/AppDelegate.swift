//
//  AppDelegate.swift
//  PhotosAuthorizationCrashTest
//
//  Created by Eddpt on 28/07/2016.
//  Copyright © 2016 Test. All rights reserved.
//

import UIKit
import Photos

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        requestAuthorizationIfNeeded()

        return true
    }

    private func requestAuthorizationIfNeeded() {
        DispatchQueue.main.async {
            let status = PHPhotoLibrary.authorizationStatus()
            if status == .authorized {
                return
            }

            PHPhotoLibrary.requestAuthorization({ (status) in
                if status == .authorized {
                    return
                }

                NSLog("Could not get authorization to access photos")
            })
        }
    }
}

