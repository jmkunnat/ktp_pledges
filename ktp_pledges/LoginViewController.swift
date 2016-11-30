//
//  LoginViewController.swift
//  ktp_pledges
//
//  Created by Joe Kunnath on 11/28/16.
//  Copyright © 2016 Joe Kunnath. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class LoginViewController: UITableViewController, GIDSignInDelegate, GIDSignInUIDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBAction func signUp(_ sender: Any) {
        
        FIRAuth.auth()?.createUser(withEmail: emailTextField, password: passwordTextField) { (user, error) in
            
            if error != nil {
                print("logged in")

            }
        
    }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signIn()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
