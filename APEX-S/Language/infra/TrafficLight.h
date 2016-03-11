#ifndef TRAFFICLIGHT__H
#define TRAFFICLIGHT__H

#include "StatefulTrafficControl.h"

/// class TrafficLight - A simple traffic light with fixed sequence and duration.
class TrafficLight : public StatefulTrafficControl {
  // Attributes
private:
  /// An ordered list of durations, in seconds, of each state, starting from 0. The sequence will increase from 0 to n-1, where n is the length of timing, then reset to 0.
  vector<double> timing;
};

#endif
