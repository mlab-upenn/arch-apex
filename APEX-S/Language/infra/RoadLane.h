#ifndef ROADLANE__H
#define ROADLANE__H

/// class RoadLane - A lane.
class RoadLane {
  // Attributes
public:
  /// Speed limit set on this lane of the road segment.
  TPVVelo speedLimit;
  /// If the lane is blocked, i.e. if a vehicle is in this lane, it is unsafe/invalid. For example, an incident or road work is happening in this lane.
  bool blocked;
};

#endif
