# Setup
import tkinter
import turtle

from turtle import Screen, Turtle



# Window
window = Screen() 			# Open window
window.setup(515,515)		# Window Size (Width x Height)
window.bgcolor("#000000") 	# Window background Color "black"

# Cursor
cursor = Turtle() 			# Create cursor
cursor.shape("triangle") 	# Cursor Shape
cursor.shapesize(1, 1, 0) 	# Cursor size 
cursor.color("#ff0000") 	# Cursor Color "Red"
cursor.speed(6) 			# Cursor speed

# Line
cursor.pencolor("#ffffff") 	# Line color "white"
cursor.pensize(2) 			# Line size (pixels)

# Pen position 
cursor.penup()				# Stop Drawing
cursor.setx(0)				# set X position 
cursor.sety(0)				# set Y position
cursor.pendown() 			# Start Drawing

# Movement Loop circle

# Movement Distance (pixels)
x = 35

for i in range(10):			# repeat (10 times)
						
	cursor.circle() 		# draw a circle (Pixels)
	
		


# EXIT
window.bye()				# Window closes

turtle.done()