#ifndef VEHICLEDYNAMICS__H
#define VEHICLEDYNAMICS__H

#include "APEXObject.h"

/// class VehicleDynamics - Abstract class for vehicle dynamics. It has a dictionary of vehicle's I/O variables which the controller can read / write, for example: velocity 'v', acceleration 'a'.
class VehicleDynamics : public APEXObject {
};

#endif
