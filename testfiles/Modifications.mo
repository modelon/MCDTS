package P

    package K
        constant Real k = 3;
    end K;
    
    function f
        input Real x;
        output Real y;
    algorithm
        y := x;
    end f;
    
    model A
        Real x;
    end A;
    
    model B
        Real x;
        Real y;
    end B;
    
    model C
        R r = R(0);
    end C;
    
    record R
        Real x;
    end R;
    
    record R2
        extends R(x = K.k);
    end R2;
    
    model D
        replaceable R r(x = f(0));
    end D;

    model M1 // Tests value modification
        A a(x = K.k);
    end M1;
    
    model M2 // Tests function call in value modification
        A a(x = f(0));
    end M2;
    
    model M3 // Tests multiple value modifications
        B b(x = K.k, y = f(0));
    end M3;
    
    model M4 // Tests nested value modification
        A a(x(min=K.k) = 0);
    end M4;
    
    model M5 // Tests value modification of type
        Real x(min = K.k);
    end M5;
    
    model M6 // Tests value modification of type
        Real x(min = f(0));
    end M6;
    
    model M7 // Tests function call in modification on extends
        extends A(x = f(0));
    end M7;
    
    model M8 // Tests function call in modification on component
        A a(x = f(0));
    end M8;
    
    model M9 // Tests record constructors in modifications
        C c(r = R2(0));
    end M9;
    
    model M10 // Tests redeclaring component with value modification
        extends D(redeclare R2 r);
    end M10;
    
    model M11 // Tests using a type that is modified in extends
        package A
            extends B(Temp(min = K.k));
        end A;
        
        package B
            type Temp = Real(min = 0);
            
            model M
                Temp T;
            end M;
        end B;
        
        A.M m;
    end M11;
    
    model M12 // Tests using a type that is modified in extends
        package A
            extends B(Temp(min = K.k));
            
            model C
                M m;
            end C;
        end A;
        
        package B
            type Temp = Real(min = 0);
            
            model M
                Temp T;
            end M;
        end B;
    end M12;
    
end P;
