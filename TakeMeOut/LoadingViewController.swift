//
//  LoadingViewController.swift
//  TakeMeOut
//
//  Created by Mhnd on 10/20/18.
//  Copyright © 2018 Mhnd. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class LoadingViewController: UIViewController, NVActivityIndicatorViewable{

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.setGradientBackground(colorOne: Colors.teal, colorTwo: Colors.limeGreen)
        setupLabel()
        setUpLodingIndicator()
        
        
    }
    
    func setupLabel(){
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.text = "Gathering data from\n people around you"
        
        
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        label.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
        label.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20).isActive = true
        label.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 40).isActive = true
        
        
        
    }
    
    func setUpLodingIndicator(){
        let activityIndicator = NVActivityIndicatorView(frame: CGRect(x: ((self.view.bounds.width) / 2) - 75, y: (self.view.bounds.height / 2 ) - 75, width: 150, height: 150))
        activityIndicator.type = .pacman
        view.addSubview(activityIndicator)
        
//        DispatchQueue.main.async {
            activityIndicator.startAnimating()
            
//        }
        //        NVActivityIndicatorView(frame: frame, type: type, color: color, padding: padding)
        

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
