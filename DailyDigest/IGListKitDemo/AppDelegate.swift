// 
// AppDelegate.swift
// Created on 2021/8/18
// Description <#⽂件描述#> 
// Copyright © 2021 Huami inc. All rights reserved. 
// @author 蔡龙君(cailongjun@huami.com)  

import UIKit
import SwiftUI

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let insets1: UIEdgeInsets = .leading(10)
        let insets2: UIEdgeInsets = .trailing(10)
        let insets3: UIEdgeInsets = .top(10)
        let insets4: UIEdgeInsets = .bottom(10)
        let insets5: UIEdgeInsets = .horizontal(10, 20)
        let insets6: UIEdgeInsets = .vertical(10, 20)
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
        
        
    }


}


// MARK: - Methods
public extension UIEdgeInsets {

    init(top: CGFloat = 0, leading: CGFloat = 0, bottom: CGFloat = 0, trailing: CGFloat = 0) {
        if UIApplication.shared.userInterfaceLayoutDirection == .rightToLeft {
            self.init(top: top, left: trailing, bottom: bottom, right: leading)
        } else {
            self.init(top: top, left: leading, bottom: bottom, right: trailing)
        }
    }
    
    static func top(_ top: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: top)
    }
    
    static func bottom(_ bottom: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(bottom: bottom)
    }
    
    static func leading(_ leading: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(leading: leading)
    }
    
    static func trailing(_ trailing: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(trailing: trailing)
    }
    
    static func vertical(_ top: CGFloat, _ bottom: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: top, bottom: bottom)
    }
    
    static func horizontal(_ leading: CGFloat, _ trailing: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(leading: leading, trailing: trailing)
    }
}
