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
   
    var users = [user]()
    
    
    
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: "MatchedTableCell", bundle: nil), forCellReuseIdentifier: "matchedCell")
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        self.tableView.addSubview(self.refresh)
        

        test()
//        for i in 0..<100{
//            let user = createUser(name: String(i))
//            users.append(user)
//        }
        
        
    }
    
//    func fectData(){
//        let url = URL(string: "http://127.0.0.1:3000/user/nearbyUsers")!
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            guard let data = data, error == nil else {                                                 // check for fundamental networking error
//                print("error=\(error)")
//                return
//            }
//
//            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
//                print("statusCode should be 200, but is \(httpStatus.statusCode)")
//                print("response = \(response)")
//            }
//
//            let responseString = String(data: data, encoding: .utf8)
//            print("responseString = \(responseString)")
//
//            let jsonDecoder = JSONDecoder()
//            self.users = [try! jsonDecoder.decode(user.self, from: data)]
//            print("users = \(self.users)")
//        }
//        task.resume()
//
//    }
//
//    func postData(){
//        let url = URL(string: "http://127.0.0.1:6969/user/nearbyUsers")!
//        print (url)
//        var request = URLRequest(url: url)
//
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.httpMethod = "POST"
//
////        let u = user(email: "debra1@gmail.com", name: "", sex: "0", age: 0, favFood: "9", cookPref: 0, perferFood: ["AD"], bio: "A", location: location(coordinate: [10,10]))
//        let u = user( name: "", email: "jj@gmail.com", age: "", phone: "", sex: "", cookpref: "", favfood: "", bio: "")
//
//        let jsonEncoder = JSONEncoder()
//        let jsonData = try! jsonEncoder.encode(u)
////        print(jsonData)
//        let json = String(data: jsonData, encoding: .utf8)
////        print(json!)
//        //        let postString = "{\"email\": \"testmore\" }"
//
//        request.httpBody = json?.data(using: .utf8)
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            guard let data = data, error == nil else {                                                 // check for fundamental networking error
//                print("error=\(error)")
//                return
//            }
//
//            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
//                print("statusCode should be 200, but is \(httpStatus.statusCode)")
//                print("response = \(response)")
//            }
//
//            let responseString = String(data: data, encoding: .utf8)
//            print("responseString = \(responseString)")
//
//
//            let jsonDecoder = JSONDecoder()
//            let test = try? jsonDecoder.decode(user.self, from: data)
//            print(try! jsonDecoder.decode(user.self, from: responseString!.data(using: .utf8)!))
//
////            let list =  try! jsonDecoder.decode(user.self, from: responseString!.data(using: .utf8)!)
//
////            list.forEach({ (user) in
////            self.users.append(user)
////        })
//
//            print("users = \(self.users[0])")
//        }
//        task.resume()
//        DispatchQueue.main.async {
//            self.tableView.reloadData()
//        }
//    }
    
    
    
    func test() {
        //Build url request
        let url = URL(string: "http://ec2-52-90-117-91.compute-1.amazonaws.com:3000/user/nearbyUsers")!
        print (url)
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let u = createUser(name: "")
        
        //From object to json
        let jsonEncoder = JSONEncoder()
        let jsonData = try! jsonEncoder.encode(u)
        //        print(jsonData)
        let json = String(data: jsonData, encoding: .utf8)
        //        print(json!)
        request.httpBody = json?.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {                                                 // check for fundamental networking error
                print("error=\(String(describing: error))")
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(String(describing: response))")
            }
            let responseString = String(data: data, encoding: .utf8)
            print("responseString = \(String(describing: responseString))")
            
            let jsonDecoder = JSONDecoder()
//            print(try! jsonDecoder.decode(user.self, from: (responseString!.data(using: .utf8))!))
            let list = try! jsonDecoder.decode([user].self, from: (responseString!.data(using: .utf8))!)
            print(list)
            list.forEach({ (user) in
                self.users.append(user)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            })
        }
        task.resume()
    }

    
    lazy var refresh: UIRefreshControl = {
     
        let rc = UIRefreshControl()
        rc.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        rc.tintColor = Colors.limeGreen
        return rc
    }()
    
    @objc func handleRefresh()  {
        
        self.tableView.reloadData()
        sleep(2)
        refresh.endRefreshing()
    }
    
    func createUser(name:String) -> user{
        return user(name: "", email: "jj@gmail.com", age: "", phone: "", sex: "", cookpref: "",
                    favfood1: "", favfood2: "",favfood3: "",favfood4: "",favfood5: "",bio: "")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
//        print(users.count)
        return users.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell :MatchedTableCell = tableView.dequeueReusableCell(withIdentifier: "matchedCell", for: indexPath) as! MatchedTableCell
        
//        cell.name.text = self.users[indexPath.row].name
        cell.populate(user: self.users[indexPath.row])
//        if (indexPath.row / 2 == 0){
//            print("Even: " + String(indexPath.row))
//            cell.emoji.text = "🍒"
//        }else{
//
//            print("Odd: " + String(indexPath.row))
//            cell.emoji.text = "🥦"
//        }
        
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
