//
//  AppDelegate.swift
//  campsns
//
//  Created by 김가람 on 2020/07/01.
//  Copyright © 2020 김가람. All rights reserved.
//

import UIKit
import KakaoOpenSDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
    
    // MARK:- KakaoOpenSDK
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        // 앱의 커스텀 URL 스키마를 통해 수신된 링크를 처리
        if (KOSession.isKakaoAgeAuthCallback(url)) {
            return KOSession.handleOpen(url)
        }
        
        return false
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        if (KOSession.isKakaoAgeAuthCallback(url)) {
            return KOSession.handleOpen(url)
        }
        
        return false
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        KOSession.handleDidBecomeActive()
    }

}

