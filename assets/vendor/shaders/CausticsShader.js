const CausticsShader = {

    defines: {
        'TAU': Math.PI * 2,
        'MAX_ITER': 2,
    },

    uniforms: {
        time: { type: 'f', value: 1.0 },
    },

    vertex: [

        'varying vec2 v_uv;',
        'void main() {',
        '    v_uv = uv;',
        '    gl_Position = projectionMatrix * modelViewMatrix * vec4( position, 1.0 );',
        '}',

    ].join('\n'),

    fragment: [

        'uniform float time;',
        'varying vec2 v_uv;',

        'void main() {',
        '   float timee = time / 4.;',


        '   vec2 p = mod(v_uv*TAU, TAU)-250.0;',
        '   vec2 i = vec2(p);',
        '   float c = 1.0;',
        '   float inten = .005;',

        '   for (int n = 0; n < MAX_ITER; n++) {',
        '       float t = timee * (1.0 - (3.5 / float(n+1)));',
        '       i = p + vec2(cos(t - i.x) + sin(t + i.y), sin(t - i.y) + cos(t + i.x));',
        '       c += 1.0/length(vec2(p.x / (sin(i.x+t)/inten),p.y / (cos(i.y+t)/inten)));',
        '   }',
        '   c /= float(MAX_ITER);',
        '   c = 1.17-pow(c, 1.4);',
        '   vec3 colour = vec3(pow(abs(c), 8.0));',
        '   colour = clamp(colour + vec3(0.0, 0.35, 0.5), 0.0, 1.0);',

        '   gl_FragColor = vec4(colour, 1.0);',
        '}'

    ].join('\n')
}
