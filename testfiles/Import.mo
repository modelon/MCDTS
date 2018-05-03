package P

    package R
        constant Real k = 0;
        
        model A
        end A;
    end R;

end P;

package P2
    
    model M1 // Tests class access with qualified import
        import P.R;
        R.A a;
    end M1;
    
    model M2 // Tests component access with qualified import
        import P.R;
        Real x = R.k;
    end M2;
    
    model M3 // Tests qualified access to component in class imported with unqualified import
        import P.*;
        Real x = R.k;
    end M3;
    
    model M4 // Tests access to component imported with unqualified import
        import P.R.*;
        Real x = k;
    end M4;
    
    model M5 // Tests access to class imported with unqualified import
        import P.R.*;
        A a;
    end M5;
    
    model M6 // Tests unqualified import
        import P.R.*;
        A a;
    end M6;
    
    model M7 // Tests named import
        import B = P.R.A;
        B a;
    end M7;
    
    model M8 // Tests class access with named import
        import B = P.R;
        B.A a;
    end M8;
    
end P2;
