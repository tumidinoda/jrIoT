//
//  JrIoTitemManager.swift
//  jrIoT
//
//  Created by Robert Jonas on 19.01.18.
//  Copyright © 2018 jr-soft. All rights reserved.
//

import Foundation

// Singleton class JrIoTManager
class JrIoTitemManager {
    private var itemList = [String: JrIoTitem]()
    private static let sharedInstance = JrIoTitemManager()
    class var sharedManager : JrIoTitemManager {
        return sharedInstance
    }
    //----------------------------------------------------------------------------------------------------
    func add(item: JrIoTitem) {
        self.itemList[item.mqttBrokerHost] = item
    }
}


