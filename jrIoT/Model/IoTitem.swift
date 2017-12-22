//
//  IoTitem.swift
//  jrIoT
//
//  Created by Robert Jonas on 21.12.17.
//  Copyright © 2017 jr-soft. All rights reserved.
//

import Foundation
import SwiftMQTT

class IoTitem {
    let ip: String
    init (ip: String) {
        self.ip=ip
        
    let mqttSession = MQTTSession(host: "10.0.0.14", port: 1883, clientID: "swift", cleanSession: true, keepAlive: 15, useSSL: false)
        
    mqttSession.connect { (succeeded, error) -> Void in
            if succeeded {
                print("Connected!")
            }
        }
    }
}


