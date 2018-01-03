//
//  jrIoTitem.swift
//  jrIoT
//
//  Created by Robert Jonas on 30.12.17.
//  Copyright © 2017 jr-soft. All rights reserved.
//
import Foundation
import SwiftMQTT

public typealias JrIoTcallback = (_ succeeded: Bool, _ error: Error) -> Void

class JrIoTitem: MQTTSessionDelegate {
    static var counter=0
    let myId: Int
    let mqttBrokerHost: String
    let mqttBrokerPort: UInt16
    let mqttSession: MQTTSession!
    var alive = false
    //----------------------------------------------------------------------------------------------------
    init(host: String,port: UInt16 = 1883) {
        JrIoTitem.counter+=1
        myId=JrIoTitem.counter
        mqttBrokerHost=host
        mqttBrokerPort=port
        
        mqttSession = MQTTSession(host: mqttBrokerHost, port: mqttBrokerPort, clientID: "jrIoTitem", cleanSession: true, keepAlive: 15)
        mqttSession.delegate = self
        
    }
    
    //----------------------------------------------------------------------------------------------------
    func reconnect(_ callback: JrIoTcallback? = nil) {
        mqttSession.disconnect()
        mqttSession.connect {
            self.alive=$0
            print("MqttBroker\(self.myId) \(self.mqttBrokerHost):\(self.mqttBrokerPort): \($1)")
            if (callback != nil) {callback!($0,$1)}
        }
    }
    
    //----------------------------------------------------------------------------------------------------
    func disconnect() {
        mqttSession.disconnect()
    }
    
    //----------------------------------------------------------------------------------------------------
    func mqttDidReceive(message data: Data, in topic: String, from session: MQTTSession) {
        print("Mqtt message received")
    }
    
    //----------------------------------------------------------------------------------------------------
    func mqttDidDisconnect(session: MQTTSession) {
        self.alive=false
        print("MqttBroker\(myId) \(self.mqttBrokerHost):\(self.mqttBrokerPort): disconnected")
    }
    
    //----------------------------------------------------------------------------------------------------
    func mqttSocketErrorOccurred(session: MQTTSession) {
        print("Mqtt Socket Error")
    }
    
}
