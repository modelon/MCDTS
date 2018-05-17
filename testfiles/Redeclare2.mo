package P
    
    model A1
        function f
            output Real y;
        algorithm
            y := g();
        end f;
        
        replaceable function g
            output Real y;
        algorithm
            y := 1;
        end g;
    end A1;
    
    model A2
        extends A1;
        
        redeclare function g
            output Real y;
        algorithm
            y := 2;
        end g;
    end A2;
    
    model M1 // Tests redeclare function in subclass
        A2 a;
        Real x;
    equation
        x = a.f();
    end M1;
    
    model B1
        model A
            M m;
        end A;
        
        replaceable model M
        end M;
    end B1;
    
    model B2
        extends B1;
        redeclare model extends M
        end M;
    end B2;
    
    model M2 // Tests redeclare model in subclass
        B2.A a;
    end M2;
    
    model C1
        function f
            input Real x;
            output Real y;
        algorithm
            y := x ^ 2;
        annotation (derivative = f1);
        end f;
        
        replaceable partial function f1
            input Real x;
            output Real y;
        end f1;
        
        Real x = f(2);
    end C1;
    
    model C2
        extends C1;
        
        redeclare function extends f1
        algorithm
            y := 2 * x;
        end f1;
    end C2;
    
    model M3 // Tests redeclare function in subclass accessed from derivative annotation
        C2 c;
    end M3;
    
    model D1
        replaceable function f
            output Real y;
        algorithm
            y := 1;
        end f;
        
        Real x = f();
    end D1;
    
    model D2
        extends D1;
        redeclare function f = g;
        replaceable function g
            output Real y;
        algorithm
            y := 2;
        end g;
    end D2;
    
    model D3
        extends D2(redeclare function g = h);
        function h
            output Real y;
        algorithm
            y := 3;
        end h;
    end D3;
    
    model M4 // Redeclare of redeclare in subclass
        D3 e;
    end M4;
    
    model E1
        model M
            Real x = P.g();
        end M;
        
        replaceable package P
            function g
                output Real y;
            algorithm
                y := 1;
            end g;
        end P;
    end E1;
    
    model E2
        extends E1;
        
        redeclare package P
            function g
                output Real y;
            algorithm
                y := 2;
            end g;
        end P;
    end E2;

    model M5 // Tests class enclosed by replacing class
        E2.M m;
    end M5;
    
    model F1
        model M
            Real x = P1.P.g();
        end M;
        
        replaceable package P1
            package P
                function g
                    output Real y;
                algorithm
                    y := 1;
                end g;
            end P;
        end P1;
    end F1;
    
    model F2
        extends F1;
        
        redeclare package P1
            package P = E2.P;
        end P1;
    end F2;

    model M6 // Tests class enclosed by class accessed by ShortClassDecl enclosed by replacing class
        F2.M m;
    end M6;
    
    model G1
        model M
            Real x = P1.P.g();
        end M;
        
        replaceable package P1
            package P
                function g
                    output Real y;
                algorithm
                    y := 1;
                end g;
            end P;
        end P1;
    end G1;
    
    model G2
        extends G1;
        
        redeclare package P1
            package P
                extends E2.P;
            end P;
        end P1;
    end G2;

    model M7 // Tests class enclosed by class extended by class enclosed by replacing class
        G2.M m;
    end M7;
    
    model H1
        model M
            function f
                output Real y;
            algorithm
                y := 1;
            end f;
        end M;
        
        replaceable M m;
        Real x = m.f();
    end H1;
    
    model H2
        extends H1;
        redeclare M2 m;
        
        model M2
            function f
                output Real y;
            algorithm
                y := 2;
            end f;
        end M2;
    end H2;

    model M8 // Tests access of function in replacing component with redeclare prefix
        H2 h;
    end M8;
    
end P;
