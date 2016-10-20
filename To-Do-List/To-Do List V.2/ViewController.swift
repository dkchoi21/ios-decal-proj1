//
//  ViewController.swift
//  To-Do List V.2
//
//  Created by David Choi on 10/18/16.
//  Copyright © 2016 David Choi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var taskName: UITextField!
    
    @IBOutlet weak var taskDetail: UITextField!
    
    var receivedString = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

