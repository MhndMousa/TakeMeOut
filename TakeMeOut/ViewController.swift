//
//  ViewController.swift
//  TakeMeOut
//
//  Created by Mhnd on 10/20/18.
//  Copyright © 2018 Mhnd. All rights reserved.
//

import UIKit
import GoogleSignIn


class ViewController: UIViewController, GIDSignInUIDelegate {

    @IBAction func signinButtonClicked(_ sender: Any) {
        GIDSignIn.sharedInstance()?.signIn()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        GIDSignIn.sharedInstance().uiDelegate = self
        
    }
    
//    func signInWillDispatch(signIn: GIDSignIn!, error: NSError!) {
//        UIActivityIndicatorView.stopAnimating()
//    }
//
    // Present a view that prompts the user to sign in with Google
    func signIn(signIn: GIDSignIn!,
                presentViewController viewController: UIViewController!) {
        self.present(viewController, animated: true, completion: nil)
    }
    
    // Dismiss the "Sign in with Google" view
    func signIn(signIn: GIDSignIn!,
                dismissViewController viewController: UIViewController!) {
        self.dismiss(animated: true, completion: nil)
    }



}

