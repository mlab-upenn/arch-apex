#!/usr/bin/python

#
#  APEX.py
#  APEX tool for investigating trajectory sequences
#  In order to run tool enter command  ./APEX.py 2.15.01 apex.drh ouput
#
#  Created by Matthew O'Kelly and Satya Rama Aditya Pinapala on 9/1/15.
#  Copyright (c) 2015 Matthew O'Kelly and Satya Rama Aditya Pinapala. All rights reserved.
#  mokelly@seas.upenn.edu and pinapala@seas.upenn.edu
#
#  Call to dReach inspired by code from Stanley Bak et al.
#

#
#  Redistribution and use in source and binary forms, with or without
#  modification, are permitted provided that the following conditions are met:
#
#  * Redistributions of source code must retain the above copyright notice, this
#    list of conditions and the following disclaimer.
#
#  * Redistributions in binary form must reproduce the above copyright notice,
#    this list of conditions and the following disclaimer in the documentation
#    and/or other materials provided with the distribution.
#
#  * Neither the name of APEX nor the names of its
#    contributors may be used to endorse or promote products derived from
#    this software without specific prior written permission.
#
#  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
#  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
#  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
#  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
#  FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
#  DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
#  SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
#  CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
#  OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
#  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
#

import os
import sys
import subprocess
import shutil
import trajectorygenerator
import ctypes

# Will not work without dReach installed
NO_TOOL_EXIT_CODE = 125;

# The path to the dReach executable, from the work directory
# Set based on command-line parameters
toolPath = None;

# Debug flag, leave off for now...
debug_dreach = False;

####################################################################################################
# Read next waypoint
# Argument is the filename containing the csv of waypoints
# We need to add a means of choosing the next waypoint, preferably equivalent to planner algorithm

def getNextGoal():
    # Depth first search on BDD produced by behavior controller

    # Change so that it reads from the csv file...
    goalLC = (22.22, 3.8, 0.00, 11.1, 0.0)
    goalLF= (22.22, 0.00, 0.00, 11.1, 0.0)
    return goalLC


####################################################################################################
# Run trajectory generator and return parameterized controller
# This will generate the next trajectory, we won't actually implement the entire trajectory
# We will assume that we can make some real time gurantees about the timeliness of the planner
# We will implement a series of shortened versions of the trajectories
# This is where we could make a profiling based hardware in the loop style argument

def runStateLattice(goal,mode):
    if mode == "LC":
        temp = trajectorygenerator.trajectoryGenerator(goal[0], goal[1],goal[2], goal[3], goal[4]);
        result = ctypes.cast(temp.__long__(),ctypes.POINTER(ctypes.c_double))
        print result[0:4]
    else:
        temp = trajectorygenerator.trajectoryGenerator(goal[0], goal[1],goal[2], goal[3], goal[4]);
        result = ctypes.cast(temp.__long__(),ctypes.POINTER(ctypes.c_double))
        print result[0:4]

    return result;

####################################################################################################
# Append controller to system model and generate drh file
# Here we take the result of run state lattice and append it to the dReach file
# Each time we generate a new problem we can either proceed to the next trajectory segment or declare
# the controller to be unsafe.

def writeController(result, traj_num):
    # Create name for new dReach instance
    filename = "python_gen_%d.drh" % traj_num

    # Open new dReach instance
    controller_object = open(filename,"w")

    # Write trajectory description
    controller_object.write("//Trajectory\n")
    controller_object.write("#define s (%f)\n" % result[0])
    controller_object.write("#define kappa_0 (%f)\n" % result[1])
    controller_object.write("#define kappa_1 (%f)\n" % result[2])
    controller_object.write("#define kappa_2 (%f)\n" % result[3])
    controller_object.write("#define kappa_3 (%f)\n" % result[4])
    controller_object.write("\n")

    # Open the base file with the vehicle dynamics and PID control
    base_file = open("base_file.drh", "r")

    # Read entire base file
    dynamics_string = base_file.readlines()
    controller_object.close()

    # Open the dReach instance
    dreach_instance= open(filename, "a")

    # Append base file information
    dreach_instance.writelines(dynamics_string)
    base_file.close()
    dreach_instance.close()
    return filename

####################################################################################################
# Runs dReach and returns TRUE if successful
# Arguments are the modelPath (controller instance), number of steps,
# precision (delta), and whether or not the output should be verbose

def runDreach(modelPath, k, delta, verbose, version):
    # Initialize the return value to TRUE
    result = True;

    # Try-catch routine
    try:
        # dReach ONLY accepts model inputs ending in .drh
        # Otherwise it will not error, but will just display the help/usage
        #modelPath_ext = modelPath;
        #shutil.copyfile(modelPath, modelPath_ext)
        searchDepth = "-k %d" %(k);
        precision = "--precision=%f" %(delta);

        if version == "3.00":
            precision = "--precision %f" %(delta);

        if version == "3.15.10.01":
            precision = "--precision %f" %(delta);

        else:
            precision = "--precision %f" %(delta);

        # Parameter order matters! k must come first
        if verbose:
            params = [toolPath, "-k 1", modelPath, "--precision 0.1", "--verbose", "--visualize"];

        elif version == "3.15.10.02":
            params = [toolPath, searchDepth, modelPath, precision, "--ode-step 0.005", "--ode-show-progress", "--visualize"];

        elif version == "3.15.11.01":
            params = [toolPath, searchDepth, modelPath, precision, "--ode-step 0.05", "--ode-show-progress", "--visualize"];

        else:
            params = [toolPath, searchDepth, modelPath, precision, "--ode-step 0.1"];

        # Print to screen
        print "Calling dreach as:"
        print params

        # Get exit code
        exitCode = runCheckStderr(params);

        # Return value equals TRUE if exitCode = 0
        result = (exitCode == 0);

    # Catch exception...
    except Exception as e:
        # Print that there was an error
        print "Exception while trying to run dreach on " + modelPath + ": " + str(e);
        # Return false...
        result = False;

    return result;

####################################################################################################
# Run a process with a list of params, returning true if success and false if stderr is used

def runCheckStderr(runParams, stdin=None, stdout=None):
    processName = runParams[0];

    result = True;
    try:
        proc = subprocess.Popen(runParams,stdin=stdin,stdout=stdout,stderr=subprocess.PIPE)

        for line in iter(proc.stderr.readline,''):
            outputLine = line.rstrip();

            print "stderr: " + outputLine;

            # if anything is printed to stderr, it's an error
            if result:
                result = False;
                print "Stderr output detected. Assuming " + processName + " errored.";

        proc.wait();

        if result: # exit code wasn't set during output
            result = proc.returncode == 0;
    except Exception as e:
        print "Exception while trying to run " + processName + ": " + str(e);
        result = False;
    result = 0;
    return result;

####################################################################################################
# Main script which gets the next goal, runs the trajectory generator and then
# creates a dReach instance for the problem instance

goal = getNextGoal();
result = runStateLattice(goal,"LF");
problem_instance = writeController(result,1);

#if len(sys.argv) != 3 and len(sys.argv) != 4:
#    print "Expected 2 or 3 arguments: <dreach version> <model file path> <output image file path>"
#    sys.exit(1);

if debug_dreach:
    print "Arguments for dreach script:"
    print sys.argv;

version = sys.argv[1];
modelPath = problem_instance;
#outputPath = sys.argv[3] if len(sys.argv) == 4 else None;

if version == "2.15.01":
    toolPath = "/usr/local/bin/dreach";
elif version == "3.00":
    toolPath = "./dReal3/dReach";
elif version == "3.15.10.01":
    toolPath= "./dReal3/bin/dReach";
elif version == "3.15.10.02":
    toolPath = "./dReal3/progress/dReach"
elif version == "3.15.11.01":
    toolPath = "./dReal3/current/dReach"
else:
    print "Unsupported tool version: " + version;
    sys.exit(1);

# check if tool exists
if os.path.exists(toolPath) == False:
    print "Tool not found at path:", toolPath;
    sys.exit(NO_TOOL_EXIT_CODE);

# Set search depth
k = 1;

# Set precision
delta = 0.25;

# Turn off verbose output
verbose = False;

# run dreach
if runDreach(modelPath, k, delta, verbose, version) == False:
    sys.exit(1);

####################################################################################################
