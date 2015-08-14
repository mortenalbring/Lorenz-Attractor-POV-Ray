//Edward Lorenz was an American mathematician and pioneer of chaos theory. 
//Lorenz built mathematical models of the motion of air in the atmosphere. 
//His original model involved a set of 12 nonlinear differential equations and discovered complex 
//movements that were highly dependent upon the initial conditions of the system.
//He then looked for complex behaviour in simpler models. 
//He built a simple model of a gas in a solid rectangular box with a heat source at the bottom. 

//The macro below calculates the values for the Lorenz attractor and renders a small sphere at those points. 

#macro Lorenz(a, b, c, dT, Iter, x0, y0, z0, R) 
// a: the Prandtl number representing ratio of fluid viscosity to thermal conductivity
// b: the Rayleigh number representing the difference in temperature between the top and bottom of the box
// c: the ratio of the width to height of the box
// Iter: number of iterations
// dT: step length 
// X0, Y0, Z0: Initial position
// R: sphere radius     

    #local Count=0;
	#while (Count<Iter)
		#local x1=x0+dT*a*(y0-x0);
		#local y1=y0+dT*(x0*(b-z0)-y0);
        #local z1=z0+dT*(x0*y0-c*z0);		

        
        #if(Count < (Iter - 1500))	
            //For the last 1500 points, we want the spheres to have a slightly different colour to produce a 'trace'
    		sphere {
    		    <x1,y1,z1>, R
                pigment { 
                    rgb <1.0-(Count/Iter)*0.1,0.9-(Count/Iter)*0.5,0.8-(Count/Iter)*0.9>
                }
                finish { 
                    diffuse 0.7
                    ambient 0.9
                    specular 0.5
                    reflection { 
                        0.9  metallic 
                    } 
                }
            }
        #else
            sphere {
                <x1,y1,z1>, R
                pigment { 
                    rgb <(Count/Iter),(Count/Iter)*0.25,(Count/Iter)*0.25>
                }
                finish{
                    diffuse 0.7
                    ambient 0.9
                    specular 0.3
                    reflection { 
                        0.8  metallic 
                    } 
                }
            }
        #end                                             
                       
				
		#local Count=Count+1;
		#local x0=x1;
		#local y0=y1;
		#local z0=z1;
	#end
#end  



#macro LorenzPoint(a, b, c, dT, Iter, x0, y0, z0, R)
    #local Count=0;
	#while (Count<Iter)
		#local x1=x0+dT*a*(y0-x0);
		#local y1=y0+dT*(x0*(b-z0)-y0);
		#local z1=z0+dT*(x0*y0-c*z0);
		#local Count=Count+1;
		#local x0=x1;
		#local y0=y1;
		#local z0=z1;
	#end        
    sphere {
        <x1,y1,z1>, R
        pigment { 
            rgb <0.9,0.3,0.3>
        }
        finish{
            diffuse 0.1
            ambient 0.99
            specular 0.3
            reflection { 
                0.9  metallic 
            } 
        }
    }     
#end        



light_source {
  0*x
  color rgb 1.0
  area_light
  <8, 0, 0> <0, 0, 8>
  6, 4
  adaptive 3
  translate <0, 0, -10>
}


camera {	
	location <0, 20, -60>		           
	look_at <20-(50),5,0>       
	rotate <0,-90+(180),0>
}


plane {
  y, 
  -30.0 
  hollow on 
  pigment { rgb 1 }
} 


Lorenz(10, 28, 8/3, 0.00025, 400000, 0.0001, 0.0001, 0.0001, 0.035)
LorenzPoint(10, 28, 8/3, 0.00025, (400000)+2, 0.0001, 0.0001, 0.0001, 0.75)