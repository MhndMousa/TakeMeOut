//
//  FormViewController.swift
//  TakeMeOut
//
//  Created by Kristiāns Kanders on 21/10/2018.
//  Copyright © 2018 Mhnd. All rights reserved.
//

import UIKit
import Eureka


class SettingViewController: FormViewController {
    
    @objc func submitTapped() {
        
        
        let values = form.values()
        
        let url = URL(string: "http://ec2-52-90-117-91.compute-1.amazonaws.com:3000/user/register")!
        print (url)
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let jsonEncoder = JSONEncoder()
//        let jsonData = try! jsonEncoder.encode(values as struct)
        request.httpMethod = "POST"
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {                                                 // check for networking error
                print("error=\(error)")
                return
            }
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(response)")
            }
            let responseString = String(data: data, encoding: .utf8)
            print("responseString = \(responseString)")
            let jsonDecoder = JSONDecoder()
//            self.users = [try! jsonDecoder.decode(user.self, from: data)]
//            print("users = \(self.users)")
        }
        task.resume()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Submit", style: .plain, target: self, action: #selector(submitTapped))
        
        
        let food = [
            "Pizza": "🍕",
            "French Fries": "🍟",
            "Chicken": "🍗",
            "Tacos": "🌮",
            "Pasta": "🍝",
            "Burger": "🍔",
            "Icecream": "🍦",
            "Sushi": "🍣",
            ]
        var foodEmojis = [String]()
        
        for value in food.values{
            foodEmojis.append(value)
        }
        
        
        
        form +++ Section("Personal Information")
            <<< NameRow(){
                $0.title = "Name"
//                $0.placeholder = "Name"
            }
            <<< EmailRow(){
                $0.title = "Email"
                $0.add(rule: RuleRequired())
                $0.add(rule: RuleEmail())
            
            }
            <<< SegmentedRow<String>(){
                $0.title = "Gender\t\t"
                
                $0.options = ["Male", "Female"]
            }
            <<< IntRow(){
                $0.title = "Age"
//                $0.placeholder = "Age"
        }
            <<< TextAreaRow(){
                $0.placeholder = "Bio"
            }
        
    
        
        +++ Section("Favorite Food")
            <<< ActionSheetRow<String>(){
                $0.title = "Food #1"
                $0.options = foodEmojis
                $0.selectorTitle = "Choose an Emoji!"
                
                }
                    
            
                        
            <<< ActionSheetRow<String>(){
                $0.title = "Food #2"
                $0.options = foodEmojis
                $0.selectorTitle = "Choose an Emoji!"
                
        }
            <<< ActionSheetRow<String>(){
                $0.title = "Food #3"
                $0.options = foodEmojis
                $0.selectorTitle = "Choose an Emoji!"
                
        }
            <<< ActionSheetRow<String>(){
                $0.title = "Food #4"
                $0.options = foodEmojis
                $0.selectorTitle = "Choose an Emoji!"
                
        }
            <<< ActionSheetRow<String>(){
                $0.title = "Food #5"
                $0.options = foodEmojis
                $0.selectorTitle = "Choose an Emoji!"
                
        }
        
        +++ Section("")
        <<< ButtonRow() {
            $0.title = "Submit"
            }
            .onCellSelection {  cell, row in
            self.submitTapped()
        }
        



        // Do any additional setup after loading the view.
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
