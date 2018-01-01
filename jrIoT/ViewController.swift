//
//  ViewController.swift
//  jrIoT
//
//  Created by Robert Jonas on 30.12.17.
//  Copyright © 2017 jr-soft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 
    @IBOutlet weak var myTextView: UITextView!

    //----------------------------------------------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("View loaded")
    }

    //----------------------------------------------------------------------------------------------------
    @IBAction func pushedMyButton(_ sender: UIButton) {
        print("Button pushed")
        self.myTextView.text=self.myTextView.text+" Dies ist mein Text"
    }
 
    //----------------------------------------------------------------------------------------------------
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

