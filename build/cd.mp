vardef curved_connect@#(expr a, b, d) = 
    save line, mark; 
    
    path line; 
    line = center a {d} .. center b;
    interim bboxmargin := 4;
    drawarrow line cutbefore bbox a cutafter bbox b;
enddef;

vardef connect@#(expr a, b) = 
    curved_connect@#(a, b, center b - center a)
enddef;

beginfig(4);
    picture N[], Z, ONE, PLUS;

    z1 = -z2 = (2cm, 0);
    z3 = z1 shifted (-2cm, -1cm);
    z4 = z2 shifted (-2cm, -1cm);

    N0 = thelabel(btex $\mathbb{N}$ etex, z1);
    ONE = thelabel(btex 1 etex, z2);
    PLUS = thelabel(btex 1 + $\mathbb{N}$ etex, z3);
    N1 = thelabel(btex $\mathbb{N}$ etex, z4);
    Z = thelabel(btex $\mathbb{Z}$ etex, z2 shifted (0, -2cm));

    forsuffixes @=N0,N1,Z,ONE,PLUS:
        draw @;
    endfor

    connect(ONE, PLUS);
    connect(N0, PLUS);

    connect(N1, Z);
    connect(PLUS, Z);

endfig;

