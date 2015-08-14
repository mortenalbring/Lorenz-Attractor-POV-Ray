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
