SUBROUTINE outPoints(c44, e24, eps22, rho, h, n)
implicit none
integer i, n
real*8  c44, e24, eps22, rho, h
real*8 sqK2, fhSym, fhAsym
    open(1, file='cutOffSym.txt', FORM='FORMATTED')
    open(2, file='cutOffASym.txt', FORM='FORMATTED')
    write(1, '(A)') "% symmetric cutoff freqs";  write(2, '(A)') "% antisymmetric cutoff freqs";
    
    sqK2 = e24**2/(c44*eps22)
    do i = 0, n
        fhSym = i*sqrt(c44*(1 + sqK2)/rho)
        fhAsym = ((i+1)-0.5d0)*sqrt(c44*(1 + sqK2)/rho)
        write(1, '(3E15.6E3)') fhSym/h, 0d0 
        write(2, '(3E15.6E3)') fhAsym/h, 0d0
    enddo 
    close(1); close(2);
END SUBROUTINE outPoints