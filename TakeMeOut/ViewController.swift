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
    
    struct userAccount: Codable {
        var email: String
        
    }
//    struct post: Codable {
//        var : Int
//        var Id: Int
//        var title: String
//        var body: String
//    }
    
    
    
    @IBOutlet weak var loginButton: UIButton!
    @IBAction func pushDataButtonClicked(_ sender: Any) {
        
     
    }
    
    @IBAction func signinButtonClicked(_ sender: Any) {
        GIDSignIn.sharedInstance()?.signIn()
        if(GIDSignIn.sharedInstance()?.currentUser != nil){
            self.goToMain()
        }
        
    }
    func goToMain() {
        let secondVC = self.storyboard!.instantiateViewController(withIdentifier: "main")
        self.present(secondVC, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        GIDSignIn.sharedInstance().uiDelegate = self
        drawCircle()
        addLabels()
        configureLoginButton()
    }
    
    func configureLoginButton(){
        loginButton.layer.cornerRadius = 30
        loginButton.setGradientBackground(colorOne: Colors.teal, colorTwo: Colors.limeGreen)
    }
    
    
    func addLabels() {
        let logo = UILabel()
        
        logo.text = "Take Me\n Out!"
        logo.numberOfLines = 2
        logo.textAlignment = .center
        logo.font = UIFont.boldSystemFont(ofSize: 80)
        logo.textColor = .white
        self.view.addSubview(logo)
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        logo.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
        
        
        let text = UILabel()
        text.numberOfLines = 2
        text.textAlignment = .center
        text.text = "Find people through your love of food\n 🍔 🍟 🌭 🍕 🍙 🍤 🥟 🍡 🥗 🍰"
        
        text.textColor = .white
        self.view.addSubview(text)
        text.translatesAutoresizingMaskIntoConstraints = false
        text.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        text.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 130).isActive = true
        
        
    }
    func drawCircle(){
        let radius: CGFloat = self.view.bounds.height + 50
        let circle = UIView(frame: CGRect(x: -70, y: -200, width: radius, height: radius))
        circle.layer.cornerRadius = radius / 2
        circle.dropShadow()
        circle.setGradientBackground(colorOne: Colors.teal, colorTwo: Colors.limeGreen)
        circle.clipsToBounds = true
//        circle.dropShadow()
        self.view.insertSubview(circle, at: 0)
    }
    
    
    func signIn(signIn: GIDSignIn!,
                presentViewController viewController: UIViewController!) {
        self.present(viewController, animated: true, completion: nil)
    }
    func signIn(signIn: GIDSignIn!,
                dismissViewController viewController: UIViewController!) {
        self.dismiss(animated: true, completion: nil)
    }
}


extension UIView {
    
    // OUTPUT 1
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = 1
        
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    // OUTPUT 2
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}
