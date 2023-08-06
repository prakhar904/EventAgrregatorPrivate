//
//  EventAggregatorInteropCppWrapper.h
//  Pods
//
//  Created by Prakhar Garg on 30/07/23.
//

#ifdef __cplusplus
extern "C" {
#endif

typedef void* EventTrackerPtr;

EventTrackerPtr EventTracker_new();
void EventTracker_delete(EventTrackerPtr ptr);

void EventTracker_addEvent(EventTrackerPtr ptr, const char* key, float value);
float EventTracker_getAggregatedAnswer(EventTrackerPtr ptr, const char* key, int seconds);
#ifdef __cplusplus
}
#endif


