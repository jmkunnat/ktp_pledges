//
//  SecondViewController.swift
//  ktp_pledges
//
//  Created by Joe Kunnath on 11/6/16.
//  Copyright © 2016 Joe Kunnath. All rights reserved.
//

import UIKit

import Firebase
import GoogleSignIn
class SecondViewController: UIViewController {


    @IBAction func signOut(_ sender: Any) {
        GIDSignIn.sharedInstance().signOut()
        do {
            try FIRAuth.auth()?.signOut()
            print("successfully signed out")
        }catch{
            print ("error signing out")
        }
     
    
        self.performSegue(withIdentifier: "returnToLogin", sender: nil)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        checkIfUserIsLoggedIn()
    }
    func checkIfUserIsLoggedIn() {
        if FIRAuth.auth()?.currentUser?.uid == nil {
            perform(#selector(handleLogout), with: nil, afterDelay: 0)
        } else {
            let uid = FIRAuth.auth()?.currentUser?.uid
            FIRDatabase.database().reference().child("users").child(uid!).observeSingleEventOfType(.Value, withBlock: { (snapshot) in
                
                if let dictionary = snapshot.value as? [String: AnyObject] {
                    self.navigationItem.title = dictionary["name"] as? String
                }
                
            }, withCancelBlock: nil)
        }
    }
    func handleLogout() {
        
        do {
            try FIRAuth.auth()?.signOut()
        } catch let logoutError {
            print(logoutError)
        }
        GIDSignIn.sharedInstance().signOut()
        do {
            try FIRAuth.auth()?.signOut()
            print("successfully signed out")
        }catch{
            print ("error signing out")
        }
        
        
        self.performSegue(withIdentifier: "returnToLogin", sender: nil)
       
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

