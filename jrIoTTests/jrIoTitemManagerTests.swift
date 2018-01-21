//
//  jrIoTitemsManagerTests.swift
//  jrIoTTests
//
//  Created by Robert Jonas on 19.01.18.
//  Copyright © 2018 jr-soft. All rights reserved.
//
import XCTest
@testable import jrIoT

class jrIoTitemManagerTests: XCTestCase {
    let myItemMgr = JrIoTitemManager.sharedInstance
    
    //----------------------------------------------------------------------------------------------------
    override func setUp() {
        super.setUp()
    }
    
    //----------------------------------------------------------------------------------------------------
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    //----------------------------------------------------------------------------------------------------
    func testAddIoTitem() {
        let myIoThost = "10.0.0.14"
        let myIoTitem = JrIoTitem(host: myIoThost)
        
        myItemMgr.itemList.append(myIoTitem)
        XCTAssertEqual(myItemMgr.itemList.count, 1)
        XCTAssertEqual(myItemMgr.itemList[0].mqttBrokerHost, myIoThost)
        
    }
    
    //----------------------------------------------------------------------------------------------------
    func testKeepAlive() {
        let myIoThost = "10.0.0.15"  //non existing MqttBroker
        let myIoTitem = JrIoTitem(host: myIoThost)
        
        myItemMgr.itemList.append(myIoTitem)
        XCTAssertEqual(myItemMgr.itemList.count, 2)
        
        myItemMgr.startKeepAliveTimer(interval: 5)
        
        //wait 60 seconds
        while myItemMgr.timerCounter < 12 {
            wait(waitTime: 12)
            print("Wait timer finished")
        }
        print("testKeepAliveFinished")

        
        //stop keepAliveTimer
        myItemMgr.stopKeepAliveTimer()
        XCTAssertNil(myItemMgr.timer)
        
    }
    //----------------------------------------------------------------------------------------------------
    func wait(waitTime: TimeInterval) //in seconds  e.g.: 0.1 means 100 msec
    {
        RunLoop.current.run(mode: RunLoopMode.defaultRunLoopMode, before: NSDate(timeIntervalSinceNow: waitTime) as Date)
    }
}
