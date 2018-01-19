//
//  jrIoTitemsManagerTests.swift
//  jrIoTTests
//
//  Created by Robert Jonas on 19.01.18.
//  Copyright © 2018 jr-soft. All rights reserved.
//

import XCTest
@testable import jrIoT

class jrIoTitemsManagerTests: XCTestCase {

    
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
        let myMqttBroker="10.0.0.14"
        let myIoTitemManager=JrIoTitemManager()
        
        let myIoTitem = JrIoTitem(host: myMqttBroker)
        myIoTitemManager.add(item: myIoTitem)
    }
    


    
}
