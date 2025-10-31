//
//  AppDelegate.swift
//  TestingTask
//
//  Created by DBykov on 19.07.2022.
//

import UIKit
import Core
import Auth
import Home
import Profile
import FirebaseCore
import FirebaseMessaging

@main
class AppDelegate: UIResponder, UIApplicationDelegate, MessagingDelegate {


    var window:UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        // INIT Firebase
        FirebaseApp.configure()

        // Setup Firebase Messaging
        Messaging.messaging().delegate = self

        //INIT DI
        Configurator.shared.setup()

        //INIT UI
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: SplashScreenRouter().createModule()!)
        window?.makeKeyAndVisible()
        return true
    }

    // MARK: - MessagingDelegate
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        print("Firebase registration token: \(String(describing: fcmToken))")

        let dataDict: [String: String] = ["token": fcmToken ?? ""]
        NotificationCenter.default.post(
            name: Notification.Name("FCMToken"),
            object: nil,
            userInfo: dataDict
        )
    }

}

