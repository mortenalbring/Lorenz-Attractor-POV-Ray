# Lorenz Attractor rendering in POV-Ray

POV-Ray is is a high-quality, free software tool for creating three-dimensional graphics. Available for download here: 
http://www.povray.org/

The Lorenz attractor is a simplified model of convection of a gas within a confined space. This very simple model results in some very interesting motion, an example of deterministic chaos. 
A chaotic system is very sensitive to initial conditions and the system rapidly diverges. 

The system is described by three coupled non-linear differential equations:

dx / dt = a (y - x)

dy / dt = x (b - z) - y

dz / dt = xy - cz

where a is the *Prandtl number* representing ratio of fluid viscosity to thermal conductivity
b is the *Rayleigh number* representing the difference in temperature between the top and bottom of the box
c is the ratio of the width to height of the box

Commonly used constants are a = 10, b = 28 and c = 8/3.

This repository contains the POV-Ray code for rendering the Lorenz attractor, and producing an animation of the attractor building up over time to show the chaotic behaviour.


A video of the rendered animation can be found here: https://www.youtube.com/watch?v=6y7HPqlL3J4

![gif of Lorenz animation](![http://i.imgur.com/yGYRkQ1.gifv])
