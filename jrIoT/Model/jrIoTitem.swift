//
//  jrIoTitem.swift
//  jrIoT
//
//  Created by Robert Jonas on 30.12.17.
//  Copyright © 2017 jr-soft. All rights reserved.
//

import Foundation

import SwiftMQTT

class jrIoTitem: MQTTSessionDelegate {
    let mqttBrokerHost: String
    let mqttBrokerPort: UInt16
    var alive = false
    //----------------------------------------------------------------------------------------------------
    init(host: String,port: UInt16 = 1883) {
        mqttBrokerHost=host
        mqttBrokerPort=port
        
    }
    
    //----------------------------------------------------------------------------------------------------
    func mqttDidReceive(message data: Data, in topic: String, from session: MQTTSession) {
        print("Mqtt message received")
    }
    
    //----------------------------------------------------------------------------------------------------
    func mqttDidDisconnect(session: MQTTSession) {
        print("Mqtt connection disconnected")
    }
    
    //----------------------------------------------------------------------------------------------------
    func mqttSocketErrorOccurred(session: MQTTSession) {
        print("Mqtt Socket Error")
    }
    
}
