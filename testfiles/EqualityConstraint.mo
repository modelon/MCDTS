package P
    
    record A
        Real value;
        replaceable function equalityConstraint
            input A a1;
            input A a2;
            output Real residue[0];
        algorithm
            assert(abs(a1.value - a2.value) < 1E-6, "Values should be equal!");
        end equalityConstraint;
    end A;
    
    type B
        Real value;
        function equalityConstraint
            input B b1;
            input B b2;
            output Real residue[0];
        algorithm
            assert(abs(b1.value - b2.value) < 1E-6, "Values should be equal!");
        end equalityConstraint;
    end B;
    
    connector C
        A a;
    end C;
    
    connector D
        A a(redeclare function equalityConstraint = f);
        function f
            input A b1;
            input A b2;
            output Real residue[0];
        algorithm
            assert(abs(b1.value - b2.value) < 1E-4, "Values should be equal!");
        end f;
    end D;

    model M1 // Tests record with equalityConstraint
        A a;
    end M1;
    
    model M2 // Tests type with equalityConstraint
        B b;
    end M2;
    
    model M3 // Tests connector with record with equalityConstraint
        C c1;
        C c2;
        C c3;
        Real x;
    equation
        c1.a.value = time;
        Connections.root(c1.a);
        connect(c2, c3);
        Connections.branch(c1.a, c2.a);
        c1.a = c2.a;
        Connections.branch(c1.a, c3.a);
        c1.a = c3.a;
        x = c3.a.value;
    end M3;
    
    model M4 // Tests redeclared equalityConstraint
        D c1;
        D c2;
        D c3;
        Real x;
    equation
        c1.a.value = time;
        Connections.root(c1.a);
        connect(c2, c3);
        Connections.branch(c1.a, c2.a);
        c1.a = c2.a;
        Connections.branch(c1.a, c3.a);
        c1.a = c3.a;
        x = c3.a.value;
    end M4;
    
end P;
