package P

    package K
        constant Real k = 3;
    end K;
    package Q
        constant Real q = K.k;
    end Q;
    
    function f
        input Real x;
        input Real y;
        output B z;
    algorithm
        z := B(x, y);
    end f;
    
    function g
        input Real x;
        input Real y;
        output B z(x=x, y=y);
    algorithm
    end g;
    
    function h
        input Real x;
        output B z;
    algorithm
        z := B(x, Q.q);
    end h;
    
    function fA
        input A x;
        output A y;
    algorithm
        y := x;
    end fA;
    
    function real
        input B z;
        output Real re;
    algorithm
        re := z.x;
    end real;
    
    // Function Partial Application
    function f1
        input Real x;
        input OtherFunction other_function;
        output Real y;
    algorithm
        y := x + other_function(x) + other_function(x^2);
    end f1;
    
    partial function OtherFunction
        input Real x;
        output Real y;
    end OtherFunction;
    
    function OtherFunction2
        extends OtherFunction;
        input Real t;
    algorithm
        y := x + t;
    end OtherFunction2;
        
    record A
    end A;
    
    record B
        Real x;
        Real y;
    end B;

    model M1 // Tests function call with record argument
        parameter A a0;
        A a = fA(a0);
    end M1;
    
    model M2 // Tests function call with multiple arguments
        B z = f(0, K.k);
    end M2;
    
    model M3 // Tests transitive dependencies of argument
        B z = f(0, Q.q);
    end M3;
    
    model M4 // Tests nested function calls
        B z = f(real(g(0, K.k)), 0);
    end M4;
    
    model M5 // Tests nested function calls in equation
        B z;
    equation
        z = f(real(g(0, K.k)), time);
    end M5;
    
    model M6 // Tests transitive dependencies of function call 
        B z = h(0);
    end M6;
    
    model M7 // Tests "Function Partial Application"
        Real y;
    equation
        y = f1(time, function OtherFunction2(t=time));
    end M7;
    
end P;
