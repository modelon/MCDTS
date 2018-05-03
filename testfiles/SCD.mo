package P

    package P0 = P;
    package K
        constant Real k = 3;
    end K;
    
    model A
        package P = P0;
        function f = P.f;
        model B = P.A;
        package A
            constant Real c = P.K.k;
        end A;
    end A;
    
    function f
        input Real x;
        output Real y;
    algorithm
        y := x;
    end f;
    
    type B = Real(min=0, max=1);
    
    connector C = input B;

    model M1 // Tests short class declaration
        Real x = P0.K.k;
    end M1;
    
    model M2 // Tests function call in short class declaration
        Real x = P0.f(0);
    end M2;
    
    model M3 // Tests component of short class declaration
        P0.A a;
        Real x = a.f(P0.A.B.A.c);
    end M3;
    
    model M4 // Tests extend short class declaration
        extends A.B;
    end M4;
    
    model M5 // Tests dependencies on short class decls of primitives
        C c[1];
    end M5;
    
end P;