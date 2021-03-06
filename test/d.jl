@testset "D" begin
    kclear()
    let lmpoolNames = ["DELTET/DELTA_T_A", "DELTET/K", "DELTET/EB", "DELTET/M", "DELTET/DELTA_AT"]
        lmpoolLens = [1, 1, 1, 2, 46]
        textbuf = ["DELTET/DELTA_T_A = 32.184",
                "DELTET/K         = 1.657D-3",
                "DELTET/EB        = 1.671D-2",
                "DELTET/M         = ( 6.239996 1.99096871D-7 )",
                "DELTET/DELTA_AT  = ( 10, @1972-JAN-1",
                "                     11, @1972-JUL-1",
                "                     12, @1973-JAN-1",
                "                     13, @1974-JAN-1",
                "                     14, @1975-JAN-1",
                "                     15, @1976-JAN-1",
                "                     16, @1977-JAN-1",
                "                     17, @1978-JAN-1",
                "                     18, @1979-JAN-1",
                "                     19, @1980-JAN-1",
                "                     20, @1981-JUL-1",
                "                     21, @1982-JUL-1",
                "                     22, @1983-JUL-1",
                "                     23, @1985-JUL-1",
                "                     24, @1988-JAN-1",
                "                     25, @1990-JAN-1",
                "                     26, @1991-JAN-1",
                "                     27, @1992-JUL-1",
                "                     28, @1993-JUL-1",
                "                     29, @1994-JUL-1",
                "                     30, @1996-JAN-1",
                "                     31, @1997-JUL-1",
                "                     32, @1999-JAN-1 )"]
        lmpool(textbuf)
        for (var, expectLen) in zip(lmpoolNames, lmpoolLens)
            n, vartype = dtpool(var)
            @test expectLen == n
            @test vartype == :N
        end
    end
    kclear()
end