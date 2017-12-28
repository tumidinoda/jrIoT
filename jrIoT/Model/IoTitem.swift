//
//  IoTitem.swift
//  jrIoT
//
//  Created by Robert Jonas on 21.12.17.
//  Copyright © 2017 jr-soft. All rights reserved.
//

import Foundation
import SwiftMQTT

class IoTitem: MQTTSessionDelegate {
    let mqtt_host: String
    let topic: String
    let mqttSession: MQTTSession!
    public var alive = false
    //-----------------------------------------------------------------------------------
    init(host: String,port: UInt16=1883,topic: String) {
        self.mqtt_host=host
        self.topic=topic
        mqttSession = MQTTSession(host: self.mqtt_host, port: port, clientID: "swift", cleanSession: true, keepAlive: 15, useSSL: false)
        mqttSession.delegate = self
        self.reconnect()
    }
    //-----------------------------------------------------------------------------------
    func reconnect(){
        if !self.alive {
            mqttSession.connect {
                if !$0 {
                    print("Error Occurred During connection \($1)")
                    return
                }
                print("Connected.")
                self.alive=true
            }
            
            
  /*          self.mqttSession.connect { (succeeded, error) -> Void in
                if succeeded
                    {self.alive=true}
                else
                    {self.alive=false}
            }
*/
        }

    }

    //-----------------------------------------------------------------------------------
    func mqttDidReceive(message data: Data, in topic: String, from session: MQTTSession) {
        print("Did receive message")
    }
    //-----------------------------------------------------------------------------------
    func mqttDidDisconnect(session: MQTTSession) {
        self.alive=false
        print("DidDisconnect")
    }
    
    //-----------------------------------------------------------------------------------
    func mqttSocketErrorOccurred(session: MQTTSession) {
        print("SocketError")
    }
    

    
    

    
}


