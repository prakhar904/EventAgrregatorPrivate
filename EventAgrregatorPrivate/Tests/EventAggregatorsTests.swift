//
//  EventAggregatorTests.swift
//  EventAggregators
//
//  Created by Prakhar Garg on 28/07/23.
//

import XCTest
@testable import EventAgrregatorPrivate

class EventAggregatorsTests: XCTestCase {
    
    var eventManager: EventAggregator!
    
    override func setUp() {
        super.setUp()
        eventManager = EventAggregator()
    }
    
    override func tearDown() {
        eventManager = nil
        super.tearDown()
    }
    
    func testAddEventToSystem() {
        let eventMap = ["key1": "2", "key2": "3"]
        XCTAssertTrue(eventManager.addEventToSystem(eventMap))
    }
    
    func testGetAggregatedAnswer() {
        let eventMap = ["key1": "2", "key2": "3"]
        XCTAssertTrue(eventManager.addEventToSystem(eventMap))
        let values = eventManager.getAggregatedAnswer(for: "key1")
        XCTAssertEqual(values[0], 2.0, "The aggregated sum for 10 seconds is incorrect")
        XCTAssertEqual(values[1], 2.0, "The aggregated sum for 20 seconds is incorrect")
    }
    
    func testNonExistentKey() {
        let values = eventManager.getAggregatedAnswer(for: "NonExistentKey")
        XCTAssertEqual(values[0], 0.0, "The aggregated sum for 10 seconds should be 0 for a non-existent key")
        XCTAssertEqual(values[1], 0.0, "The aggregated sum for 20 seconds should be 0 for a non-existent key")
    }
    
}

