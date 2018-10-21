//
//  accountFormViewController.swift
//  TakeMeOut
//
//  Created by Kristiāns Kanders on 20/10/2018.
//  Copyright © 2018 Mhnd. All rights reserved.
//

import UIKit
import Eureka

class accountFormViewController: FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        form +++ Section("Account details")
            <<< TextRow(){ row in
                row.title = "Age"
            }
            <<< SegmentedRow<String>(){
                $0.title = "Gender"
                $0.options = ["Male","Female"]
            }
            <<< SegmentedRow<String>(){
                $0.title = "Partner Gender preference"
                $0.options = ["Male", "Female"]
            }
            <<< SegmentedRow<String>(){
                $0.title = "Dining preferences"
                $0.options = ["Cook at home", "Eat out"]
            }
        // Do any additional setup after loading the view.		    `
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
