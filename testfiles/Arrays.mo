package P

    package R
        constant Integer k = 0;
    end R;
    package S
        constant Integer k = 1;
    end S;
    package T
        constant Integer k = 2;
    end T;
    
    function g
        input Integer x1;
        input Integer x2;
        input Integer x3;
        output Real[x1, x2, x3] y;
    algorithm
        y := zeros(x1, x2, x3);
    end g;
    
    function h
        output Real a;
    algorithm
        a := 3;
    end h;
    
    model A
        Real x;
    end A;

    model M1 // Tests array declaration
        A a[10];
    end M1;
    
    model M2 // Tests expression in array initialization
        Real x[2] = {R.k, S.k};
    end M2;
    
    model M3 // Tests subscript expression
        Real y[T.k];
    end M3;
    
    model M4 // Tests 2D array initialization
        Real B[2,1] = {{R.k}, {S.k}};
    end M4;
    
    model M5 // Tests ranges
        Real x[R.k + 1] = 1.0*(1:S.k);
        Real y[5] = T.k*(1:5);
    end M5;
    
    model M6 // Tests array comprehension
        Real x1[:] = {R.k*i for i in 1:5};
        Real x2[:] = {1*i for i in 1:S.k};
        Real x3[T.k] = {1*i for i in 1:2};
    end M6;
    
    model M7 // Tests array function
        Real x[1, 2, 3] = g(1, 2, 3);
    end M7;
    
    model M8 // Tests scalar product
        Real a = {h(), h()}*{1, 2};
    end M8;
    
end P;
