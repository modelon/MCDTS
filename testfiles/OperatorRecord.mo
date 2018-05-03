package P

    model M1 // Tests arithmetic binary expression overloading
        Complex c1 = Complex(0, 0);
        Complex c2 = Complex(0, 0);
        Complex c3 = c1 + c2;
    end M1;
    
    model M2 // Tests logical binary expression overloading
        Complex c1 = Complex(0, 0);
        Complex c2 = Complex(0, 0);
        Boolean b = c1 == c2;
    end M2;
    
    model M3 // Tests '0' constructor
        Complex c1[1, 0];
        Complex c2[0, 1];
        Complex c3[1, 1] = c1 * c2;
    end M3;
    
    model M4 // Tests string conversion overloading
        Complex c1 = Complex(0, 0);
        String a = String(c1);
    end M4;
    
    model M5 // Tests '-'.subtract overloading
        Complex c1 = Complex(0, 0);
        Complex c2 = Complex(0, 0);
        Complex c3 = c1 - c2;
    end M5;
    
    model M6 // Tests '-'.negate overloading
        Complex c1 = Complex(0, 0);
        Complex c2 = -c1;
    end M6;
    
end P;
