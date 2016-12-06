//
//  FirstViewController.swift
//  ktp_pledges
//
//  Created by Joe Kunnath on 11/6/16.
//  Copyright © 2016 Joe Kunnath. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class FirstViewController: UIViewController, GIDSignInUIDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        setupFacebookButtons()
        
        setupGoogleButtons()
    }
    
    fileprivate func setupGoogleButtons() {
        //add google sign in button
        let googleButton = GIDSignInButton()
        googleButton.frame = CGRect(x: 16, y: 300, width: view.frame.width - 32, height: 50)
        view.addSubview(googleButton)
        
        
        GIDSignIn.sharedInstance().uiDelegate = self
    }
    
    func handleCustomGoogleSign() {
        GIDSignIn.sharedInstance().signIn()
}
}
