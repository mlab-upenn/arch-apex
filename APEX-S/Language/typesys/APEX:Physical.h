#ifndef APEX:PHYSICAL__H
#define APEX:PHYSICAL__H


namespace APEX:Physical {

  // interface
  /// class TPhysicalValue - Represents a physical value, with unit, for example 2km, 45km/h
  class TPhysicalValue {
    // Operations
  public:
    /// Set the value, return true if valid, false if not valid.a
    /// @param val		(???) Value
    virtual bool SetValue (double val) = 0;
    /// Set the unit, return true if valid, false if not valid.a
    /// @param unit		(???) The unit as a string.
    virtual bool SetUnit (string unit) = 0;
    virtual double GetValue () = 0;
    virtual string GetUnit () = 0;
    /// Convert the value with unit to the standard unit (e.g. meters for length).
    virtual TPhysicalValue ToStandard () = 0;
  };

  /// class TPVLength - Lengths (physical values).
  class TPVLength : public APEX:Physical::TPhysicalValue {
  };

  /// class TPVVelo - Velocity (physical values).
  class TPVVelo : public APEX:Physical::TPhysicalValue {
  };

  /// class TPVAccel - Acceleration (physical values).
  class TPVAccel : public APEX:Physical::TPhysicalValue {
  };

};

#endif
