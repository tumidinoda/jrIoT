//
//  JrIoTitemManager.swift
//  jrIoT
//
//  Created by Robert Jonas on 19.01.18.
//  Copyright © 2018 jr-soft. All rights reserved.
//

import Foundation

/*
// Singleton class JrIoTitemManager
class JrIoTitemManager {
    //private var itemList = [String: JrIoTitem]()
    /*
    private static let sharedInstance = JrIoTitemManager()
    class var sharedManager : JrIoTitemManager {
        return sharedInstance
    } */
    //----------------------------------------------------------------------------------------------------
   func add (iotItem: JrIoTitem) {
     // self.itemList[iotItem.mqttBrokerHost] = iotItem
   }
    
}
*/

class JrIoTitemManager {
 
    func add (iotItem: JrIoTitem) {
        print ("IoTitem added \(iotItem)")
        
    }
    func add (item: String) {
        print ("IoTitem added \(item)")
    }
    
}

/*
class anotherTest {
    init() {
        let test=myTestClass()
        let myIoTitem = JrIoTitem(host: "10.0.0.14")
        
        test.add(iotItem: myIoTitem)
    }
    
    
    
}
*/
