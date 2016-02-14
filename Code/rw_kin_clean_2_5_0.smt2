(set-logic QF_NRA_ODE)
(declare-fun waypointy () Real)
(declare-fun waypointx () Real)
(declare-fun v () Real)
(declare-fun tau () Real)
(declare-fun sy_d_spline () Real)
(declare-fun sy_d () Real)
(declare-fun sy_0 () Real)
(declare-fun sy () Real)
(declare-fun sx_d_spline () Real)
(declare-fun sx_d () Real)
(declare-fun sx_0 () Real)
(declare-fun sx () Real)
(declare-fun simtime () Real)
(declare-fun schedtime () Real)
(declare-fun lookahead () Real)
(declare-fun kappa_d_spline () Real)
(declare-fun Psi_dot_d_spline () Real)
(declare-fun Psi_d_spline () Real)
(declare-fun Psi_d () Real)
(declare-fun waypointy_0_0 () Real)
(declare-fun waypointy_0_t () Real)
(declare-fun waypointy_1_0 () Real)
(declare-fun waypointy_1_t () Real)
(declare-fun waypointy_2_0 () Real)
(declare-fun waypointy_2_t () Real)
(declare-fun waypointy_3_0 () Real)
(declare-fun waypointy_3_t () Real)
(declare-fun waypointy_4_0 () Real)
(declare-fun waypointy_4_t () Real)
(declare-fun waypointy_5_0 () Real)
(declare-fun waypointy_5_t () Real)
(declare-fun waypointx_0_0 () Real)
(declare-fun waypointx_0_t () Real)
(declare-fun waypointx_1_0 () Real)
(declare-fun waypointx_1_t () Real)
(declare-fun waypointx_2_0 () Real)
(declare-fun waypointx_2_t () Real)
(declare-fun waypointx_3_0 () Real)
(declare-fun waypointx_3_t () Real)
(declare-fun waypointx_4_0 () Real)
(declare-fun waypointx_4_t () Real)
(declare-fun waypointx_5_0 () Real)
(declare-fun waypointx_5_t () Real)
(declare-fun v_0_0 () Real)
(declare-fun v_0_t () Real)
(declare-fun v_1_0 () Real)
(declare-fun v_1_t () Real)
(declare-fun v_2_0 () Real)
(declare-fun v_2_t () Real)
(declare-fun v_3_0 () Real)
(declare-fun v_3_t () Real)
(declare-fun v_4_0 () Real)
(declare-fun v_4_t () Real)
(declare-fun v_5_0 () Real)
(declare-fun v_5_t () Real)
(declare-fun tau_0_0 () Real)
(declare-fun tau_0_t () Real)
(declare-fun tau_1_0 () Real)
(declare-fun tau_1_t () Real)
(declare-fun tau_2_0 () Real)
(declare-fun tau_2_t () Real)
(declare-fun tau_3_0 () Real)
(declare-fun tau_3_t () Real)
(declare-fun tau_4_0 () Real)
(declare-fun tau_4_t () Real)
(declare-fun tau_5_0 () Real)
(declare-fun tau_5_t () Real)
(declare-fun sy_d_spline_0_0 () Real)
(declare-fun sy_d_spline_0_t () Real)
(declare-fun sy_d_spline_1_0 () Real)
(declare-fun sy_d_spline_1_t () Real)
(declare-fun sy_d_spline_2_0 () Real)
(declare-fun sy_d_spline_2_t () Real)
(declare-fun sy_d_spline_3_0 () Real)
(declare-fun sy_d_spline_3_t () Real)
(declare-fun sy_d_spline_4_0 () Real)
(declare-fun sy_d_spline_4_t () Real)
(declare-fun sy_d_spline_5_0 () Real)
(declare-fun sy_d_spline_5_t () Real)
(declare-fun sy_d_0_0 () Real)
(declare-fun sy_d_0_t () Real)
(declare-fun sy_d_1_0 () Real)
(declare-fun sy_d_1_t () Real)
(declare-fun sy_d_2_0 () Real)
(declare-fun sy_d_2_t () Real)
(declare-fun sy_d_3_0 () Real)
(declare-fun sy_d_3_t () Real)
(declare-fun sy_d_4_0 () Real)
(declare-fun sy_d_4_t () Real)
(declare-fun sy_d_5_0 () Real)
(declare-fun sy_d_5_t () Real)
(declare-fun sy_0_0_0 () Real)
(declare-fun sy_0_0_t () Real)
(declare-fun sy_0_1_0 () Real)
(declare-fun sy_0_1_t () Real)
(declare-fun sy_0_2_0 () Real)
(declare-fun sy_0_2_t () Real)
(declare-fun sy_0_3_0 () Real)
(declare-fun sy_0_3_t () Real)
(declare-fun sy_0_4_0 () Real)
(declare-fun sy_0_4_t () Real)
(declare-fun sy_0_5_0 () Real)
(declare-fun sy_0_5_t () Real)
(declare-fun sy_0_0 () Real)
(declare-fun sy_0_t () Real)
(declare-fun sy_1_0 () Real)
(declare-fun sy_1_t () Real)
(declare-fun sy_2_0 () Real)
(declare-fun sy_2_t () Real)
(declare-fun sy_3_0 () Real)
(declare-fun sy_3_t () Real)
(declare-fun sy_4_0 () Real)
(declare-fun sy_4_t () Real)
(declare-fun sy_5_0 () Real)
(declare-fun sy_5_t () Real)
(declare-fun sx_d_spline_0_0 () Real)
(declare-fun sx_d_spline_0_t () Real)
(declare-fun sx_d_spline_1_0 () Real)
(declare-fun sx_d_spline_1_t () Real)
(declare-fun sx_d_spline_2_0 () Real)
(declare-fun sx_d_spline_2_t () Real)
(declare-fun sx_d_spline_3_0 () Real)
(declare-fun sx_d_spline_3_t () Real)
(declare-fun sx_d_spline_4_0 () Real)
(declare-fun sx_d_spline_4_t () Real)
(declare-fun sx_d_spline_5_0 () Real)
(declare-fun sx_d_spline_5_t () Real)
(declare-fun sx_d_0_0 () Real)
(declare-fun sx_d_0_t () Real)
(declare-fun sx_d_1_0 () Real)
(declare-fun sx_d_1_t () Real)
(declare-fun sx_d_2_0 () Real)
(declare-fun sx_d_2_t () Real)
(declare-fun sx_d_3_0 () Real)
(declare-fun sx_d_3_t () Real)
(declare-fun sx_d_4_0 () Real)
(declare-fun sx_d_4_t () Real)
(declare-fun sx_d_5_0 () Real)
(declare-fun sx_d_5_t () Real)
(declare-fun sx_0_0_0 () Real)
(declare-fun sx_0_0_t () Real)
(declare-fun sx_0_1_0 () Real)
(declare-fun sx_0_1_t () Real)
(declare-fun sx_0_2_0 () Real)
(declare-fun sx_0_2_t () Real)
(declare-fun sx_0_3_0 () Real)
(declare-fun sx_0_3_t () Real)
(declare-fun sx_0_4_0 () Real)
(declare-fun sx_0_4_t () Real)
(declare-fun sx_0_5_0 () Real)
(declare-fun sx_0_5_t () Real)
(declare-fun sx_0_0 () Real)
(declare-fun sx_0_t () Real)
(declare-fun sx_1_0 () Real)
(declare-fun sx_1_t () Real)
(declare-fun sx_2_0 () Real)
(declare-fun sx_2_t () Real)
(declare-fun sx_3_0 () Real)
(declare-fun sx_3_t () Real)
(declare-fun sx_4_0 () Real)
(declare-fun sx_4_t () Real)
(declare-fun sx_5_0 () Real)
(declare-fun sx_5_t () Real)
(declare-fun simtime_0_0 () Real)
(declare-fun simtime_0_t () Real)
(declare-fun simtime_1_0 () Real)
(declare-fun simtime_1_t () Real)
(declare-fun simtime_2_0 () Real)
(declare-fun simtime_2_t () Real)
(declare-fun simtime_3_0 () Real)
(declare-fun simtime_3_t () Real)
(declare-fun simtime_4_0 () Real)
(declare-fun simtime_4_t () Real)
(declare-fun simtime_5_0 () Real)
(declare-fun simtime_5_t () Real)
(declare-fun schedtime_0_0 () Real)
(declare-fun schedtime_0_t () Real)
(declare-fun schedtime_1_0 () Real)
(declare-fun schedtime_1_t () Real)
(declare-fun schedtime_2_0 () Real)
(declare-fun schedtime_2_t () Real)
(declare-fun schedtime_3_0 () Real)
(declare-fun schedtime_3_t () Real)
(declare-fun schedtime_4_0 () Real)
(declare-fun schedtime_4_t () Real)
(declare-fun schedtime_5_0 () Real)
(declare-fun schedtime_5_t () Real)
(declare-fun lookahead_0_0 () Real)
(declare-fun lookahead_0_t () Real)
(declare-fun lookahead_1_0 () Real)
(declare-fun lookahead_1_t () Real)
(declare-fun lookahead_2_0 () Real)
(declare-fun lookahead_2_t () Real)
(declare-fun lookahead_3_0 () Real)
(declare-fun lookahead_3_t () Real)
(declare-fun lookahead_4_0 () Real)
(declare-fun lookahead_4_t () Real)
(declare-fun lookahead_5_0 () Real)
(declare-fun lookahead_5_t () Real)
(declare-fun kappa_d_spline_0_0 () Real)
(declare-fun kappa_d_spline_0_t () Real)
(declare-fun kappa_d_spline_1_0 () Real)
(declare-fun kappa_d_spline_1_t () Real)
(declare-fun kappa_d_spline_2_0 () Real)
(declare-fun kappa_d_spline_2_t () Real)
(declare-fun kappa_d_spline_3_0 () Real)
(declare-fun kappa_d_spline_3_t () Real)
(declare-fun kappa_d_spline_4_0 () Real)
(declare-fun kappa_d_spline_4_t () Real)
(declare-fun kappa_d_spline_5_0 () Real)
(declare-fun kappa_d_spline_5_t () Real)
(declare-fun Psi_dot_d_spline_0_0 () Real)
(declare-fun Psi_dot_d_spline_0_t () Real)
(declare-fun Psi_dot_d_spline_1_0 () Real)
(declare-fun Psi_dot_d_spline_1_t () Real)
(declare-fun Psi_dot_d_spline_2_0 () Real)
(declare-fun Psi_dot_d_spline_2_t () Real)
(declare-fun Psi_dot_d_spline_3_0 () Real)
(declare-fun Psi_dot_d_spline_3_t () Real)
(declare-fun Psi_dot_d_spline_4_0 () Real)
(declare-fun Psi_dot_d_spline_4_t () Real)
(declare-fun Psi_dot_d_spline_5_0 () Real)
(declare-fun Psi_dot_d_spline_5_t () Real)
(declare-fun Psi_d_spline_0_0 () Real)
(declare-fun Psi_d_spline_0_t () Real)
(declare-fun Psi_d_spline_1_0 () Real)
(declare-fun Psi_d_spline_1_t () Real)
(declare-fun Psi_d_spline_2_0 () Real)
(declare-fun Psi_d_spline_2_t () Real)
(declare-fun Psi_d_spline_3_0 () Real)
(declare-fun Psi_d_spline_3_t () Real)
(declare-fun Psi_d_spline_4_0 () Real)
(declare-fun Psi_d_spline_4_t () Real)
(declare-fun Psi_d_spline_5_0 () Real)
(declare-fun Psi_d_spline_5_t () Real)
(declare-fun Psi_d_0_0 () Real)
(declare-fun Psi_d_0_t () Real)
(declare-fun Psi_d_1_0 () Real)
(declare-fun Psi_d_1_t () Real)
(declare-fun Psi_d_2_0 () Real)
(declare-fun Psi_d_2_t () Real)
(declare-fun Psi_d_3_0 () Real)
(declare-fun Psi_d_3_t () Real)
(declare-fun Psi_d_4_0 () Real)
(declare-fun Psi_d_4_t () Real)
(declare-fun Psi_d_5_0 () Real)
(declare-fun Psi_d_5_t () Real)
(declare-fun time_0 () Real)
(declare-fun time_1 () Real)
(declare-fun time_2 () Real)
(declare-fun time_3 () Real)
(declare-fun time_4 () Real)
(declare-fun time_5 () Real)
(declare-fun mode_0 () Real)
(declare-fun mode_1 () Real)
(declare-fun mode_2 () Real)
(declare-fun mode_3 () Real)
(declare-fun mode_4 () Real)
(declare-fun mode_5 () Real)
(define-ode flow_1 ((= d/dt[Psi_d] (/ -11.11 (/ (* (^ (+ (* (- waypointx sx_0) (- waypointx sx_0)) (* (- waypointy sy_0) (- waypointy sy_0))) 0.5) (^ (+ (* (- waypointx sx_0) (- waypointx sx_0)) (* (- waypointy sy_0) (- waypointy sy_0))) 0.5)) (* 2 (- waypointx sx_0))))) (= d/dt[Psi_d_spline] 0) (= d/dt[Psi_dot_d_spline] 0) (= d/dt[kappa_d_spline] 0) (= d/dt[lookahead] 0) (= d/dt[schedtime] 1) (= d/dt[simtime] 0) (= d/dt[sx] (* v (cos Psi_d))) (= d/dt[sx_0] 0) (= d/dt[sx_d] (* 11.11 (cos Psi_d))) (= d/dt[sx_d_spline] 0) (= d/dt[sy] (* v (sin Psi_d))) (= d/dt[sy_0] 0) (= d/dt[sy_d] (* 11.11 (sin Psi_d))) (= d/dt[sy_d_spline] 0) (= d/dt[tau] 1) (= d/dt[v] (+ (* 1 (+ (* (cos Psi_d) (- sx_d sx)) (* (sin Psi_d) (- sy_d sy)))) (* 10 (- 11.11 v)))) (= d/dt[waypointx] 0) (= d/dt[waypointy] 0)))
(define-ode flow_2 ((= d/dt[Psi_d] 0) (= d/dt[Psi_d_spline] (* 11.11 kappa_d_spline)) (= d/dt[Psi_dot_d_spline] (* 11.11 (+ (+ (* (/ (* -0.5 (+ (- (+ (* -2 0) (* 11 0)) (* 18 0.006046)) (* 9 -0.000322))) 33.8316) 11.11) (* (* (* (* 2 (/ (* 4.5 (+ (- (+ 0 (* 2 0)) (* 5 0.006046)) (* 4 -0.000322))) (* 33.8316 33.8316))) 11.11) 11.11) simtime)) (* (* (* (* (* (* 3 (/ (* -4.5 (+ (- (+ 0 0) (* 3 0.006046)) (* 3 -0.000322))) (* (* 33.8316 33.8316) 33.8316))) 11.11) 11.11) 11.11) simtime) simtime)))) (= d/dt[kappa_d_spline] (+ (+ (* (/ (* -0.5 (+ (- (+ (* -2 0) (* 11 0)) (* 18 0.006046)) (* 9 -0.000322))) 33.8316) 11.11) (* (* (* (* 2 (/ (* 4.5 (+ (- (+ 0 (* 2 0)) (* 5 0.006046)) (* 4 -0.000322))) (* 33.8316 33.8316))) 11.11) 11.11) simtime)) (* (* (* (* (* (* 3 (/ (* -4.5 (+ (- (+ 0 0) (* 3 0.006046)) (* 3 -0.000322))) (* (* 33.8316 33.8316) 33.8316))) 11.11) 11.11) 11.11) simtime) simtime))) (= d/dt[lookahead] 0) (= d/dt[schedtime] 0) (= d/dt[simtime] 1) (= d/dt[sx] 0) (= d/dt[sx_0] 0) (= d/dt[sx_d] 0) (= d/dt[sx_d_spline] (* 11.11 (cos Psi_d_spline))) (= d/dt[sy] 0) (= d/dt[sy_0] 0) (= d/dt[sy_d] 0) (= d/dt[sy_d_spline] (* 11.11 (sin Psi_d_spline))) (= d/dt[tau] 0) (= d/dt[v] 0) (= d/dt[waypointx] 0) (= d/dt[waypointy] 0)))
(assert (<= -10 waypointy_0_0))
(assert (<= waypointy_0_0 10))
(assert (<= -10 waypointy_0_t))
(assert (<= waypointy_0_t 10))
(assert (<= -10 waypointy_1_0))
(assert (<= waypointy_1_0 10))
(assert (<= -10 waypointy_1_t))
(assert (<= waypointy_1_t 10))
(assert (<= -10 waypointy_2_0))
(assert (<= waypointy_2_0 10))
(assert (<= -10 waypointy_2_t))
(assert (<= waypointy_2_t 10))
(assert (<= -10 waypointy_3_0))
(assert (<= waypointy_3_0 10))
(assert (<= -10 waypointy_3_t))
(assert (<= waypointy_3_t 10))
(assert (<= -10 waypointy_4_0))
(assert (<= waypointy_4_0 10))
(assert (<= -10 waypointy_4_t))
(assert (<= waypointy_4_t 10))
(assert (<= -10 waypointy_5_0))
(assert (<= waypointy_5_0 10))
(assert (<= -10 waypointy_5_t))
(assert (<= waypointy_5_t 10))
(assert (<= 0 waypointx_0_0))
(assert (<= waypointx_0_0 35))
(assert (<= 0 waypointx_0_t))
(assert (<= waypointx_0_t 35))
(assert (<= 0 waypointx_1_0))
(assert (<= waypointx_1_0 35))
(assert (<= 0 waypointx_1_t))
(assert (<= waypointx_1_t 35))
(assert (<= 0 waypointx_2_0))
(assert (<= waypointx_2_0 35))
(assert (<= 0 waypointx_2_t))
(assert (<= waypointx_2_t 35))
(assert (<= 0 waypointx_3_0))
(assert (<= waypointx_3_0 35))
(assert (<= 0 waypointx_3_t))
(assert (<= waypointx_3_t 35))
(assert (<= 0 waypointx_4_0))
(assert (<= waypointx_4_0 35))
(assert (<= 0 waypointx_4_t))
(assert (<= waypointx_4_t 35))
(assert (<= 0 waypointx_5_0))
(assert (<= waypointx_5_0 35))
(assert (<= 0 waypointx_5_t))
(assert (<= waypointx_5_t 35))
(assert (<= 6 v_0_0))
(assert (<= v_0_0 12))
(assert (<= 6 v_0_t))
(assert (<= v_0_t 12))
(assert (<= 6 v_1_0))
(assert (<= v_1_0 12))
(assert (<= 6 v_1_t))
(assert (<= v_1_t 12))
(assert (<= 6 v_2_0))
(assert (<= v_2_0 12))
(assert (<= 6 v_2_t))
(assert (<= v_2_t 12))
(assert (<= 6 v_3_0))
(assert (<= v_3_0 12))
(assert (<= 6 v_3_t))
(assert (<= v_3_t 12))
(assert (<= 6 v_4_0))
(assert (<= v_4_0 12))
(assert (<= 6 v_4_t))
(assert (<= v_4_t 12))
(assert (<= 6 v_5_0))
(assert (<= v_5_0 12))
(assert (<= 6 v_5_t))
(assert (<= v_5_t 12))
(assert (<= 0 tau_0_0))
(assert (<= tau_0_0 2))
(assert (<= 0 tau_0_t))
(assert (<= tau_0_t 2))
(assert (<= 0 tau_1_0))
(assert (<= tau_1_0 2))
(assert (<= 0 tau_1_t))
(assert (<= tau_1_t 2))
(assert (<= 0 tau_2_0))
(assert (<= tau_2_0 2))
(assert (<= 0 tau_2_t))
(assert (<= tau_2_t 2))
(assert (<= 0 tau_3_0))
(assert (<= tau_3_0 2))
(assert (<= 0 tau_3_t))
(assert (<= tau_3_t 2))
(assert (<= 0 tau_4_0))
(assert (<= tau_4_0 2))
(assert (<= 0 tau_4_t))
(assert (<= tau_4_t 2))
(assert (<= 0 tau_5_0))
(assert (<= tau_5_0 2))
(assert (<= 0 tau_5_t))
(assert (<= tau_5_t 2))
(assert (<= -20 sy_d_spline_0_0))
(assert (<= sy_d_spline_0_0 20))
(assert (<= -20 sy_d_spline_0_t))
(assert (<= sy_d_spline_0_t 20))
(assert (<= -20 sy_d_spline_1_0))
(assert (<= sy_d_spline_1_0 20))
(assert (<= -20 sy_d_spline_1_t))
(assert (<= sy_d_spline_1_t 20))
(assert (<= -20 sy_d_spline_2_0))
(assert (<= sy_d_spline_2_0 20))
(assert (<= -20 sy_d_spline_2_t))
(assert (<= sy_d_spline_2_t 20))
(assert (<= -20 sy_d_spline_3_0))
(assert (<= sy_d_spline_3_0 20))
(assert (<= -20 sy_d_spline_3_t))
(assert (<= sy_d_spline_3_t 20))
(assert (<= -20 sy_d_spline_4_0))
(assert (<= sy_d_spline_4_0 20))
(assert (<= -20 sy_d_spline_4_t))
(assert (<= sy_d_spline_4_t 20))
(assert (<= -20 sy_d_spline_5_0))
(assert (<= sy_d_spline_5_0 20))
(assert (<= -20 sy_d_spline_5_t))
(assert (<= sy_d_spline_5_t 20))
(assert (<= -20 sy_d_0_0))
(assert (<= sy_d_0_0 20))
(assert (<= -20 sy_d_0_t))
(assert (<= sy_d_0_t 20))
(assert (<= -20 sy_d_1_0))
(assert (<= sy_d_1_0 20))
(assert (<= -20 sy_d_1_t))
(assert (<= sy_d_1_t 20))
(assert (<= -20 sy_d_2_0))
(assert (<= sy_d_2_0 20))
(assert (<= -20 sy_d_2_t))
(assert (<= sy_d_2_t 20))
(assert (<= -20 sy_d_3_0))
(assert (<= sy_d_3_0 20))
(assert (<= -20 sy_d_3_t))
(assert (<= sy_d_3_t 20))
(assert (<= -20 sy_d_4_0))
(assert (<= sy_d_4_0 20))
(assert (<= -20 sy_d_4_t))
(assert (<= sy_d_4_t 20))
(assert (<= -20 sy_d_5_0))
(assert (<= sy_d_5_0 20))
(assert (<= -20 sy_d_5_t))
(assert (<= sy_d_5_t 20))
(assert (<= -20 sy_0_0_0))
(assert (<= sy_0_0_0 20))
(assert (<= -20 sy_0_0_t))
(assert (<= sy_0_0_t 20))
(assert (<= -20 sy_0_1_0))
(assert (<= sy_0_1_0 20))
(assert (<= -20 sy_0_1_t))
(assert (<= sy_0_1_t 20))
(assert (<= -20 sy_0_2_0))
(assert (<= sy_0_2_0 20))
(assert (<= -20 sy_0_2_t))
(assert (<= sy_0_2_t 20))
(assert (<= -20 sy_0_3_0))
(assert (<= sy_0_3_0 20))
(assert (<= -20 sy_0_3_t))
(assert (<= sy_0_3_t 20))
(assert (<= -20 sy_0_4_0))
(assert (<= sy_0_4_0 20))
(assert (<= -20 sy_0_4_t))
(assert (<= sy_0_4_t 20))
(assert (<= -20 sy_0_5_0))
(assert (<= sy_0_5_0 20))
(assert (<= -20 sy_0_5_t))
(assert (<= sy_0_5_t 20))
(assert (<= -20 sy_0_0))
(assert (<= sy_0_0 20))
(assert (<= -20 sy_0_t))
(assert (<= sy_0_t 20))
(assert (<= -20 sy_1_0))
(assert (<= sy_1_0 20))
(assert (<= -20 sy_1_t))
(assert (<= sy_1_t 20))
(assert (<= -20 sy_2_0))
(assert (<= sy_2_0 20))
(assert (<= -20 sy_2_t))
(assert (<= sy_2_t 20))
(assert (<= -20 sy_3_0))
(assert (<= sy_3_0 20))
(assert (<= -20 sy_3_t))
(assert (<= sy_3_t 20))
(assert (<= -20 sy_4_0))
(assert (<= sy_4_0 20))
(assert (<= -20 sy_4_t))
(assert (<= sy_4_t 20))
(assert (<= -20 sy_5_0))
(assert (<= sy_5_0 20))
(assert (<= -20 sy_5_t))
(assert (<= sy_5_t 20))
(assert (<= -1 sx_d_spline_0_0))
(assert (<= sx_d_spline_0_0 100))
(assert (<= -1 sx_d_spline_0_t))
(assert (<= sx_d_spline_0_t 100))
(assert (<= -1 sx_d_spline_1_0))
(assert (<= sx_d_spline_1_0 100))
(assert (<= -1 sx_d_spline_1_t))
(assert (<= sx_d_spline_1_t 100))
(assert (<= -1 sx_d_spline_2_0))
(assert (<= sx_d_spline_2_0 100))
(assert (<= -1 sx_d_spline_2_t))
(assert (<= sx_d_spline_2_t 100))
(assert (<= -1 sx_d_spline_3_0))
(assert (<= sx_d_spline_3_0 100))
(assert (<= -1 sx_d_spline_3_t))
(assert (<= sx_d_spline_3_t 100))
(assert (<= -1 sx_d_spline_4_0))
(assert (<= sx_d_spline_4_0 100))
(assert (<= -1 sx_d_spline_4_t))
(assert (<= sx_d_spline_4_t 100))
(assert (<= -1 sx_d_spline_5_0))
(assert (<= sx_d_spline_5_0 100))
(assert (<= -1 sx_d_spline_5_t))
(assert (<= sx_d_spline_5_t 100))
(assert (<= -1 sx_d_0_0))
(assert (<= sx_d_0_0 100))
(assert (<= -1 sx_d_0_t))
(assert (<= sx_d_0_t 100))
(assert (<= -1 sx_d_1_0))
(assert (<= sx_d_1_0 100))
(assert (<= -1 sx_d_1_t))
(assert (<= sx_d_1_t 100))
(assert (<= -1 sx_d_2_0))
(assert (<= sx_d_2_0 100))
(assert (<= -1 sx_d_2_t))
(assert (<= sx_d_2_t 100))
(assert (<= -1 sx_d_3_0))
(assert (<= sx_d_3_0 100))
(assert (<= -1 sx_d_3_t))
(assert (<= sx_d_3_t 100))
(assert (<= -1 sx_d_4_0))
(assert (<= sx_d_4_0 100))
(assert (<= -1 sx_d_4_t))
(assert (<= sx_d_4_t 100))
(assert (<= -1 sx_d_5_0))
(assert (<= sx_d_5_0 100))
(assert (<= -1 sx_d_5_t))
(assert (<= sx_d_5_t 100))
(assert (<= 0 sx_0_0_0))
(assert (<= sx_0_0_0 100))
(assert (<= 0 sx_0_0_t))
(assert (<= sx_0_0_t 100))
(assert (<= 0 sx_0_1_0))
(assert (<= sx_0_1_0 100))
(assert (<= 0 sx_0_1_t))
(assert (<= sx_0_1_t 100))
(assert (<= 0 sx_0_2_0))
(assert (<= sx_0_2_0 100))
(assert (<= 0 sx_0_2_t))
(assert (<= sx_0_2_t 100))
(assert (<= 0 sx_0_3_0))
(assert (<= sx_0_3_0 100))
(assert (<= 0 sx_0_3_t))
(assert (<= sx_0_3_t 100))
(assert (<= 0 sx_0_4_0))
(assert (<= sx_0_4_0 100))
(assert (<= 0 sx_0_4_t))
(assert (<= sx_0_4_t 100))
(assert (<= 0 sx_0_5_0))
(assert (<= sx_0_5_0 100))
(assert (<= 0 sx_0_5_t))
(assert (<= sx_0_5_t 100))
(assert (<= -1 sx_0_0))
(assert (<= sx_0_0 100))
(assert (<= -1 sx_0_t))
(assert (<= sx_0_t 100))
(assert (<= -1 sx_1_0))
(assert (<= sx_1_0 100))
(assert (<= -1 sx_1_t))
(assert (<= sx_1_t 100))
(assert (<= -1 sx_2_0))
(assert (<= sx_2_0 100))
(assert (<= -1 sx_2_t))
(assert (<= sx_2_t 100))
(assert (<= -1 sx_3_0))
(assert (<= sx_3_0 100))
(assert (<= -1 sx_3_t))
(assert (<= sx_3_t 100))
(assert (<= -1 sx_4_0))
(assert (<= sx_4_0 100))
(assert (<= -1 sx_4_t))
(assert (<= sx_4_t 100))
(assert (<= -1 sx_5_0))
(assert (<= sx_5_0 100))
(assert (<= -1 sx_5_t))
(assert (<= sx_5_t 100))
(assert (<= 0 simtime_0_0))
(assert (<= simtime_0_0 10))
(assert (<= 0 simtime_0_t))
(assert (<= simtime_0_t 10))
(assert (<= 0 simtime_1_0))
(assert (<= simtime_1_0 10))
(assert (<= 0 simtime_1_t))
(assert (<= simtime_1_t 10))
(assert (<= 0 simtime_2_0))
(assert (<= simtime_2_0 10))
(assert (<= 0 simtime_2_t))
(assert (<= simtime_2_t 10))
(assert (<= 0 simtime_3_0))
(assert (<= simtime_3_0 10))
(assert (<= 0 simtime_3_t))
(assert (<= simtime_3_t 10))
(assert (<= 0 simtime_4_0))
(assert (<= simtime_4_0 10))
(assert (<= 0 simtime_4_t))
(assert (<= simtime_4_t 10))
(assert (<= 0 simtime_5_0))
(assert (<= simtime_5_0 10))
(assert (<= 0 simtime_5_t))
(assert (<= simtime_5_t 10))
(assert (<= 0 schedtime_0_0))
(assert (<= schedtime_0_0 2))
(assert (<= 0 schedtime_0_t))
(assert (<= schedtime_0_t 2))
(assert (<= 0 schedtime_1_0))
(assert (<= schedtime_1_0 2))
(assert (<= 0 schedtime_1_t))
(assert (<= schedtime_1_t 2))
(assert (<= 0 schedtime_2_0))
(assert (<= schedtime_2_0 2))
(assert (<= 0 schedtime_2_t))
(assert (<= schedtime_2_t 2))
(assert (<= 0 schedtime_3_0))
(assert (<= schedtime_3_0 2))
(assert (<= 0 schedtime_3_t))
(assert (<= schedtime_3_t 2))
(assert (<= 0 schedtime_4_0))
(assert (<= schedtime_4_0 2))
(assert (<= 0 schedtime_4_t))
(assert (<= schedtime_4_t 2))
(assert (<= 0 schedtime_5_0))
(assert (<= schedtime_5_0 2))
(assert (<= 0 schedtime_5_t))
(assert (<= schedtime_5_t 2))
(assert (<= 0 lookahead_0_0))
(assert (<= lookahead_0_0 10))
(assert (<= 0 lookahead_0_t))
(assert (<= lookahead_0_t 10))
(assert (<= 0 lookahead_1_0))
(assert (<= lookahead_1_0 10))
(assert (<= 0 lookahead_1_t))
(assert (<= lookahead_1_t 10))
(assert (<= 0 lookahead_2_0))
(assert (<= lookahead_2_0 10))
(assert (<= 0 lookahead_2_t))
(assert (<= lookahead_2_t 10))
(assert (<= 0 lookahead_3_0))
(assert (<= lookahead_3_0 10))
(assert (<= 0 lookahead_3_t))
(assert (<= lookahead_3_t 10))
(assert (<= 0 lookahead_4_0))
(assert (<= lookahead_4_0 10))
(assert (<= 0 lookahead_4_t))
(assert (<= lookahead_4_t 10))
(assert (<= 0 lookahead_5_0))
(assert (<= lookahead_5_0 10))
(assert (<= 0 lookahead_5_t))
(assert (<= lookahead_5_t 10))
(assert (<= -2 kappa_d_spline_0_0))
(assert (<= kappa_d_spline_0_0 2.06))
(assert (<= -2 kappa_d_spline_0_t))
(assert (<= kappa_d_spline_0_t 2.06))
(assert (<= -2 kappa_d_spline_1_0))
(assert (<= kappa_d_spline_1_0 2.06))
(assert (<= -2 kappa_d_spline_1_t))
(assert (<= kappa_d_spline_1_t 2.06))
(assert (<= -2 kappa_d_spline_2_0))
(assert (<= kappa_d_spline_2_0 2.06))
(assert (<= -2 kappa_d_spline_2_t))
(assert (<= kappa_d_spline_2_t 2.06))
(assert (<= -2 kappa_d_spline_3_0))
(assert (<= kappa_d_spline_3_0 2.06))
(assert (<= -2 kappa_d_spline_3_t))
(assert (<= kappa_d_spline_3_t 2.06))
(assert (<= -2 kappa_d_spline_4_0))
(assert (<= kappa_d_spline_4_0 2.06))
(assert (<= -2 kappa_d_spline_4_t))
(assert (<= kappa_d_spline_4_t 2.06))
(assert (<= -2 kappa_d_spline_5_0))
(assert (<= kappa_d_spline_5_0 2.06))
(assert (<= -2 kappa_d_spline_5_t))
(assert (<= kappa_d_spline_5_t 2.06))
(assert (<= -2 Psi_dot_d_spline_0_0))
(assert (<= Psi_dot_d_spline_0_0 2.08))
(assert (<= -2 Psi_dot_d_spline_0_t))
(assert (<= Psi_dot_d_spline_0_t 2.08))
(assert (<= -2 Psi_dot_d_spline_1_0))
(assert (<= Psi_dot_d_spline_1_0 2.08))
(assert (<= -2 Psi_dot_d_spline_1_t))
(assert (<= Psi_dot_d_spline_1_t 2.08))
(assert (<= -2 Psi_dot_d_spline_2_0))
(assert (<= Psi_dot_d_spline_2_0 2.08))
(assert (<= -2 Psi_dot_d_spline_2_t))
(assert (<= Psi_dot_d_spline_2_t 2.08))
(assert (<= -2 Psi_dot_d_spline_3_0))
(assert (<= Psi_dot_d_spline_3_0 2.08))
(assert (<= -2 Psi_dot_d_spline_3_t))
(assert (<= Psi_dot_d_spline_3_t 2.08))
(assert (<= -2 Psi_dot_d_spline_4_0))
(assert (<= Psi_dot_d_spline_4_0 2.08))
(assert (<= -2 Psi_dot_d_spline_4_t))
(assert (<= Psi_dot_d_spline_4_t 2.08))
(assert (<= -2 Psi_dot_d_spline_5_0))
(assert (<= Psi_dot_d_spline_5_0 2.08))
(assert (<= -2 Psi_dot_d_spline_5_t))
(assert (<= Psi_dot_d_spline_5_t 2.08))
(assert (<= -2 Psi_d_spline_0_0))
(assert (<= Psi_d_spline_0_0 2.07))
(assert (<= -2 Psi_d_spline_0_t))
(assert (<= Psi_d_spline_0_t 2.07))
(assert (<= -2 Psi_d_spline_1_0))
(assert (<= Psi_d_spline_1_0 2.07))
(assert (<= -2 Psi_d_spline_1_t))
(assert (<= Psi_d_spline_1_t 2.07))
(assert (<= -2 Psi_d_spline_2_0))
(assert (<= Psi_d_spline_2_0 2.07))
(assert (<= -2 Psi_d_spline_2_t))
(assert (<= Psi_d_spline_2_t 2.07))
(assert (<= -2 Psi_d_spline_3_0))
(assert (<= Psi_d_spline_3_0 2.07))
(assert (<= -2 Psi_d_spline_3_t))
(assert (<= Psi_d_spline_3_t 2.07))
(assert (<= -2 Psi_d_spline_4_0))
(assert (<= Psi_d_spline_4_0 2.07))
(assert (<= -2 Psi_d_spline_4_t))
(assert (<= Psi_d_spline_4_t 2.07))
(assert (<= -2 Psi_d_spline_5_0))
(assert (<= Psi_d_spline_5_0 2.07))
(assert (<= -2 Psi_d_spline_5_t))
(assert (<= Psi_d_spline_5_t 2.07))
(assert (<= -2 Psi_d_0_0))
(assert (<= Psi_d_0_0 2.07))
(assert (<= -2 Psi_d_0_t))
(assert (<= Psi_d_0_t 2.07))
(assert (<= -2 Psi_d_1_0))
(assert (<= Psi_d_1_0 2.07))
(assert (<= -2 Psi_d_1_t))
(assert (<= Psi_d_1_t 2.07))
(assert (<= -2 Psi_d_2_0))
(assert (<= Psi_d_2_0 2.07))
(assert (<= -2 Psi_d_2_t))
(assert (<= Psi_d_2_t 2.07))
(assert (<= -2 Psi_d_3_0))
(assert (<= Psi_d_3_0 2.07))
(assert (<= -2 Psi_d_3_t))
(assert (<= Psi_d_3_t 2.07))
(assert (<= -2 Psi_d_4_0))
(assert (<= Psi_d_4_0 2.07))
(assert (<= -2 Psi_d_4_t))
(assert (<= Psi_d_4_t 2.07))
(assert (<= -2 Psi_d_5_0))
(assert (<= Psi_d_5_0 2.07))
(assert (<= -2 Psi_d_5_t))
(assert (<= Psi_d_5_t 2.07))
(assert (<= 0 time_0 [0.000000]))
(assert (<= time_0 2 [0.000000]))
(assert (<= 0 time_1 [0.000000]))
(assert (<= time_1 2 [0.000000]))
(assert (<= 0 time_2 [0.000000]))
(assert (<= time_2 2 [0.000000]))
(assert (<= 0 time_3 [0.000000]))
(assert (<= time_3 2 [0.000000]))
(assert (<= 0 time_4 [0.000000]))
(assert (<= time_4 2 [0.000000]))
(assert (<= 0 time_5 [0.000000]))
(assert (<= time_5 2 [0.000000]))
(assert (<= 1 mode_0))
(assert (<= mode_0 2))
(assert (<= 1 mode_1))
(assert (<= mode_1 2))
(assert (<= 1 mode_2))
(assert (<= mode_2 2))
(assert (<= 1 mode_3))
(assert (<= mode_3 2))
(assert (<= 1 mode_4))
(assert (<= mode_4 2))
(assert (<= 1 mode_5))
(assert (<= mode_5 2))
(assert (and (and (= Psi_dot_d_spline_0_0 0) (= sy_d_spline_0_0 0) (= sx_d_spline_0_0 0) (= Psi_d_spline_0_0 0) (= kappa_d_spline_0_0 0) (= schedtime_0_0 0) (= simtime_0_0 0) (= lookahead_0_0 0.2) (= waypointy_0_0 0) (= waypointx_0_0 0) (= sy_d_0_0 0) (= sx_d_0_0 0) (= Psi_d_0_0 0) (= sy_0_0_0 sy_0_0) (= sx_0_0_0 sx_0_0) (= sy_0_0 0) (= sx_0_0 0) (= v_0_0 10.9) (= tau_0_0 0)) (= mode_0 2) (= waypointy_0_t (+ waypointy_0_0 (* 0 time_0))) (= waypointx_0_t (+ waypointx_0_0 (* 0 time_0))) (= v_0_t (+ v_0_0 (* 0 time_0))) (= tau_0_t (+ tau_0_0 (* 0 time_0))) (= sy_d_0_t (+ sy_d_0_0 (* 0 time_0))) (= sy_0_0_t (+ sy_0_0_0 (* 0 time_0))) (= sy_0_t (+ sy_0_0 (* 0 time_0))) (= sx_d_0_t (+ sx_d_0_0 (* 0 time_0))) (= sx_0_0_t (+ sx_0_0_0 (* 0 time_0))) (= sx_0_t (+ sx_0_0 (* 0 time_0))) (= simtime_0_t (+ simtime_0_0 (* 1 time_0))) (= schedtime_0_t (+ schedtime_0_0 (* 0 time_0))) (= lookahead_0_t (+ lookahead_0_0 (* 0 time_0))) (= Psi_d_0_t (+ Psi_d_0_0 (* 0 time_0))) (= [Psi_d_0_t Psi_d_spline_0_t Psi_dot_d_spline_0_t kappa_d_spline_0_t lookahead_0_t schedtime_0_t simtime_0_t sx_0_t sx_0_0_t sx_d_0_t sx_d_spline_0_t sy_0_t sy_0_0_t sy_d_0_t sy_d_spline_0_t tau_0_t v_0_t waypointx_0_t waypointy_0_t] (integral 0. time_0 [Psi_d_0_0 Psi_d_spline_0_0 Psi_dot_d_spline_0_0 kappa_d_spline_0_0 lookahead_0_0 schedtime_0_0 simtime_0_0 sx_0_0 sx_0_0_0 sx_d_0_0 sx_d_spline_0_0 sy_0_0 sy_0_0_0 sy_d_0_0 sy_d_spline_0_0 tau_0_0 v_0_0 waypointx_0_0 waypointy_0_0] flow_2)) (= mode_0 2) (= mode_1 1) (= simtime_0_t lookahead_0_t) (= sy_0_1_0 sy_0_t) (= sx_0_1_0 sx_0_t) (= Psi_dot_d_spline_1_0 0) (= sy_d_spline_1_0 0) (= sx_d_spline_1_0 0) (= Psi_d_spline_1_0 0) (= kappa_d_spline_1_0 0) (= lookahead_1_0 lookahead_0_t) (= schedtime_1_0 schedtime_0_t) (= simtime_1_0 0) (= waypointy_1_0 sy_d_spline_0_t) (= waypointx_1_0 sx_d_spline_0_t) (= sy_d_1_0 sy_d_0_t) (= sx_d_1_0 sx_d_0_t) (= Psi_d_1_0 Psi_d_0_t) (= sy_1_0 sy_0_t) (= sx_1_0 sx_0_t) (= v_1_0 v_0_t) (= tau_1_0 tau_0_t) (= waypointy_1_t (+ waypointy_1_0 (* 0 time_1))) (= waypointx_1_t (+ waypointx_1_0 (* 0 time_1))) (= tau_1_t (+ tau_1_0 (* 1 time_1))) (= sy_d_spline_1_t (+ sy_d_spline_1_0 (* 0 time_1))) (= sy_0_1_t (+ sy_0_1_0 (* 0 time_1))) (= sx_d_spline_1_t (+ sx_d_spline_1_0 (* 0 time_1))) (= sx_0_1_t (+ sx_0_1_0 (* 0 time_1))) (= simtime_1_t (+ simtime_1_0 (* 0 time_1))) (= schedtime_1_t (+ schedtime_1_0 (* 1 time_1))) (= lookahead_1_t (+ lookahead_1_0 (* 0 time_1))) (= kappa_d_spline_1_t (+ kappa_d_spline_1_0 (* 0 time_1))) (= Psi_dot_d_spline_1_t (+ Psi_dot_d_spline_1_0 (* 0 time_1))) (= Psi_d_spline_1_t (+ Psi_d_spline_1_0 (* 0 time_1))) (= [Psi_d_1_t Psi_d_spline_1_t Psi_dot_d_spline_1_t kappa_d_spline_1_t lookahead_1_t schedtime_1_t simtime_1_t sx_1_t sx_0_1_t sx_d_1_t sx_d_spline_1_t sy_1_t sy_0_1_t sy_d_1_t sy_d_spline_1_t tau_1_t v_1_t waypointx_1_t waypointy_1_t] (integral 0. time_1 [Psi_d_1_0 Psi_d_spline_1_0 Psi_dot_d_spline_1_0 kappa_d_spline_1_0 lookahead_1_0 schedtime_1_0 simtime_1_0 sx_1_0 sx_0_1_0 sx_d_1_0 sx_d_spline_1_0 sy_1_0 sy_0_1_0 sy_d_1_0 sy_d_spline_1_0 tau_1_0 v_1_0 waypointx_1_0 waypointy_1_0] flow_1)) (= mode_1 1) (= mode_2 2) (= schedtime_1_t 0.1) (= sy_0_2_0 sy_0_1_t) (= sx_0_2_0 sx_0_1_t) (= Psi_dot_d_spline_2_0 Psi_dot_d_spline_1_t) (= sy_d_spline_2_0 sy_d_spline_1_t) (= sx_d_spline_2_0 sx_d_spline_1_t) (= Psi_d_spline_2_0 Psi_d_spline_1_t) (= kappa_d_spline_2_0 kappa_d_spline_1_t) (= lookahead_2_0 (+ tau_1_t 0.2)) (= schedtime_2_0 0) (= simtime_2_0 simtime_1_t) (= waypointy_2_0 waypointy_1_t) (= waypointx_2_0 waypointx_1_t) (= sy_d_2_0 sy_d_1_t) (= sx_d_2_0 sx_d_1_t) (= Psi_d_2_0 Psi_d_1_t) (= sy_2_0 sy_1_t) (= sx_2_0 sx_1_t) (= v_2_0 v_1_t) (= tau_2_0 tau_1_t) (= waypointy_2_t (+ waypointy_2_0 (* 0 time_2))) (= waypointx_2_t (+ waypointx_2_0 (* 0 time_2))) (= v_2_t (+ v_2_0 (* 0 time_2))) (= tau_2_t (+ tau_2_0 (* 0 time_2))) (= sy_d_2_t (+ sy_d_2_0 (* 0 time_2))) (= sy_0_2_t (+ sy_0_2_0 (* 0 time_2))) (= sy_2_t (+ sy_2_0 (* 0 time_2))) (= sx_d_2_t (+ sx_d_2_0 (* 0 time_2))) (= sx_0_2_t (+ sx_0_2_0 (* 0 time_2))) (= sx_2_t (+ sx_2_0 (* 0 time_2))) (= simtime_2_t (+ simtime_2_0 (* 1 time_2))) (= schedtime_2_t (+ schedtime_2_0 (* 0 time_2))) (= lookahead_2_t (+ lookahead_2_0 (* 0 time_2))) (= Psi_d_2_t (+ Psi_d_2_0 (* 0 time_2))) (= [Psi_d_2_t Psi_d_spline_2_t Psi_dot_d_spline_2_t kappa_d_spline_2_t lookahead_2_t schedtime_2_t simtime_2_t sx_2_t sx_0_2_t sx_d_2_t sx_d_spline_2_t sy_2_t sy_0_2_t sy_d_2_t sy_d_spline_2_t tau_2_t v_2_t waypointx_2_t waypointy_2_t] (integral 0. time_2 [Psi_d_2_0 Psi_d_spline_2_0 Psi_dot_d_spline_2_0 kappa_d_spline_2_0 lookahead_2_0 schedtime_2_0 simtime_2_0 sx_2_0 sx_0_2_0 sx_d_2_0 sx_d_spline_2_0 sy_2_0 sy_0_2_0 sy_d_2_0 sy_d_spline_2_0 tau_2_0 v_2_0 waypointx_2_0 waypointy_2_0] flow_2)) (= mode_2 2) (= mode_3 1) (= simtime_2_t lookahead_2_t) (= sy_0_3_0 sy_2_t) (= sx_0_3_0 sx_2_t) (= Psi_dot_d_spline_3_0 0) (= sy_d_spline_3_0 0) (= sx_d_spline_3_0 0) (= Psi_d_spline_3_0 0) (= kappa_d_spline_3_0 0) (= lookahead_3_0 lookahead_2_t) (= schedtime_3_0 schedtime_2_t) (= simtime_3_0 0) (= waypointy_3_0 sy_d_spline_2_t) (= waypointx_3_0 sx_d_spline_2_t) (= sy_d_3_0 sy_d_2_t) (= sx_d_3_0 sx_d_2_t) (= Psi_d_3_0 Psi_d_2_t) (= sy_3_0 sy_2_t) (= sx_3_0 sx_2_t) (= v_3_0 v_2_t) (= tau_3_0 tau_2_t) (= waypointy_3_t (+ waypointy_3_0 (* 0 time_3))) (= waypointx_3_t (+ waypointx_3_0 (* 0 time_3))) (= tau_3_t (+ tau_3_0 (* 1 time_3))) (= sy_d_spline_3_t (+ sy_d_spline_3_0 (* 0 time_3))) (= sy_0_3_t (+ sy_0_3_0 (* 0 time_3))) (= sx_d_spline_3_t (+ sx_d_spline_3_0 (* 0 time_3))) (= sx_0_3_t (+ sx_0_3_0 (* 0 time_3))) (= simtime_3_t (+ simtime_3_0 (* 0 time_3))) (= schedtime_3_t (+ schedtime_3_0 (* 1 time_3))) (= lookahead_3_t (+ lookahead_3_0 (* 0 time_3))) (= kappa_d_spline_3_t (+ kappa_d_spline_3_0 (* 0 time_3))) (= Psi_dot_d_spline_3_t (+ Psi_dot_d_spline_3_0 (* 0 time_3))) (= Psi_d_spline_3_t (+ Psi_d_spline_3_0 (* 0 time_3))) (= [Psi_d_3_t Psi_d_spline_3_t Psi_dot_d_spline_3_t kappa_d_spline_3_t lookahead_3_t schedtime_3_t simtime_3_t sx_3_t sx_0_3_t sx_d_3_t sx_d_spline_3_t sy_3_t sy_0_3_t sy_d_3_t sy_d_spline_3_t tau_3_t v_3_t waypointx_3_t waypointy_3_t] (integral 0. time_3 [Psi_d_3_0 Psi_d_spline_3_0 Psi_dot_d_spline_3_0 kappa_d_spline_3_0 lookahead_3_0 schedtime_3_0 simtime_3_0 sx_3_0 sx_0_3_0 sx_d_3_0 sx_d_spline_3_0 sy_3_0 sy_0_3_0 sy_d_3_0 sy_d_spline_3_0 tau_3_0 v_3_0 waypointx_3_0 waypointy_3_0] flow_1)) (= mode_3 1) (= mode_4 2) (= schedtime_3_t 0.1) (= sy_0_4_0 sy_0_3_t) (= sx_0_4_0 sx_0_3_t) (= Psi_dot_d_spline_4_0 Psi_dot_d_spline_3_t) (= sy_d_spline_4_0 sy_d_spline_3_t) (= sx_d_spline_4_0 sx_d_spline_3_t) (= Psi_d_spline_4_0 Psi_d_spline_3_t) (= kappa_d_spline_4_0 kappa_d_spline_3_t) (= lookahead_4_0 (+ tau_3_t 0.2)) (= schedtime_4_0 0) (= simtime_4_0 simtime_3_t) (= waypointy_4_0 waypointy_3_t) (= waypointx_4_0 waypointx_3_t) (= sy_d_4_0 sy_d_3_t) (= sx_d_4_0 sx_d_3_t) (= Psi_d_4_0 Psi_d_3_t) (= sy_4_0 sy_3_t) (= sx_4_0 sx_3_t) (= v_4_0 v_3_t) (= tau_4_0 tau_3_t) (= waypointy_4_t (+ waypointy_4_0 (* 0 time_4))) (= waypointx_4_t (+ waypointx_4_0 (* 0 time_4))) (= v_4_t (+ v_4_0 (* 0 time_4))) (= tau_4_t (+ tau_4_0 (* 0 time_4))) (= sy_d_4_t (+ sy_d_4_0 (* 0 time_4))) (= sy_0_4_t (+ sy_0_4_0 (* 0 time_4))) (= sy_4_t (+ sy_4_0 (* 0 time_4))) (= sx_d_4_t (+ sx_d_4_0 (* 0 time_4))) (= sx_0_4_t (+ sx_0_4_0 (* 0 time_4))) (= sx_4_t (+ sx_4_0 (* 0 time_4))) (= simtime_4_t (+ simtime_4_0 (* 1 time_4))) (= schedtime_4_t (+ schedtime_4_0 (* 0 time_4))) (= lookahead_4_t (+ lookahead_4_0 (* 0 time_4))) (= Psi_d_4_t (+ Psi_d_4_0 (* 0 time_4))) (= [Psi_d_4_t Psi_d_spline_4_t Psi_dot_d_spline_4_t kappa_d_spline_4_t lookahead_4_t schedtime_4_t simtime_4_t sx_4_t sx_0_4_t sx_d_4_t sx_d_spline_4_t sy_4_t sy_0_4_t sy_d_4_t sy_d_spline_4_t tau_4_t v_4_t waypointx_4_t waypointy_4_t] (integral 0. time_4 [Psi_d_4_0 Psi_d_spline_4_0 Psi_dot_d_spline_4_0 kappa_d_spline_4_0 lookahead_4_0 schedtime_4_0 simtime_4_0 sx_4_0 sx_0_4_0 sx_d_4_0 sx_d_spline_4_0 sy_4_0 sy_0_4_0 sy_d_4_0 sy_d_spline_4_0 tau_4_0 v_4_0 waypointx_4_0 waypointy_4_0] flow_2)) (= mode_4 2) (= mode_5 1) (= simtime_4_t lookahead_4_t) (= sy_0_5_0 sy_4_t) (= sx_0_5_0 sx_4_t) (= Psi_dot_d_spline_5_0 0) (= sy_d_spline_5_0 0) (= sx_d_spline_5_0 0) (= Psi_d_spline_5_0 0) (= kappa_d_spline_5_0 0) (= lookahead_5_0 lookahead_4_t) (= schedtime_5_0 schedtime_4_t) (= simtime_5_0 0) (= waypointy_5_0 sy_d_spline_4_t) (= waypointx_5_0 sx_d_spline_4_t) (= sy_d_5_0 sy_d_4_t) (= sx_d_5_0 sx_d_4_t) (= Psi_d_5_0 Psi_d_4_t) (= sy_5_0 sy_4_t) (= sx_5_0 sx_4_t) (= v_5_0 v_4_t) (= tau_5_0 tau_4_t) (= waypointy_5_t (+ waypointy_5_0 (* 0 time_5))) (= waypointx_5_t (+ waypointx_5_0 (* 0 time_5))) (= tau_5_t (+ tau_5_0 (* 1 time_5))) (= sy_d_spline_5_t (+ sy_d_spline_5_0 (* 0 time_5))) (= sy_0_5_t (+ sy_0_5_0 (* 0 time_5))) (= sx_d_spline_5_t (+ sx_d_spline_5_0 (* 0 time_5))) (= sx_0_5_t (+ sx_0_5_0 (* 0 time_5))) (= simtime_5_t (+ simtime_5_0 (* 0 time_5))) (= schedtime_5_t (+ schedtime_5_0 (* 1 time_5))) (= lookahead_5_t (+ lookahead_5_0 (* 0 time_5))) (= kappa_d_spline_5_t (+ kappa_d_spline_5_0 (* 0 time_5))) (= Psi_dot_d_spline_5_t (+ Psi_dot_d_spline_5_0 (* 0 time_5))) (= Psi_d_spline_5_t (+ Psi_d_spline_5_0 (* 0 time_5))) (= [Psi_d_5_t Psi_d_spline_5_t Psi_dot_d_spline_5_t kappa_d_spline_5_t lookahead_5_t schedtime_5_t simtime_5_t sx_5_t sx_0_5_t sx_d_5_t sx_d_spline_5_t sy_5_t sy_0_5_t sy_d_5_t sy_d_spline_5_t tau_5_t v_5_t waypointx_5_t waypointy_5_t] (integral 0. time_5 [Psi_d_5_0 Psi_d_spline_5_0 Psi_dot_d_spline_5_0 kappa_d_spline_5_0 lookahead_5_0 schedtime_5_0 simtime_5_0 sx_5_0 sx_0_5_0 sx_d_5_0 sx_d_spline_5_0 sy_5_0 sy_0_5_0 sy_d_5_0 sy_d_spline_5_0 tau_5_0 v_5_0 waypointx_5_0 waypointy_5_0] flow_1)) (= mode_5 1) (= mode_5 1) (>= tau_5_t 0.48)))
(check-sat)
(exit)
