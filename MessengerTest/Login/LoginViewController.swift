//
//  LoginViewController.swift
//  MessengerTest
//
//  Created by Ryan Aubrey on 4/30/18.
//  Copyright © 2018 Ryan Aubrey. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    var isLoggingIn: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        self.showFullScreenLoadingIndicator()
        if isLoggingIn == false {
            self.isLoggingIn = true
            Auth.auth().signInAnonymously(completion: { (user, error) in // 2
                self.isLoggingIn = false
                self.hideFullScreenLoadingIndicator()
                if let err = error { // 3
                    print(err.localizedDescription)
                    return
                }
                guard let user = user else { return }
                CredentialManager.uid = user.uid
                
                self.performSegue(withIdentifier: "LoginToChat", sender: nil) // 4
            })
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
