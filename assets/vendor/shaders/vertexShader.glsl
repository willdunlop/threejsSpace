//  Declare a 'varying' of type vec2 called vUv
//  varyings are a variable that can be shared between the vertex shader and the fragment shader
varying vec2 vUv;

void main() {
    vUv = uv;
    gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);
}
