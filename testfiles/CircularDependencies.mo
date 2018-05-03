package P

    model A // Tests recursive function
        Real x;
    equation
        x = f(x);
    end A;
    
    function f
        input Real x;
        output Real result;
    algorithm
        if x > 0 then
            result := x * f(x - 1);
        else
            result := 1;
        end if;
    end f;
    
    model C // Tests indirect recursive functions
        Real x;
    equation
        x = g(x);
    end C;
    
    function g
        input Real x;
        output Real result;
    algorithm
        result := h(x);
    end g;
    
    function h
        input Real x;
        output Real result;
    algorithm
        result := g(x);
    end h;
    
end P;

package P2 // Tests circular dependencies

    function a
        input Real x;
        output Real y;
    algorithm
        y := b(x);
    end a;

    function b
        input Real x;
        output Real y;
    algorithm
        y := c(x);
    end b;

    function c
        input Real x;
        output Real y;
    algorithm
        y := d(x);
    end c;

    function d
        input Real x;
        output Real y;
    algorithm
        y := a(x);
    end d;
    
    
end P2;
