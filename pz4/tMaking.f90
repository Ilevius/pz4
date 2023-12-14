subroutine makeA(rho, eps22, eps11, e24, e15, c44, c55, w, alfa, a)
    implicit none 
    real*8 rho, eps0, eps22, eps11, e24, e15, c44, c55, w, a0
    complex*16 alfa, a(4)
    a0 = eps22*c44 + e24**2
    a(1) = (c55*alfa**2*eps22 + alfa**2*e15*e24 - eps22*w**2*rho)/a0
    a(2) = (alfa**2*e15*eps22 - eps11*alfa**2*e24)/a0
    a(3) = (c55*alfa**2*e24 - e24*w**2*rho - alfa**2*e15*c44)/a0
    a(4) = (eps11*c44*alfa**2 + e24*alfa**2*e15)/a0   
end subroutine makeA   
    
    
subroutine makeSigma(a, sigma)
implicit none
complex*16 a(4), sigma(2), r(2), D, Droot, Rroot
    D = (a(1)+a(4))**2 - 4*(a(1)*a(4) - a(2)*a(3))
    if (real(D)<0d0 .and. imag(D) == 0d0) then      
        Droot = (0d0,1d0)*sqrt(abs(D))
    else
        Droot = sqrt(D)
    endif    
    r(1) = (a(1)+a(4) - Droot)/2d0; r(2) = (a(1)+a(4) + Droot)/2d0;
    
    if (real(r(1))<0d0 .and. imag(r(1)) == 0d0) then      
        sigma(1) = (0d0,1d0)*sqrt(abs(r(1)))
    else
        sigma(1) = sqrt(r(1))
    endif 
    
    if (real(r(2))<0d0 .and. imag(r(2)) == 0d0) then      
        sigma(2) = (0d0,1d0)*sqrt(abs(r(2)))
    else
        sigma(2) = sqrt(r(2))
    endif 
end subroutine makeSigma
    
    
    
subroutine makeP(sigma, a, p)    
implicit none
complex*16 a(4), sigma(2), p(2)
    p(1) = (sigma(1)**2 - a(1))/a(2)
    p(2) = (sigma(2)**2 - a(1))/a(2)
end subroutine makeP
 
    
    
subroutine makeB(h, eps0, eps22, e24, c44, alfa, p, sigma, B)
    implicit none 
    real*8 eps0, eps22, e24, c44, h
    complex*16 alfa, p(2), sigma(2), B(4,4)
    complex*16 b1, b2, c1, c2, c3, c4, d1, d2, d3, d4
    b1 = c44*sigma(1) + e24*p(1)*sigma(1); b2 = c44*sigma(2) + e24*p(2)*sigma(2);
    
    c1 = eps22*p(1)*sigma(1) - e24*sigma(1) - eps0*alfa*p(1); c2 = eps22*p(1)*(-sigma(1)) - e24*(-sigma(1)) - eps0*alfa*p(1);
    c3 = eps22*p(2)*sigma(2) - e24*sigma(2) - eps0*alfa*p(2); c4 = eps22*p(2)*(-sigma(2)) - e24*(-sigma(2)) - eps0*alfa*p(2);
    
    d1 = eps22*p(1)*sigma(1) - e24*sigma(1) + eps0*alfa*p(1); d2 = eps22*p(1)*(-sigma(1)) - e24*(-sigma(1)) + eps0*alfa*p(1);
    d3 = eps22*p(2)*sigma(2) - e24*sigma(2) + eps0*alfa*p(2); d4 = eps22*p(2)*(-sigma(2)) - e24*(-sigma(2)) + eps0*alfa*p(2);
    
    B(1,1) = b1;                  B(1,2) = -b1;                 B(1,3) = b2;                  B(1,4) = -b2;
    B(2,1) = b1*exp(-sigma(1)*h); B(2,2) = -b1*exp(sigma(1)*h); B(2,3) = b2*exp(-sigma(2)*h); B(2,4) = -b2*exp(sigma(2)*h);
    B(3,1) = c1;                  B(3,2) = c2;                  B(3,3) = c3;                  B(3,4) = c4;
    B(4,1) = d1*exp(-sigma(1)*h); B(4,2) = d2*exp(sigma(1)*h);  B(4,3) = d3*exp(-sigma(2)*h); B(4,4) = d4*exp(sigma(2)*h);
    
end subroutine makeB    
    
    
    
subroutine resK(h, eps0, eps11, eps22, e15, e24, c44, c55, rho, w, dz, ht, res, z, n)
    implicit none 
    integer i, j, n
    real*8 h, eps0, eps11, eps22, e15, e24, c44, c55, rho, w, dz, ht, z(n)
    complex*16 dzm, dzp, a(4), p(2), sigma(2), B(4,4), C(4,4), R(4,4), t(4,1), res(n), Usym, Q, um(n), up(n)
        dzm = (1d0,0d0)*(dz-ht)
        dzp = (1d0,0d0)*(dz+ht)           
                        
        Q = 1d0
        t = 0d0
        t(1,1) = Q
        call makeA(rho, eps22, eps11, e24, e15, c44, c55, w, dzm, a)
        call makeSigma(a, sigma)
        call makeP(sigma, a, p)
        call makeB(h, eps0, eps22, e24, c44, dzm, p, sigma, B)
        call STAR5(B,t,C,R,4,4,1,2)
            
        do j = 1, n
            call makeU(z(j), sigma, t, Usym)
            um(j) = Usym
        enddo 
               
        Q = 1d0
        t = 0d0
        t(1,1) = Q
        call makeA(rho, eps22, eps11, e24, e15, c44, c55, w, dzp, a)
        call makeSigma(a, sigma)
        call makeP(sigma, a, p)
        call makeB(h, eps0, eps22, e24, c44, dzp, p, sigma, B)
        call STAR5(B,t,C,R,4,4,1,2)
            
        do j = 1, n
            call makeU(z(j), sigma, t, Usym)
            up(j) = Usym
        enddo                        
        res = ht/2*(up-um)            
end subroutine resK
    
    
subroutine plotSigma(rho, eps22, eps11, e24, e15, c44, c55, w)
implicit none
real*8 rho, eps22, eps11, e24, e15, c44, c55, w, alfa
complex*16 a(4), sigma(2), alfa_c
    open(1, file='sigma.txt', FORM='FORMATTED')
    do alfa = -15d0, 15d0, 1d-1
        alfa_c = (1d0,0d0)*(alfa)
        call makeA(rho, eps22, eps11, e24, e15, c44, c55, w, alfa_c, a)
        call makeSigma(a, sigma)
        write(1, '(7E15.6E3)') alfa, w, real(sigma(1)), imag(sigma(1)), real(sigma(2)), imag(sigma(2))
    enddo
    close(1)
end subroutine plotSigma
    
