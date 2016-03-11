
add_library(lcm_windows WinLCM.cpp WinPorting.cpp)

pods_install_libraries(lcm_windows)
pods_install_headers(WinPorting.h DESTINATION lcm)
