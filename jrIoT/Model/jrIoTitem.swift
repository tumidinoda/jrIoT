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
    let mqttBrokerHost: String!
    let mqttBrokerPort: UInt16!
    let mqttSession: MQTTSession!
    var alive = true
    //----------------------------------------------------------------------------------------------------
    init(host: String,port: UInt16 = 1883) {
        mqttBrokerHost=host
        mqttBrokerPort=port
        
        mqttSession = MQTTSession(host: mqttBrokerHost, port: mqttBrokerPort, clientID: "jrIoTitem", cleanSession: true, keepAlive: 15)
        mqttSession.delegate = self
        
        self.reconnect()
        
    }
    
    //----------------------------------------------------------------------------------------------------
    func reconnect() {
        mqttSession.connect{
            self.alive=$0
            print(self.mqttBrokerHost+": "+String(describing: $1))
        }

        
    }
    
    //----------------------------------------------------------------------------------------------------
    func mqttDidReceive(message data: Data, in topic: String, from session: MQTTSession) {
        print("Mqtt message received")
    }
    
    //----------------------------------------------------------------------------------------------------
    func mqttDidDisconnect(session: MQTTSession) {
        self.alive=false
        print("Mqtt connection disconnected")
    }
    
    //----------------------------------------------------------------------------------------------------
    func mqttSocketErrorOccurred(session: MQTTSession) {
        print("Mqtt Socket Error")
    }
    
}
