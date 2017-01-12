 //
 //  AppDelegate.swift
 //  AutoUnionAplicacion
 //
 //  Created by Isai Garcia Moso on 14/11/16.
 //  Copyright © 2016 developerMosso. All rights reserved.
 //
 import UIKit
 //bibliotecas de facebook
 import FBSDKCoreKit
 import FBSDKLoginKit
 import FBSDKShareKit
 
 @UIApplicationMain
 class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let theme = UIColor(red: 0.01, green: 0.41, blue: 0.22, alpha: 1.0)
    let theme2 =  UIColor(red: 70/255, green: 129/255, blue: 207/255, alpha: 1)
    let themeColorGray =  UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)

    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        //Color del texto del background
        /*UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]*/
        /* UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor(red: 102/255, green: 65/255, blue: 88/255, alpha: 1.0)]*/
        // Title's text color
        //UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().tintColor = UIColor.black
        //UINavigationBar.appearance().barTintColor =  UIColor(red: 235/255, green: 17/255, blue: 95/255, alpha: 1)
        UINavigationBar.appearance().barTintColor =  themeColorGray /*UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)*/
        UINavigationBar.appearance().isTranslucent = true
        
        //UIColor(red: 44/255, green: 25/255, blue: 53/255, alpha: 1.0)
        /**Textos blanco en los encabezados*/
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName:UIColor.black]
        /**Barra de navegacion*/
        ///UITabBar.appearance().isOpaque = true
        UITabBar.appearance().tintColor =   UIColor.black
        return true
        
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    /** ------------------------
     agregadas recientemente 6 de Dic 2016
     ------------------------
     **/
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        
        return FBSDKApplicationDelegate.sharedInstance().application(application, open: url as URL!, sourceApplication: sourceApplication, annotation: annotation)
    }
    
    private func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        
        //UIApplication.shared.statusBarStyle = .lightContent
        return true
    }
    
    
 }
 
