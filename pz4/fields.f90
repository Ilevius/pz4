    SUBROUTINE makeU(z, sigma, t, U)
    implicit none
    complex*16 U, sigma(2), t(4)
    real*8 z
        U = t(1)*exp(sigma(1)*z)+t(2)*exp(-sigma(1)*z)+t(3)*exp(sigma(2)*z)+t(4)*exp(-sigma(2)*z)
    END SUBROUTINE makeU
        
    SUBROUTINE makeFi(z, sigma, t, p, Fi)
        implicit none
        complex*16 Fi, p(2), sigma(2), t(4)
        real*8 z
        Fi = t(1)*p(1)*exp(sigma(1)*z) + t(2)*p(1)*exp(-sigma(1)*z) + t(3)*p(2)*exp(sigma(2)*z) + t(4)*p(2)*exp(-sigma(2)*z)
    END SUBROUTINE makeFi 
        
    SUBROUTINE makedU(z, sigma, t, dU)
    implicit none
    complex*16 dU, sigma(2), t(4)
    real*8 z
        dU = (sigma(1))*t(1)*exp(sigma(1)*z) + (-sigma(1))*t(2)*exp(-sigma(1)*z) + (sigma(2))*t(3)*exp(sigma(2)*z) + (-sigma(2))*t(4)*exp(-sigma(2)*z)
    END SUBROUTINE makedU
        
    SUBROUTINE makedFi(z, sigma, t, p, dFi)
        implicit none
        complex*16 dFi, p(2), sigma(2), t(4)
        real*8 z
        dFi = (sigma(1))*t(1)*p(1)*exp(sigma(1)*z) + (-sigma(1))*t(2)*p(1)*exp(-sigma(1)*z) + (sigma(2))*t(3)*p(2)*exp(sigma(2)*z) + (-sigma(2))*t(4)*p(2)*exp(-sigma(2)*z)
    END SUBROUTINE makedFi 
    
    
    SUBROUTINE maked2U(z, sigma, t, d2U)
    implicit none
    complex*16 d2U, sigma(2), t(4)
    real*8 z
        d2U = (sigma(1))**2*t(1)*exp(sigma(1)*z) + (-sigma(1))**2*t(2)*exp(-sigma(1)*z) + (sigma(2))**2*t(3)*exp(sigma(2)*z) + (-sigma(2))**2*t(4)*exp(-sigma(2)*z)
    END SUBROUTINE maked2U
        
    SUBROUTINE maked2Fi(z, sigma, t, p, d2Fi)
        implicit none
        complex*16 d2Fi, p(2), sigma(2), t(4)
        real*8 z
        d2Fi = (sigma(1))**2*t(1)*p(1)*exp(sigma(1)*z) + (-sigma(1))**2*t(2)*p(1)*exp(-sigma(1)*z) + (sigma(2))**2*t(3)*p(2)*exp(sigma(2)*z) + (-sigma(2))**2*t(4)*p(2)*exp(-sigma(2)*z)
    END SUBROUTINE maked2Fi 
    
 