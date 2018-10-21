//
//  ProfivleTableViewController.swift
//  TakeMeOut
//
//  Created by Mhnd on 10/20/18.
//  Copyright © 2018 Mhnd. All rights reserved.
//

import UIKit

class MatchesTableViewController: UITableViewController {

    @IBOutlet weak var profileView: UIView!
    struct user :Codable{
        let email:String
        let name:String
        let sex:String
        let age:Int
        let favFood: String
        let cookPref: Int
        let perferFood:[String]
        let bio: String
        let location: location
        
    }
    
    var users = [user]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: "MatchedTableCell", bundle: nil), forCellReuseIdentifier: "matchedCell")
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        

        fectData()
//        for i in 0..<100{
//            let user = createUser(name: String(i))
//            users.append(user)
//        }
        
        
    }
    
    func fectData(){
        let url = URL(string: "http://10.186.59.115:6968/user/nearbyUsers")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
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
            
            let jsonDecoder = JSONDecoder()
            self.users = [try! jsonDecoder.decode(user.self, from: data)]
            print("users = \(self.users)")
        }
        task.resume()
        
    }
    
    func postData(){
        let url = URL(string: "http://127.0.0.1:6968/user/register")!
        print (url)
        var request = URLRequest(url: url)
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
//        let user = userAccount(email: "testmedad")
        
        
        let jsonEncoder = JSONEncoder()
//        let jsonData = try! jsonEncoder.encode(user)
//        print(jsonData)
//        let json = String(data: jsonData, encoding: .utf8)
//        print(json!)
        //        let postString = "{\"email\": \"testmore\" }"
        
//        request.httpBody = json?.data(using: .utf8)
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

    func createUser(name:String) -> user{
        return user(email: "KIL@gmail.com", name: name, sex: "M", age: 22, favFood: "Pizza", cookPref: 0, perferFood: ["Pancakes", "Muffins"], bio: "STeven Was Here", location: location(coordinate: [41.123124,12.421441]))
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return users.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell :MatchedTableCell = tableView.dequeueReusableCell(withIdentifier: "matchedCell", for: indexPath) as! MatchedTableCell
        
        cell.name.text = self.users[indexPath.row].name
        if (indexPath.row / 2 == 0){
            print("Even: " + String(indexPath.row))
            cell.emoji.text = "🍒"
        }else{
            
            print("Odd: " + String(indexPath.row))
            cell.emoji.text = "🥦"
        }
        
        return cell
    }
    var selectedRowIndex: NSIndexPath = NSIndexPath(row: -1, section: 0)
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        selectedRowIndex = indexPath as NSIndexPath

        
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
  

    
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {


//        return 170
        if indexPath.row == selectedRowIndex.row {
            return 400
        }
        return 170

    }
}
