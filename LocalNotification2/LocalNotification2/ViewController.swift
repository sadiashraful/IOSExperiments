//
//  ViewController.swift
//  LocalNotification2
//
//  Created by Mohammad Ashraful Islam Sadi on 14/1/20.
//  Copyright © 2020 Wheels-Corporation. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController, UNUserNotificationCenterDelegate {
    
    let userNotificaitonCenter = UNUserNotificationCenter.current()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.userNotificaitonCenter.delegate = self
        self.requestNotificationAuthorization()
        self.sendNotification()
    }
    
    func requestNotificationAuthorization(){
        let authorizationOptions = UNAuthorizationOptions.init(arrayLiteral: .alert, .badge, .sound)
        self.userNotificaitonCenter.requestAuthorization(options: authorizationOptions) { (success, error) in
            if let error = error {
                print("Error: ", error)
            }
        }
    }
    
    func sendNotification(){
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = "Test"
        notificationContent.body = "Test body"
        notificationContent.badge = NSNumber(value: 3)
        
        if let url = Bundle.main.url(forResource: "dune", withExtension: "png"){
            if let attachment = try? UNNotificationAttachment(identifier: "dune", url: url, options: nil){
                notificationContent.attachments = [attachment]
            }
        }
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "testNotification", content: notificationContent, trigger: trigger)
        userNotificaitonCenter.add(request) { (error) in
            if let error = error {
                print("Notification Error: ", error)
            }
        }
    }

   func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
       completionHandler()
   }

   func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
       completionHandler([.alert, .badge, .sound])
   }
}

