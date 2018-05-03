package P

    type E = enumeration(A, B, C);

    model M1 // Tests enumeration
        E e = E.A;
    end M1;
    
    model M2 // Tests enumeration as array dimension
        Real e[E];
    end M2;
    
end P;
