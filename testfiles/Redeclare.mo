package P
    
    constant Real k = 0;
    
    function f
        output Real y;
    algorithm
        y := 0;
    end f;
    
    model A
        replaceable function f
            output Real y;
        algorithm
            y := 2;
        end f;
        Real x;
    equation
        x = f();
    end A;
    
    model B
        replaceable model A = P.A;
        A a;
        Real x;
    equation
        x = a.x;
    end B;
    
    model C
        replaceable package Q = P3;
        
        Q.A a;
        Real x = Q.k;
    equation
        a.x = Q.f();
    end C;
    
    model D
        replaceable A a;
    end D;
    
    model E
        replaceable package P = P2;
        C c(redeclare package Q = P);
    end E;

    model M1 // Tests redeclare function
        A a(redeclare function f = P.f);
    end M1;
    
    model M2 // Tests redeclare model
        B b(redeclare model A = A);
        model A
            Real x = P2.k;
        end A;
    end M2;
    
    model M3 // Tests redeclare package
        C c(redeclare package Q = P2);
    end M3;
    
    model M4 // Tests component redeclare
        D d(redeclare P2.A a);
    end M4;
    
    model M5 // Tests nested redeclare
        D d(redeclare C a(redeclare package Q = P2));
    end M5;
    
    model M6 // Tests redeclare of extends statement
        extends B(redeclare model A = P2.A);
    end M6;
    
    model M7 // Tests transitive redeclare dependency
        E e(redeclare package P = P3);
    end M7;
    
    model M8 // Tests accessing enclosed class in redeclare
        model A
            function f
                output Real y;
            algorithm
                y := 0;
            end f;
        end A;
        
        model B
            function f
                output Real y;
            algorithm
                y := 1;
            end f;
        end B;
        
        model C
            replaceable model D = A;
            Real x;
        equation
            x = D.f();
        end C;
        
        C c(redeclare model D = B);
    end M8;
    
    model M9 // Tests transitive dependencies of component redeclare
        model A
            function f
                output Real y;
            algorithm
                y := 0;
            end f;
        end A;
        
        model B
            function f
                output Real y;
            algorithm
                y := 1;
            end f;
        end B;
        
        model C
            M8.A a;
            Real x;
        equation
            x = a.f();
        end C;
        
        C c(redeclare B a);
    end M9;
    
    model F
        replaceable function f
            output Real y;
        algorithm
            y := 0;
        end f;
    end F;
    
    model G
        outer F o;
        Real x = o.f();
    end G;
    
    model M10 // Redeclared function called from inner/outer
        inner F o(redeclare function f = f2);
        G q;
        
        function f2
            output Real y;
        algorithm
            y := 1;
        end f2;
    end M10;
    
    model H
        replaceable package P
            function f
                output Real y;
            algorithm
                y := 0;
            end f;
        end P;
    end H;
    
    model I
        outer H r;
        Real x = r.P.f();
    end I;
    
    model M11 // Redeclared package with function called from inner/outer
        inner H r(redeclare package P = P2);
        I s;
        
        package P2
            function f
                output Real y;
            algorithm
                y := 1;
            end f;
        end P2;
    end M11;
    
    model J
        model M
            Real x = P.f();
        end M;
        
        replaceable package P
            function f
                output Real y;
            algorithm
                y := 1;
            end f;
        end P;
    end J;
    
    model K
        extends J(redeclare package P = P2);
        package P2 = P3;
    end K;

    model M12 // Replacing class with short class declaration who's target encloses a class
        K.M m;
    end M12;
    
end P;

package P2

    constant Real k = 5;
    
    replaceable model A
        Real x;
    end A;
    
    replaceable function f
        output Real y;
    algorithm
        y := 1;
    end f;
    
end P2;

package P3

    constant Real k = 7;
    
    model A
        Real x;
    end A;
    
    function f
        output Real y;
    algorithm
        y := 0;
    end f;
    
end P3;