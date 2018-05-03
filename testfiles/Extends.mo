package P
    
    model A
        function f
            input Real x;
            output Real y;
        algorithm
            y := x;
        end f;
        
        package K
            constant Real k = 1;
        end K;
        
        Real x;
    end A;
    
    partial function f
        input Real x;
        output Real y;
    end f;

    model M1 // Tests extends
        extends A;
    end M1;
    
    model M2 // Tests nested extends
        extends M1;
    end M2;
    
    model M3 // Tests function call from base class
        extends A;
    equation
        x = f(time);
    end M3;
    
    model M4 // Tests component access from base class
        extends A;
    equation
        x = K.k;
    end M4;
    
    model M5 // Tests function call to extending function
        function f
            extends P.f;
        algorithm
           y := x;
        end f;
        Real x;
    equation
        x = f(time);
    end M5;
    
end P;