#ifndef STATICOBJECT__H
#define STATICOBJECT__H

#include "SensorDistancePt.h"

/// class StaticObject - A static object such as a traffic light, a stop sign, etc. It is considered a point, so it has no length. A specific object type should derive from this class. A vanila StaticObject can be thought of as a mark point.
class StaticObject {
  // Associations
  SensorDistancePt unnamed_4;
};

#endif
