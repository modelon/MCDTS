package P

    package R
        constant Real k = 0;
    end R;
    package S
        constant Real k = 1;
    end S;
    package T
        constant Real k = 2;
    end T;

    function f
        input Real x;
        output Real y;
    algorithm
        y := x;
    end f;

    model M1 // Tests component access in equation
        Real x;
    initial equation
        x = R.k;
    end M1;
    
    model M2 // Tests function call in equation
        Real x;
    equation
        x = f(time);
    end M2;
    
    model M3 // Tests boolean expression
        Boolean late;
    equation
        late = time >= R.k;
    end M3;
    
    model M4 // Tests if expression
        Real x;
    equation
        x = if (x<R.k) then S.k else T.k;
    end M4;
    
    model M5 // Tests when statement
        Real x;
    equation
        when x > R.k then
            x = S.k;
        end when;
    end M5;
    
    model M6 // Tests if statement
        Real x;
    equation
        if x > T.k then
            x = 3;
        elseif x <= R.k then
            x = f(R.k);
        else
            x = S.k;
        end if;
    end M6;
    
end P;
