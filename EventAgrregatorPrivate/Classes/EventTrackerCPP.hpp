//
//  EventTrackerCPP.hpp
//  EventAggregators
//
//  Created by Prakhar Garg on 30/07/23.
//

#ifndef EventTrackerCPP_hpp
#define EventTrackerCPP_hpp

#include <ctime>
#include <string>
#include <unordered_map>
#include <vector>

class EventTracker {
public:
    void addEvent(const std::string& key, float value);
    float getAggregatedAnswer(const std::string& key, int seconds);

private:
    std::unordered_map<std::string, std::vector<std::pair<std::time_t, float>>> events;
};

#endif /* MyCppClass_h */
