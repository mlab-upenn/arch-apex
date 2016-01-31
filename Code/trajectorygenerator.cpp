#include "libtraj_gen_v2.h"
#include <iostream>

using namespace std;
//extern double result0;
//extern double result1;
//extern double result2;
//extern double result3;
//extern double result4;
double * trajectoryGenerator(double sx, double sy, double theta, double v, double kappa)
{

#ifdef DEBUG
    cout << "Function: main()"<< endl;
#endif
    static double result[4];
// Set velocity
    double v_0=0.10;

// Initialize convergence criteria to false
    int convergence = 0;


// Set goal vector
    union State goal;
    goal.sx = sx;
    goal.sy = sy;
    goal.theta = theta;
    goal.v = v;
    goal.kappa = kappa;


// Initialize and set current state vector
    union State veh;
    veh.sx = 0.0;
    veh.sy = 0.0;
    veh.theta = 0.0;
    veh.v = v;
    veh.kappa = 0.0;


// Initialize next state
    union State veh_next;
    veh_next.sx = 0.0;
    veh_next.sy = 0.0;
    veh_next.theta = 0.0;
    veh_next.v = 0.00;
    veh_next.kappa = 0.0;


// Initialize parameters as a function of init and goal vectors
    union Spline curvature;
    curvature = initParams(veh, goal);

 // Initialize iteration counter
    int iteration = 0;

// Set timestep
    double dt = step_size;

// While loop for computing trajectory parameters
    while(convergence == 0 && iteration<10)
    {

    // Set time horizon
        double horizon = curvature.s/v_0;

    // Run motion model
        veh_next = motionModel(veh, goal, curvature, dt, horizon, 0);

    // Determine convergence criteria
        convergence = checkConvergence(veh_next, goal);

    // If the motion model doesn't get us to the goal compute new parameters
        if(convergence==0)
        {
        // Update parameters
            curvature = generateCorrection(veh, veh_next, goal, curvature, dt, horizon);
            iteration++;
            if(curvature.success==FALSE)
            {
                break;
            }

        #ifdef ONE_ITER
            convergence = 1;
        #endif
        }    
    }

    if(convergence==0)
    {
        cout << "Not Converged"<< endl;
    }

    else
    {
        cout << "Converged in "<<iteration<<" iterations"<< endl;

    #ifdef LOG_OUTPUT
    // Set time horizon
        double horizon = curvature.s/v_0;
    // Run motion model and log data for plotting
        veh_next = motionModel(veh, goal, curvature, 0.1, horizon, 1);
        //fmm_sx<<"0.0 \n";
        //fmm_sy<<"0.0 \n";
    #endif
    }
    result[0] = curvature.s;
    result[1] = curvature.kappa_0;
    result[2] = curvature.kappa_1;
    result[3] = curvature.kappa_2;
    result[4] = curvature.kappa_3;
    //cout << result[0];
    return result;
}

