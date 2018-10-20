//
//  ViewController.swift
//  TakeMeOut
//
//  Created by Mhnd on 10/20/18.
//  Copyright © 2018 Mhnd. All rights reserved.
//

import UIKit
import Foundation
import GoogleSignIn


class ViewController: UIViewController, GIDSignInUIDelegate {

    struct Dog: Codable {
        var email: String
        var name: String
        var owner: String
    }


    
    @IBAction func pushDataButtonClicked(_ sender: Any) {
        
        let url = URL(string: "http://localhost:6968/user/register")!
        
        var request = URLRequest(url: url)
        
//        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
       
        let dog = Dog(email: "asdjfnkajsdnf", name: "dog", owner: "not dog")
        
        
        let jsonEncoder = JSONEncoder()
        let jsonData = try! jsonEncoder.encode(dog)
        let json = String(data: jsonData, encoding: String.Encoding.utf16)
        let postString = json
        
        
        request.httpBody = postString!.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {                                                 // check for fundamental networking error
                print("error=\(error)")
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(response)")
            }
            
            let responseString = String(data: data, encoding: .utf8)
            print("responseString = \(responseString)")
        }
        task.resume()

    }
    
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

