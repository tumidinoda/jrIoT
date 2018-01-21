//
//  jrIoTitemsManagerTests.swift
//  jrIoTTests
//
//  Created by Robert Jonas on 19.01.18.
//  Copyright © 2018 jr-soft. All rights reserved.
//

import XCTest
@testable import jrIoT
//import jrIoT


class jrIoTitemManagerTests: XCTestCase {

    
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

        
        let test=JrIoTitemManager()
        var myIoTitem: JrIoTitem
        myIoTitem = JrIoTitem(host: "10.0.0.14")
        
        test.add(iotItem: myIoTitem)
        test.add(item: "Hallo")
        
  
        
        
        
        
        
        //myIoTitemManager.add(iotItem: myIoTitem)
        
        //myIoTitemManager.add(iotItem: myIoTitem)
        //myIoTitemManager.add(iotItem: 5)
    }
    
    
    
    
}
