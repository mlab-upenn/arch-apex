#ifndef APEXOBJECT__H
#define APEXOBJECT__H

/// class APEXObject - An APEX object, which has an interface via variables. The variables can be accessed from outside, either read-only or read&write.
class APEXObject {
  // Attributes
public:
  /// Dictionary of variables that can be read and/or written. See definition of class Variable for more details.
  map<string,Variable> variables;
  /// List of parameters that can be initialized, e.g. initial position of a vehicle, initial speed, a list of values for a parameter, etc.
  map<string,Parameter> initialParams;
};

#endif
