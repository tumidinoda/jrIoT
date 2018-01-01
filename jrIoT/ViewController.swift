//
//  ViewController.swift
//  jrIoT
//
//  Created by Robert Jonas on 30.12.17.
//  Copyright © 2017 jr-soft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var myBrokerList = [String: JrIoTitem]()
    var myMqttBroker=12

 
    @IBOutlet weak var myTextView: UITextView!

    //----------------------------------------------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.myTextView.text=""
        print("View loaded")
    }

    //----------------------------------------------------------------------------------------------------
    @IBAction func pushedMyButton(_ sender: UIButton) {
        print("Button pushed")
        
        let myMqttBrokerHost = "10.0.0."+String(myMqttBroker)
        self.appendText("Host: \(myMqttBrokerHost) --> ")
        myBrokerList[myMqttBrokerHost] = JrIoTitem(host: myMqttBrokerHost)
        let myCallback: JrIoTcallback = {
            if $0 {self.appendText("Alive: true\n")}
            else {self.appendText("Alive: false \($1)\n")}
        }
        
        DispatchQueue.main.async {
            self.myBrokerList[myMqttBrokerHost]?.reconnect(myCallback)
        }
        
        myMqttBroker+=1
    }
    
    //----------------------------------------------------------------------------------------------------
    func appendText(_ myText: String){
        self.myTextView.text=self.myTextView.text+myText
    }
    //----------------------------------------------------------------------------------------------------
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

