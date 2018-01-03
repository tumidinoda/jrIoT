//
//  jrIoTTests.swift
//  jrIoTTests
//
//  Created by Robert Jonas on 30.12.17.
//  Copyright © 2017 jr-soft. All rights reserved.
//

import XCTest
@testable import jrIoT


class jrIoTTests: XCTestCase {
    var myIoTitem: JrIoTitem!
    var myExpectation: XCTestExpectation!
    var myConnCallback: JrIoTcallback!
    let myMqttHost="10.0.0.14"   //raspi3
    let myMqttPort=UInt16(1883)
    
    //----------------------------------------------------------------------------------------------------
    override func setUp() {
        super.setUp()

        myConnCallback = {_,_ in self.myExpectation.fulfill()}
        myIoTitem = JrIoTitem(host: myMqttHost,port: myMqttPort)
    }
    
    //----------------------------------------------------------------------------------------------------
    func testNonExistingHost() {
        let myMqttHost="10.0.0.15"
        let myMqttPort=UInt16(1883)
        
        myExpectation = self.expectation(description: "Connection Failure")
        myIoTitem = JrIoTitem(host: myMqttHost,port: myMqttPort)
        
        myIoTitem.reconnect(myConnCallback)
        
        waitForExpectations(timeout: 5) { error in
            if let error = error {
                print("Error:", error.localizedDescription)
            }
            XCTAssertFalse(self.myIoTitem.alive)
        }
    }
    
    //----------------------------------------------------------------------------------------------------
    func testExistingHost() {
        myExpectation = self.expectation(description: "Connection Success")
        
        myIoTitem.reconnect(myConnCallback)
        
        waitForExpectations(timeout: 5) { error in
            if let error = error {
                print("Error:", error.localizedDescription)
            }
            XCTAssertEqual(self.myIoTitem.mqttBrokerHost, self.myMqttHost)
            XCTAssertEqual(self.myIoTitem.mqttBrokerPort, self.myMqttPort)
            XCTAssertTrue(self.myIoTitem.alive)
        }

    }
/*
    //----------------------------------------------------------------------------------------------------

    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
*/
    
}
