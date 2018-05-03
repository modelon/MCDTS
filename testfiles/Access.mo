package P

    package K
        constant Real k = 3;
    end K;
    
    package Q
        constant Real q = P2.k;
    end Q;
    
    function f
        input Real x;
        output Real y;
    algorithm
        y := x;
    end f;

    model M1 // Tests component access
        Real x = K.k;
    end M1;
    
    model M2 // Tests function call
        Real x = f(0);
    end M2;
    
    model M3 // Tests component access as an argument
        Real x = f(K.k);
    end M3;
    
    model M4 // Tests function call as an argument
        Real x = sin(f(K.k));
    end M4;
    
    model M5 // Tests qualified access
        Real x = P2.A.k;
    end M5;
    
    model M6 // Tests function call in expression
        Real x = 2 * f(K.k);
    end M6;
    
    model M7 // Tests expression as argument
        Real x = f(2 * K.k);
    end M7;
    
    model M8 // Tests more complicated expression
        Real x = 1 + f(2 * f(K.k / 3));
    end M8;
    
    model M9 // Tests transitive dependency
        Real x = Q.q;
    end M9;
    
    model M10 // Tests global access
        .P.M1 m1;
    end M10;
    
    model M11 // Tests global access of constant
        Real x = .P.K.k;
    end M11;
    
end P;

package P2
    constant Real k = 1;
    
    model A
        constant Real k = 2;
    end A;
end P2;