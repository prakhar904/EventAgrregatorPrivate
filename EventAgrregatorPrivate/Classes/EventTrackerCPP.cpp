//
//  MyCppClass.cpp
//  EventAggregators
//
//  Created by Prakhar Garg on 30/07/23.
//

// MyCWrapper.cpp


//#include "MyCWrapper.h"
//#include "MyCppClass.h"
//
//void MyCppClass::doSomething() {
//    // Method code
//    std::cout << "Doing something in MyClass." << std::endl;
//}
//
//MyCppClassPtr MyCppClass_create() {
//    return new MyCppClass();
//}
//
//void MyCppClass_doSomething(MyCppClassPtr ptr) {
//    static_cast<MyCppClass*>(ptr)->doSomething();
//}

#include "EventTrackerCPP.hpp"
#include "EventAggregatorInteropCppWrapper.h"

void EventTracker::addEvent(const std::string& key, float value) {
    std::time_t now = std::time(0);
    events[key].push_back({now, value});
}

float EventTracker::getAggregatedAnswer(const std::string& key, int seconds) {
    float sum = 0.0;
    std::time_t now = std::time(0);
    const auto& eventsList = events[key];
    for (const auto& event : eventsList) {
        if (std::difftime(now, event.first) <= seconds) {
            sum += event.second;
        } else {
            break;
        }
    }
    return sum;
}



EventTrackerPtr EventTracker_new() {
    return new EventTracker();
}

void EventTracker_delete(EventTrackerPtr ptr) {
    delete static_cast<EventTracker*>(ptr);
}

void EventTracker_addEvent(EventTrackerPtr ptr, const char* key, float value) {
    static_cast<EventTracker*>(ptr)->addEvent(key, value);
}

float EventTracker_getAggregatedAnswer(EventTrackerPtr ptr, const char* key, int seconds) {
    return static_cast<EventTracker*>(ptr)->getAggregatedAnswer(key, seconds);
}







