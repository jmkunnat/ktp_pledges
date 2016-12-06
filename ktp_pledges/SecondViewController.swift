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
        print("successfully signed out")
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

