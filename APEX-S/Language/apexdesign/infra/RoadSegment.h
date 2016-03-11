#ifndef ROADSEGMENT__H
#define ROADSEGMENT__H

#include "PathSegment.h"
#include "RoadLane.h"
#include "TrafficControl.h"

/// class RoadSegment - This is a road segment, with optional static objects (e.g. traffic lights, stop signs) at both ends. A road segment does not concern with the actual geometry of the road, for example whether it is straight or curved.
class RoadSegment : public PathSegment {
  // Associations
  RoadLane unnamed_6;
  TrafficControl unnamed_5;
  TrafficControl unnamed_4;
  // Attributes
public:
  /// Length of the road segment.
  TPVLength length;
  /// Static objects at the beginning of the segment.
   beginObjs;
  /// Static object at the end of the segment.
   endObjs;
  /// Ordered list of lanes on this road segment.
   lanes;
};

#endif
