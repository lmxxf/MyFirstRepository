//
//  AppDelegate.swift
//  MigrateAwesomeMenu
//
//  Created by Seth Jin on 15/7/14.
//  Copyright (c) 2015年 Gintong. All rights reserved.
//

import UIKit

@UIApplicationMain
//class AppDelegate: UIResponder, UIApplicationDelegate {
//
//    var window: UIWindow?
//
//
//    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
//        // Override point for customization after application launch.
//        return true
//    }
//
//    func applicationWillResignActive(application: UIApplication) {
//        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
//        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
//    }
//
//    func applicationDidEnterBackground(application: UIApplication) {
//        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
//        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
//    }
//
//    func applicationWillEnterForeground(application: UIApplication) {
//        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
//    }
//
//    func applicationDidBecomeActive(application: UIApplication) {
//        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
//    }
//
//    func applicationWillTerminate(application: UIApplication) {
//        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
//    }
//
//
//}
//


class AppDelegate: UIResponder, UIApplicationDelegate, AwesomeMenuDelegate {
    
    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        if let window = self.window {
            window.backgroundColor = UIColor.whiteColor()
            var storyMenuItemImage = UIImage(named: "bg-menuitem.png")
            var storyMenuItemImagePressed = UIImage(named: "bg-menuitem-highlighted.png")
            var starImage = UIImage(named: "icon-star.png")
            var starMenuItem1: AwesomeMenuItem = AwesomeMenuItem(image: storyMenuItemImage, highlightedImage: storyMenuItemImagePressed, contentImage: starImage, highlightedContentImage: nil)
            var starMenuItem2: AwesomeMenuItem = AwesomeMenuItem(image: storyMenuItemImage, highlightedImage: storyMenuItemImagePressed, contentImage: starImage, highlightedContentImage: nil)
            var starMenuItem3: AwesomeMenuItem = AwesomeMenuItem(image: storyMenuItemImage, highlightedImage: storyMenuItemImagePressed, contentImage: starImage, highlightedContentImage: nil)
            var starMenuItem4: AwesomeMenuItem = AwesomeMenuItem(image: storyMenuItemImage, highlightedImage: storyMenuItemImagePressed, contentImage: starImage, highlightedContentImage: nil)
            var starMenuItem5: AwesomeMenuItem = AwesomeMenuItem(image: storyMenuItemImage, highlightedImage: storyMenuItemImagePressed, contentImage: starImage, highlightedContentImage: nil)
            var starMenuItem6: AwesomeMenuItem = AwesomeMenuItem(image: storyMenuItemImage, highlightedImage: storyMenuItemImagePressed, contentImage: starImage, highlightedContentImage: nil)
            var starMenuItem7: AwesomeMenuItem = AwesomeMenuItem(image: storyMenuItemImage, highlightedImage: storyMenuItemImagePressed, contentImage: starImage, highlightedContentImage: nil)
            var starMenuItem8: AwesomeMenuItem = AwesomeMenuItem(image: storyMenuItemImage, highlightedImage: storyMenuItemImagePressed, contentImage: starImage, highlightedContentImage: nil)
            var starMenuItem9: AwesomeMenuItem = AwesomeMenuItem(image: storyMenuItemImage, highlightedImage: storyMenuItemImagePressed, contentImage: starImage, highlightedContentImage: nil)
            var menuItems = NSArray(arrayLiteral: starMenuItem1, starMenuItem2, starMenuItem3, starMenuItem4, starMenuItem5, starMenuItem6, starMenuItem7, starMenuItem8, starMenuItem9)
            var startItem: AwesomeMenuItem = AwesomeMenuItem(image: UIImage(named: "bg-addbutton.png"), highlightedImage: UIImage(named: "bg-addbutton-highlighted.png"), contentImage: UIImage(named: "icon-plus.png"), highlightedContentImage: UIImage(named: "icon-plus-highlighted.png"))
            var menu = AwesomeMenu(frame: window.bounds, startItem: startItem, menuItems: menuItems as [AnyObject])
            menu.delegate = self
            window.addSubview(menu)
            window.makeKeyAndVisible()
            return true
        }
        return false
    }
    
    func awesomeMenu(menu: AwesomeMenu, didSelectIndex idx: Int) {
        NSLog("Select the index : %d", idx)
    }
    
    func awesomeMenuDidFinishAnimationClose(menu: AwesomeMenu) {
        NSLog("Menu was closed!")
    }
    
    func awesomeMenuDidFinishAnimationOpen(menu: AwesomeMenu) {
        NSLog("Menu is open!")
    }
}

