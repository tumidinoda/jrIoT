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
    
    func testSetupIoTitem() {

        let myMqttHost="10.0.0.15"
        let myMqttPort=UInt16(1883)
        let expectation = self.expectation(description: "Connection Establishment")
        myIoTitem = JrIoTitem(host: myMqttHost,port: myMqttPort)
        
        //let connectionCallback: (Bool,Error)->() = {_,_ in expectation.fulfill()}
        let connectionCallback: JrIoTcallback = {_,_ in expectation.fulfill()}
        
        myIoTitem.reconnect(callback: connectionCallback)
        

        
        waitForExpectations(timeout: 5) { error in
            if let error = error {
                print("Error:", error.localizedDescription)
            }
            XCTAssertEqual(self.myIoTitem.mqttBrokerHost, myMqttHost)
            XCTAssertEqual(self.myIoTitem.mqttBrokerPort, myMqttPort)
            XCTAssertTrue(self.myIoTitem.alive)
        }
        
        
    }
/*
    //----------------------------------------------------------------------------------------------------
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
*/
    
}
