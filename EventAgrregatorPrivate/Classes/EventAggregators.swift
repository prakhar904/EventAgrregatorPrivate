//
//  EventAggregator.swift
//  EventAggregators
//
//  Created by Prakhar Garg on 28/07/23.
//

import Foundation

final class EventTracker {
    private let ptr: EventTrackerPtr
    
    init() {
        ptr = EventTracker_new()
    }
    
    deinit {
        EventTracker_delete(ptr)
    }
    
    func addEvent(key: String, value: Float) {
        if let cKey = strdup(key) {
            // Ensure Swift String is not deallocated prematurely
            defer { free(cKey) }
            
            EventTracker_addEvent(ptr, cKey, value)
        }
    }
    
    func getAggregatedAnswer(key: String, seconds: Int) -> Float {
        if let cKey = strdup(key) {
            // Ensure Swift String is not deallocated prematurely
            defer { free(cKey) }
            
            return EventTracker_getAggregatedAnswer(ptr, cKey, Int32(seconds))
        }
        
        return 0.0
    }
}

public final class EventAggregator {
    private let eventTracker = EventTracker()
    
    public init() {}
    
    public func addEventToSystem(_ events: [String: String]) -> Bool{
        for (key, value) in events {
            guard let valueFloat = Float(value) else {
                continue
            }
            eventTracker.addEvent(key: key, value: valueFloat)
        }
        
        return true
    }
    
    public func getAggregatedAnswer(for key: String) -> [Float] {
        let value10Sec = eventTracker.getAggregatedAnswer(key: key, seconds: 10)
        let value20Sec = eventTracker.getAggregatedAnswer(key: key, seconds: 20)
        return [value10Sec, value20Sec]
    }
}


