p1 := plot::Point2d(-1, sin(a), a = 0..PI, Color = RGB::Red, PointSize = 5*unit::mm, TimeBegin = 0, TimeEnd = 5):
p2 := plot::Point2d(0, sin(a), a = 0..PI, Color = RGB::Green, PointSize = 5*unit::mm, TimeBegin = 6, TimeEnd = 12):
p3 := plot::Point2d(1, sin(a), a = 0..PI, Color = RGB::Blue, PointSize = 5*unit::mm, TimeBegin = 9, TimeEnd = 15):
plot(p1, p2, p3)