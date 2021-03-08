//
//  AppDelegate.swift
//  IsuruDhanisha_COBSCComp192P-037
//
//  Created by Isuru Dhanisha  on 2021-02-27.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    // MARK: UISceneSession Lifecycle

    let window = UIWindow()
    let locationService = LocationService()
    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:[UIApplication.LaunchOptionsKey:Any]?) -> Bool {
        
        FirebaseApp.configure()
        
//        let authviewController = storyBoard.instantiateViewController(identifier: "Auth_View") as AuthViewController
//
//        let locationController = storyBoard.instantiateViewController(identifier: "Location_View") as LocationViewController
//
//        let mainViewController =  storyBoard.instantiateViewController(withIdentifier: "Navigate_Home") as? UINavigationController
//
//        if Auth.auth().currentUser != nil{
//            switch locationService.status {
//            case .notDetermined, .denied, .restricted:
//                locationController.locationService = locationService
//                window.rootViewController = locationController
//            default:
//                window.rootViewController = mainViewController
//            }
//        }else {
//            window.rootViewController = authviewController
//        }
//
//        window.makeKeyAndVisible()
//
        return true
    }
}

