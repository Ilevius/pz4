subroutine makeKsi(c44, c55, e15, e24, eps11, eps22, rho, w, k, ksi)
implicit none
real*8 c44, c55, e15, e24, eps11, eps22, rho, w, k
real*8 a, b, c
complex*16 r1, r2, ksi(4), descr   
    a = c44*eps22 + e24**2
    b = rho*w**2*eps22 - 2d0*e24*e15*k**2 - c44*eps11*k**2 - c55*eps22*k**2
    c = (c55*eps11 + e15**2)*k**4 - rho*w**2*eps11*k**2
    descr = sqrt((1d0,0d0)*(b**2 - 4d0*a*c))
    r1 = ( -b + descr )/(2d0*a); r2 = ( -b - descr )/(2d0*a);
    
    ksi(1) = sqrt(r1); ksi(2) = -ksi(1); ksi(3) = sqrt(r2); ksi(4) = -ksi(3);  
    !pause
end subroutine makeKsi    
    
subroutine makeG(eps11, eps22, e15, e24, k, ksi, G)
implicit none
real*8 eps11, eps22, e15, e24, k
complex*16 ksi(4), G(4)
integer i
    do i = 1,4
        G(i) = (e24*ksi(i)**2 - e15*k**2)/(eps22*ksi(i)**2 - eps11*k**2)
    enddo 
    !pause
end subroutine makeG