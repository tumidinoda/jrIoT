//
//  JrIoTitemManager.swift
//  jrIoT
//
//  Created by Robert Jonas on 19.01.18.
//  Copyright © 2018 jr-soft. All rights reserved.
//

import Foundation

// Singleton class JrIoTitemManager
class JrIoTitemManager {
    static let sharedInstance = JrIoTitemManager()
    private init() {} //avoid creation of object instance
    
    var itemList = [JrIoTitem]()
    weak var timer: Timer?
    var timerCounter=0
    
    //----------------------------------------------------------------------------------------------------
    func printItems() {
        for item in itemList {
            print("Broker host: \(item.mqttBrokerHost) Alive: \(item.alive)")
        }
    }
    //----------------------------------------------------------------------------------------------------
    func startKeepAliveTimer(interval: TimeInterval) {  //in seconds  e.g.: 0.1 means 100 msec
        timer?.invalidate()   // just in case we had existing `Timer`, `invalidate`
        timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true)
                { [weak self] _ in self?.callbackKeepAlive() }
    }
    //----------------------------------------------------------------------------------------------------
    func stopKeepAliveTimer() {
        timer?.invalidate()
    }
    //----------------------------------------------------------------------------------------------------
    func callbackKeepAlive() {
        timerCounter+=1
        print("Keep alive")
    }
}


