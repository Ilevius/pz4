MODULE Nedospasov_deltas
    IMPLICIT NONE   
    
    
    CONTAINS
    
    FUNCTION th(x)
    implicit none
    complex*16 th, x
        th = (1-exp(-2d0*x))/(1+exp(-2d0*x))
    END FUNCTION th
    
    !function deltaA(k)
    !implicit none 
    !real*8 k, deltaA
    !complex*16 G(4), ksi(4), num, den, deltaA_c
    !    call makeKsi(c44, c55, e15, e24, eps11, eps22, rho, w, k, ksi)
    !    call makeG(eps11, eps22, e15, e24, k, ksi, G)
    !    num = (c44 + e24*G(1))*ksi(1)*( (e24 - eps22*G(3))*ksi(3) - eps0*k*G(3)*th(ksi(3)*d) )
    !    den = (c44 + e24*G(3))*ksi(3)*( (e24 - eps22*G(1))*ksi(1) - eps0*k*G(1)*th(ksi(1)*d) )
    !    deltaA_c = num/den -1d0
    !    deltaA = abs( deltaA_c )
    !end
    !
    !
    !real*8 function deltaS(k)
    !implicit none 
    !real*8 k
    !complex*16 G(4), ksi(4), num, den, deltaS_c
    !    call makeKsi(c44, c55, e15, e24, eps11, eps22, rho, w, k, ksi)
    !    call makeG(eps11, eps22, e15, e24, k, ksi, G)
    !    num = (c44 + e24*G(1))*ksi(1)*( (e24 - eps22*G(3))*ksi(3) - eps0*k*G(3)*(th(ksi(3)*d))**(-1) )
    !    den = (c44 + e24*G(3))*ksi(3)*( (e24 - eps22*G(1))*ksi(1) - eps0*k*G(1)*(th(ksi(1)*d))**(-1) )
    !    deltaS_c = num/den - 1d0
    !    deltaS = abs(deltaS_c)
    !end
    !
    
    
    
    
    
END MODULE Nedospasov_deltas     