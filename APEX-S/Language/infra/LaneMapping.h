#ifndef LANEMAPPING__H
#define LANEMAPPING__H

#include "PathSegment.h"

/// class LaneMapping - Define a mapping between road segments with different numbers of lanes.
class LaneMapping : public PathSegment {
  // Attributes
public:
  /// Lane i is mapped to lane mapping[i] in the next segment.
  vector<size_t> mapping;
  /// Number of lanes at the input (A).
  size_t nLanesA;
  /// Number of lanes at the output (B).
  size_t nLanesB;
};

#endif
