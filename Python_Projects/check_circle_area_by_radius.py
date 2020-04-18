#Area of the circle = pi*radius**2		Pr^2
print("\n[Check for the Area of a circle by its radius]\n")

#Import pi from math module
from math import pi

#ask for and set radius
radius = float(input("Circle Radius (cm) ? : "))

#area calculation
circle_area = pi * radius ** 2

#print string r = radius
print("Radius = " + str(radius) + "cm")

#print string Area = circle_area 
print("Circle Area = " + str("%.2f" % circle_area) + "cm²")

#
#
