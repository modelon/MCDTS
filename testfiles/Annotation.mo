package P

    function f
        input Real x;
        output Real y;
    algorithm
        y := x ^ 3;
        annotation (derivative = f_der);
    end f;
    
    function f_der
        input Real x;
        input Real x_der;
        output Real y_der;
    algorithm
        y_der := 3 * x^2 * x_der;
    end f_der;
    
    function g
        input Real x;
        output Real y;
    algorithm
        y := x;
        annotation ( inverse(x = g_inv(y)) );
    end g;
    
    function g_inv
        input Real y;
        output Real x;
    algorithm
        x := y;
    end g_inv;

    model M1 // Tests derivative annotation
        Real r = f(0);
    end M1;
    
    model M2 // Tests inverse annotation
        Real y = g(0);
    end M2;
    
    model M3 // Tests derivative annotation
        Real x1;
        Real x2;
    equation
        x1 = f(time ^ 2 + 1);
        x2 = der(x1);
    end M3;
    
end P;
