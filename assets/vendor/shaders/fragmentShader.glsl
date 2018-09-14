/** GLSL DOCS - http://docs.gl/el3 */

varying vec2 vUv;
varying float noise;
uniform sampler2D tExplosion;

/**
*   @float random()
*   @param {vec3} scale - XYZ values for affecting scale?
*   @param {float} seed - No idea
*/
float random ( vec3 scale, float seed ){
    /** 
    * MATHEMATICS - fract() - Computes the fractional part of the argument ?
    * TRIGINOMETRY - sin() - Returns the sine of the parameter 
    * VECTOR - dot() - calculate the dot product of two vectors ?
    * BUILT-IN VARIABLE - gl_FragCoord - Contains the window-relative coordinates of the current fragment
    */
    return fract( sin( dot( gl_FragCoord.xyz + seed, scale ) ) * 43758.5453 + seed );
}

void main() {

    // get a random offset
    float r = .01 * random( vec3( 12.9898, 78.233, 151.7182 ), 0.0 );
    // compose the colour using the UV coordinate
    // and modulate it with the noise like ambient occlusion
    // vec3 color = vec3(vUv * (1. - 2. * noise), 0.0);

    // lookup verticall in the texture, using noise and offset
    // to get the right RGB colour
    vec2 tPos = vec2( 0, 1.3 * noise + r );
    vec4 color = texture2D( tExplosion, tPos );


    gl_FragColor = vec4( color.rgb, 1.0 );
}
