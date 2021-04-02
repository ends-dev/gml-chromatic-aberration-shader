//default when you create shader
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

//declare intensity
//intensity value is set outside the shader, in the object
uniform float intensity;

void main()
{
	//sets the base color without changes
	//vec4 because it has 4 values: (red, green, blue, alpha)
	vec4 basecolor = texture2D( gm_BaseTexture, v_vTexcoord );
	
	//create newcolor to equal basecolor
	vec4 newcolor = basecolor;
	
	//divides level of intensity by 100
	float adj_amt = intensity / 100.0;
		
	//offsets the red value
	newcolor.r = texture2D(gm_BaseTexture, vec2(v_vTexcoord.x + adj_amt, v_vTexcoord.y + adj_amt)).r;
	// green value stays the same
	newcolor.g = basecolor.g;
	//offsets the blue value
	newcolor.b = texture2D(gm_BaseTexture, vec2(v_vTexcoord.x - adj_amt, v_vTexcoord.y - adj_amt)).b;

	//sets the fragment color to the value of newcolor
	gl_FragColor = newcolor;
}
