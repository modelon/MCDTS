package P
    
    function f
        input Real x;
        output Real y;
        external;
    end f;
    
    class A
        extends ExternalObject;
        
        function constructor
            output A a;
            external "C";
        end constructor;
        
        function destructor
            input A a;
            external "C";
        end destructor;
    end A;

    model M1 // Tests function call to external function
        Real x;
    equation
        x = f(time);
    end M1;
    
    function M2 // Tests external function
        external;
    end M2;
    
    model M3 // Tests external object
        A a = A();
    end M3;
    
end P;
