//
//  StatViewController.swift
//  To-Do List V.2
//
//  Created by David Choi on 10/18/16.
//  Copyright © 2016 David Choi. All rights reserved.
//

import UIKit

class StatViewController: UIViewController {

    @IBOutlet weak var numberCompleted: UILabel!
    
    
    var receivedString : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberCompleted.text = receivedString

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
