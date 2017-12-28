//
//  IoTitem.swift
//  jrIoTTests
//
//  Created by Robert Jonas on 21.12.17.
//  Copyright © 2017 jr-soft. All rights reserved.
//

import XCTest
@testable import jrIoT
@testable import SwiftMQTT

class IoTitemTest: XCTestCase {
    let mqttBrokerHost = "10.0.0.14"
    //-----------------------------------------------------------------------------------
    func testIoTitem() {
     //     let myIoTitem = IoTitem(host: mqttBrokerHost)
     //     print (myIoTitem.connect())
    }
    //-----------------------------------------------------------------------------------
    func testSearchForLocalMqttBroker(){
        for i in 1...255 {
            let myHost="10.0.0."+String(i)
            let myIoTitem = IoTitem(host: myHost,topic: "swiftTest/LWT")
            if (myIoTitem.alive) {
                print("Broker: \(myIoTitem.mqtt_host) found")
            }
            else {
                print("Broker: \(myIoTitem.mqtt_host) not found")
            }
        }
        
    }

    /*-----------------------------------------------------------------------------------
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    //-----------------------------------------------------------------------------------*/
}
