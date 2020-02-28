//
//  MainViewController.swift
//  ExemploFCM
//
//  Created by Lucas Vegi on 27/02/20.
//  Copyright © 2020 Lucas Vegi. All rights reserved.
//

import UIKit
import Firebase

class MainViewController: UIViewController {
    
    @IBOutlet var msg:UILabel!
    @IBOutlet var token:UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(self.displayFCMToken(notification:)),
        name: Notification.Name("FCMToken"), object: nil)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func verToken(){
        // [START log_fcm_reg_token]
        let token = Messaging.messaging().fcmToken
        // [END log_fcm_reg_token]
        self.token.text  = "Logged FCM token: \(token ?? "")"
        print("Logged FCM token: \(token ?? "")")

        // [START log_iid_reg_token]
        InstanceID.instanceID().instanceID { (result, error) in
          if let error = error {
            print("Error fetching remote instance ID: \(error)")
          } else if let result = result {
            self.msg.text  = "Remote InstanceID token: \(result.token)"
            print("Remote InstanceID token: \(result.token)")
          }
        }
        // [END log_iid_reg_token]
    }
    
    @objc func displayFCMToken(notification: NSNotification){
      guard let userInfo = notification.userInfo else {return}
      if let fcmToken = userInfo["token"] as? String {
        self.token.text = "Received FCM token: \(fcmToken)"
        print("Received FCM token: \(fcmToken)")
      }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
