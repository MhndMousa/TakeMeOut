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
        //        var name: String
        //        var owner: String
    }
    struct post: Codable {
        var userId: Int
        var Id: Int
        var title: String
        var body: String
    }
    
    
    
    @IBAction func pushDataButtonClicked(_ sender: Any) {
        
        let url = URL(string: "http://127.0.0.1:6968/user/register")!
        print (url)
        var request = URLRequest(url: url)
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        let dog = Dog(email: "testmedad")
        //        let dog = Dog(email: "asdjfnkajsdnf", name: "dog", owner: "not dog")
        //        let dog = post(userId: 100, Id: 10100, title: "tiitlelelel", body: "afhjksdabnvhasbndiniusdnisbdiufidbb")
        
        let jsonEncoder = JSONEncoder()
        let jsonData = try! jsonEncoder.encode(dog)
        print(jsonData)
        //        let json = String(data: "{\"email\": \"testmore\" }", encoding: .utf8)
        //        print(json!)
        let postString = "{\"email\": \"testmore\" }"
        
        request.httpBody = postString.data(using: .utf8)
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
        sleep(10)
        let secondVC = self.storyboard!.instantiateViewController(withIdentifier: "main")
        self.present(secondVC, animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        GIDSignIn.sharedInstance().uiDelegate = self
        drawCircle()
        addLabels()
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
