//
//  ViewController.swift
//  HGLogger
//
//  Created by Hardik on 23/02/18.
//  Copyright © 2018 HDG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        HGLogger.sharedInstance.log(type: .info, message: "Hello world")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

