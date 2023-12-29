program pz4
use Nedospasov_deltas
implicit none

complex*16 ci
real*8 h, d, rho, eps0, eps22, eps11, e24, e15, c44, c55, w, pi
parameter (pi=3.141592653589793d0)
parameter (ci = (0d0,1d0))
real*8 fmin, fmax, fstep, dzetaMin, dzetaMax, haminStep, haminEps, DispSurferStep, DispSurferf, DispSurferDzeta
real*8, allocatable :: x(:), z(:), f(:)
complex*16, allocatable ::  u(:), uRes(:)
integer i, pointsNum, freqNum
 !                       из письма, F/m Y cut
    !c44 = 0.743d2
    !c55 = 0.25d2   
    !e15 = 5.16d0
    !e24 = 11.7d0    
    !eps11 = 3.27d-1
    !eps22 = 6.903d0

 !!                       из письма, F/m с перестановкой X cut
    c44 = 0.25d2
    c55 = 0.743d2
    
    e15 = 11.7d0
    e24 = 5.16d0
    
    eps11 = 6.903d0
    eps22 = 3.27d-1
   
    eps0 = 8.85d-3
    h = 5d0; d = h/2;
    rho = 4.630d0
            
    fmin = 2.2544d0; fmax = 2.684d0; fstep = (fmax-fmin)/100; ! disp curves settings                               A L L    P O I N T S
    
    !fmin = 2.9d0; fmax = fmin + 0.2d0; fstep = 1d-4; ! disp curves settings                               D E T A I L S     P O I N T S
    
     
    dzetaMin = 0d0; dzetaMax = 6d0; haminStep = 1d-3; haminEps = 1d-7 ! Hamin settings

    pointsNum = 1; freqNum = 300;
    allocate(x(pointsNum), z(pointsNum), u(pointsNum), uRes(pointsNum), f(freqNum))
    x = [(-5.05d0+5d-2*i, i = 1, pointsNum)]; z = -h;
    f = [(0d0+0.6d-2*i, i = 1, freqNum)]

    !call testBoundary(-5d0, 5d0, 0.5d-1)
    !call plotU
    !call testEq
    !call plotSigma(rho, eps22, eps11, e24, e15, c44, c55, 6d0*pi)
    !call testBound
    !call plotTestField
    !call plotTestRes   
    !call plotResModSum
    !call plotAllCurves(3.2d0)
    
contains   
    real*8 function haminDelta(alfa)
    implicit none
    real*8 alfa
    complex*16 alfa_c, C(4,4), R(4,4),  a(4), sigma(2), p(2), B(4,4), t(4,1)
        alfa_c = alfa*(1d0,0d0)
        t(1,1) = 1d0; t(2,1) = 0d0; t(3,1) = 0d0; t(4,1) = 0d0
        call makeA(rho, eps22, eps11, e24, e15, c44, c55, w, alfa_c, a)
        call makeSigma(a, sigma)
        call makeP(sigma, a, p)
        call makeB(h, eps0, eps22, e24, c44, alfa_c, p, sigma, B)
        call STAR5(B,t,C,R,4,4,1,3) 
        haminDelta = 1d0/(  abs(t(1,1)) + abs(t(2,1)) + abs(t(3,1)) + abs(t(4,1))  ) 
    end
     
    subroutine plotDcurves(fmin, fmax, fstep, smin,smax,hs,eps)
    implicit none
    real*8 fmin, fmax, fstep, smin,smax,hs,eps, dz(10), z(1), f
    complex*16 res(1) 
    integer Ndz, i
        call outPoints(c44, e24, eps22, rho, h, 4)
        open(1, file='dCurves.txt', FORM='FORMATTED'); write(1, '(A)') "% f, dz, f/dz, dz/f, residue";
        do f = fmin, fmax, fstep
            w = 2d0*pi*f; z = 0d0;
            call Hamin(haminDelta,smin,smax,hs,eps,10,dz,Ndz)
            do i = 1, Ndz
                call resK(h, eps0, eps11, eps22, e15, e24, c44, c55, rho, w, dz(i), 1d-4, res, z, 1) !  *   *  *   проверка полюсов вычетом
                if ( abs(res(1)) > 1d-4 ) write(1, '(7E15.6E3)') f, dz(i), f/dz(i),  dz(i)/f, abs(res(1)), Ndz*1d0 
            enddo
        enddo 
        close(1)
    end subroutine plotDcurves 
    
    
    
    
    subroutine plotAllCurves(fmax)
    implicit none
    real*8 Sf(4), Sdzeta(4), Af(4), Adzeta(4), fmax
    namelist/Ycut/ Sf, Sdzeta, Af, Adzeta
        open(unit=1,file='startPoints.txt',status='old')
        read(1, Ycut); close(1);
     
        open(1, file="C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\DispSurfer2\S0.txt", FORM='FORMATTED');
        open(2, file="C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\DispSurfer2\S1.txt", FORM='FORMATTED');
        open(3, file="C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\DispSurfer2\S2.txt", FORM='FORMATTED');
        open(4, file="C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\DispSurfer2\S3.txt", FORM='FORMATTED');
        open(5, file="C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\DispSurfer2\S4.txt", FORM='FORMATTED');
        open(6, file="C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\DispSurfer2\S5.txt", FORM='FORMATTED');
    
        open(7, file="C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\DispSurfer2\A0.txt", FORM='FORMATTED');
        open(8, file="C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\DispSurfer2\A1.txt", FORM='FORMATTED');
        open(9, file="C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\DispSurfer2\A2.txt", FORM='FORMATTED');
        open(10, file="C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\DispSurfer2\A3.txt", FORM='FORMATTED');
        open(11, file="C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\DispSurfer2\A4.txt", FORM='FORMATTED');
        open(12, file="C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\DispSurfer2\A5.txt", FORM='FORMATTED');
    
        
        do i = 1, 4
            call DispSurfer2(Sf(i), Sdzeta(i), 1d-3, fmax, i); print*, 'S', i-1, ' curve done';
            call DispSurfer2(Af(i), Adzeta(i), 1d-3, fmax, i + 6); print*, 'A', i-1, ' curve done';
        enddo
                

        close(1); close(2); close(3); close(4); close(5); close(6);
    end subroutine plotAllCurves
    
    
    
    subroutine DispSurfer2(startf, startDzeta, step, fmax, file)
    implicit none
    integer  Ndz, choice, iterno, j, file
    real*8 startf, startDzeta, newf, newdzeta, step, fmax, dz(4), psi, z(1)
    complex*16 res(1)
        !                                                                    первые шаги, подготовка к автоматике
        DispSurferStep = step; DispSurferf = startf; DispSurferDzeta = startDzeta;
        call Hamin(arcDelta, 0d0, pi, 1d-3, 1d-7, 10, dz, Ndz)
        newdzeta = sin(dz(1))*DispSurferStep + DispSurferDzeta; newf = cos(dz(1))*DispSurferStep + DispSurferf;
        psi = atan( (newf-DispSurferf)/(newdzeta-DispSurferDzeta) );      
        w = 2d0*pi*newf; z= 0d0;       
        call resK(h, eps0, eps11, eps22, e15, e24, c44, c55, rho, w, newdzeta, 1d-4, res, z, 1)
        write(file, '(4E15.6E3)') newf, newdzeta, 0d0, abs(res(1))
        DispSurferf = newf; DispSurferDzeta = newdzeta;
        do !                                                                   автоматический режим
            iterno= 0;
            do
                call Hamin(arcDelta, -psi, pi-psi, 1d-3, 1d-7, 4, dz, Ndz)
                if (Ndz>1) then
                    print*, Ndz
                    choice = 1; 
                    do j = 2, Ndz
                        if ( abs(dz(j)-(pi/2d0 - psi)) < abs(dz(j-1)-(pi/2d0 - psi)) ) choice = j
                    enddo
                    exit;
                else
                    if (DispSurferStep < step) DispSurferStep = DispSurferStep*2d0
                     choice = 1; exit;
                endif    
                iterno = iterno + 1; if (iterno > 5) exit;
            enddo
            newdzeta = sin(dz(choice))*DispSurferStep + DispSurferDzeta; newf = cos(dz(choice))*DispSurferStep + DispSurferf;
            w = 2d0*pi*newf; z= 0d0;        
            call resK(h, eps0, eps11, eps22, e15, e24, c44, c55, rho, w, newdzeta, 1d-4, res, z, 1)
            write(file, '(4E15.6E3)') newf, newdzeta, 0d0, abs(res(1))
            psi = atan( (newf-DispSurferf)/(newdzeta-DispSurferDzeta) ); DispSurferf = newf; DispSurferDzeta = newdzeta;
            if (newf>fmax) exit;
        enddo 
    end subroutine DispSurfer2
    
    
    
    real*8 function arcDelta(angle)
    implicit none
    real*8 angle, alfa
    complex*16 alfa_c, C(4,4), R(4,4),  a(4), sigma(2), p(2), B(4,4), t(4,1)
        alfa = sin(angle)*DispSurferStep + DispSurferDzeta
        w = 2d0*pi*(cos(angle)*DispSurferStep + DispSurferf)
        alfa_c = alfa*(1d0,0d0)
        t(1,1) = 1d0; t(2,1) = 0d0; t(3,1) = 0d0; t(4,1) = 0d0
        call makeA(rho, eps22, eps11, e24, e15, c44, c55, w, alfa_c, a)
        call makeSigma(a, sigma)
        call makeP(sigma, a, p)
        call makeB(h, eps0, eps22, e24, c44, alfa_c, p, sigma, B)
        call STAR5(B,t,C,R,4,4,1,3) 
        arcDelta = 1d0/(  abs(t(1,1)) + abs(t(2,1)) + abs(t(3,1)) + abs(t(4,1))  ) 
    end
    
    
    
    SUBROUTINE u_integrand(alfa, s, n)
        implicit none;
        integer n, i
        complex*16 alfa, s(n), sigma(2), Q, t(4,1), a(4), p(2), B(4,4), C(4,4), R(4,4), U 
            Q = 1d0
            t = 0d0; t(1,1) = Q
            call makeA(rho, eps22, eps11, e24, e15, c44, c55, w, alfa, a)
            call makeSigma(a, sigma)
            call makeP(sigma, a, p)
            call makeB(h, eps0, eps22, e24, c44, alfa, p, sigma, B)
            call STAR5(B,t,C,R,4,4,1,2)
            do i = 1, n
                call makeU(z(i), sigma, t, U)
                s(i) = U*exp(-ci*alfa*x(i)) + U*exp(ci*alfa*x(i))
                s(i) = s(i)/(2d0*pi)
            enddo     
    END SUBROUTINE u_integrand
    
    
    SUBROUTINE plotU
    implicit none
    integer Ndz, i, j, m
    real*8 t1,t2,t3,t4,tm,tp,eps,step,IntLimit, dz(10), ht
    complex*16 K(pointsNum), Usym(pointsNum)
        open(1, file='u.txt', FORM='FORMATTED'); open(2, file='uRes.txt', FORM='FORMATTED');
        write(1, '(A)') "% x(i), z(i), f(m), real(u(i)), imag(u(i)), abs(u(i))"; write(2, '(A)') "% x(i), z(i), f(m), real(u(i)), imag(u(i)), abs(u(i))";
        do m = 1, freqNum
            w = f(m)*2d0*pi;
            ht = 1d-4
            call Hamin(haminDelta,dzetaMin, dzetaMax, haminStep, haminEps, 10, dz, Ndz)
            tm = 2d-1; tp = 0d0; eps = 1d-6; step = 1d-2; IntLimit = 1d5   
            t1 = dz(1)*0.5d0; t2=t1; t3 = t1; t4 = dz(Ndz)+1.5d0;
            call dinn5(u_integrand,t1,t2,t3,t4,tm,tp,eps,step,IntLimit,pointsNum,u)  
            uRes = 0d0
            do i = 1, Ndz
                call resK(h, eps0, eps11, eps22, e15, e24, c44, c55, rho, w, dz(i), ht, K, z, pointsNum)
                do j = 1, pointsNum
                    if (x(j)<0d0) then
                        Usym(j) = ci*K(j)*exp(-(0d0,1d0)*dz(i)*x(j))
                    else
                        Usym(j) = ci*K(j)*exp((0d0,1d0)*dz(i)*x(j))
                    endif
                enddo 
                uRes = uRes + Usym
            enddo
            do i = 1, pointsNum
                write(1, '(10E15.6E3)') x(i), z(i), f(m), real(u(i)), imag(u(i)), abs(u(i))
                write(2, '(10E15.6E3)') x(i), z(i), f(m), real(uRes(i)), imag(uRes(i)), abs(uRes(i))
            enddo
        enddo    
        close(1); close(2); 
    END SUBROUTINE plotU
    
      

    
    
    SUBROUTINE plotResModSum
    implicit none
    integer Ndz, i, j, m
    real*8 z(1), dz(10), ht, resSum
    complex*16 K(1), Usym(pointsNum)
        open(1, file='ResModSum.txt', FORM='FORMATTED');
        write(1, '(A)') "% f(i), residues abs sum"; 
        do m = 1, freqNum
            w = f(m)*2d0*pi;
            ht = 1d-4
            z = 0d0
            call Hamin(haminDelta,dzetaMin, dzetaMax, haminStep, haminEps, 10, dz, Ndz)
            resSum = 0d0
            do i = 1, Ndz
                call resK(h, eps0, eps11, eps22, e15, e24, c44, c55, rho, w, dz(i), ht, K, z, 1)
                resSum = resSum + abs(K(1))
            enddo
            write(1, '(3E15.6E3)') f(m), resSum
        enddo    
        close(1); close(2); 
    END SUBROUTINE plotResModSum
    
    
    
    
    
    
    
    
    subroutine DispSurfer(cutOffx, cutOffy, step, pointsNum)
    implicit none
    integer pointsNum, Ndz, i, choice, iterno, j
    real*8 cutOffx, cutOffy, step, f(pointsNum), dzeta(pointsNum), dz(4), psi, z(1)
    complex*16 res(1)
!                                                                    первые шаги, подготовка к автоматике    
        f(1) = cutOffx; dzeta(1) = cutOffy; 
        DispSurferStep = step; DispSurferf = f(1); DispSurferDzeta = dzeta(1);
        call Hamin(arcDelta, 0d0, pi, 1d-3, 1d-7, 10, dz, Ndz)
        dzeta(2) = sin(dz(1))*DispSurferStep + DispSurferDzeta; f(2) = cos(dz(1))*DispSurferStep + DispSurferf;
!                                                                   автоматический режим 
        i = 3; 
        do i = 3, pointsNum
            iterno = 0;
            DispSurferf = f(i-1); DispSurferDzeta = dzeta(i-1);     ! задаем точку, откуда ищем полюса 
            psi = atan( (f(i-1)-f(i-2))/(dzeta(i-1)-dzeta(i-2)) );  ! находим пи - азимут курса
            do
                call Hamin(arcDelta, -psi, pi-psi, 1d-3, 1d-7, 4, dz, Ndz)
                if (Ndz>1) then
                    print*, Ndz
                    choice = 1; 
                    do j = 2, Ndz
                        if ( abs(dz(j)-(pi/2d0 - psi)) < abs(dz(j-1)-(pi/2d0 - psi)) ) choice = j
                    enddo
                    exit;
                else
                    if (DispSurferStep < step) DispSurferStep = DispSurferStep*2d0
                    choice = 1; exit;
                endif    
                iterno = iterno + 1; if (iterno > 5) exit;
            enddo
            dzeta(i) = sin(dz(choice))*DispSurferStep + DispSurferDzeta; f(i) = cos(dz(choice))*DispSurferStep + DispSurferf;
        enddo 
!                                                                   вывод результатов        
        open(1, file='dispSurfer.txt', FORM='FORMATTED');
        do i = 1, pointsNum
            w = 2d0*pi*f(i)
            z= 0d0;
            call resK(h, eps0, eps11, eps22, e15, e24, c44, c55, rho, w, dzeta(i), 1d-4, res, z, 1)
            write(1, '(4E15.6E3)') f(i), dzeta(i), 0d0, abs(res(1))
        enddo
        close(1)
    end subroutine DispSurfer
    
    
    
    !!  T E S T   R O U T I N E S 
    
    
    
    SUBROUTINE test_integrand(alfa, s, n)
        implicit none;
        integer n, i
        complex*16 alfa, s(n) 
            do i = 1, n
                s(i) = cos(z(i))/(alfa**2 - 4d0)*exp(-ci*alfa*x(i)) + cos(z(i))/(alfa**2 - 4d0)*exp(ci*alfa*x(i))
                s(i) = s(i)/(2d0*pi)
            enddo     
    END SUBROUTINE test_integrand
    
    
    SUBROUTINE plotTestField
    implicit none
    integer Ndz, i
    real*8 t1,t2,t3,t4,tm,tp,eps,step,IntLimit
        open(1, file='testFieldInt.txt', FORM='FORMATTED')
        t1 = 0d0 
        t2 = 0d0 
        t3 = 0d0 
        t4 = 0d0 
        tm = 2d-2 
        tp = 0d0 
        eps = 1d-6
        step = 1d-2 
        IntLimit = 1d5
        t1 = 1d0; t2=t1; t3 = t1;
        t4 = 3d0
        call dinn5(test_integrand,t1,t2,t3,t4,tm,tp,eps,step,IntLimit,pointsNum,u)  
        do i = 1, pointsNum
            write(1, '(10E15.6E3)') x(i), z(i), real(u(i)), imag(u(i)), abs(u(i))
        enddo
        close(1)
    END SUBROUTINE plotTestField
    
    
    
    SUBROUTINE plotTestRes
    implicit none
    integer Ndz, i, j
    real*8 dz(10), ht
    complex*16 K(200), Usym(200)
    complex*16 sigma(2), Q, t(4,1), a(4), p(2), B(4,4), C(4,4), R(4,4)
        open(1, file='testRes.txt', FORM='FORMATTED')
        u = 0d0
        ht = 1d-7

        do j = 1, pointsNum
            Usym(j) = ht/2d0*(1d0/( (2d0+ht)**2 - 4d0 ) - 1d0/( (2d0-ht)**2 - 4d0 ) )*cos(z(j))*exp(-ci*2d0*x(j))
        enddo 
                       
        u = (0d0,1d0)*Usym
        
        do i = 1, pointsNum
            write(1, '(10E15.6E3)') x(i), z(i), real(u(i)), imag(u(i)), abs(u(i))
        enddo
        close(1)
    END SUBROUTINE plotTestRes
    
    
    
    SUBROUTINE testBoundary(alfaMin, alfaMax, alfaStep)
    real*8 alfaMin, alfaMax, alfaStep, alfa, w, Q
    complex*16 a(4), sigma(2), p(2), t(4,1), B(4,4), alfa_c, C(4,4), R(4,4)
    complex*16 U, Fi, dU, dFi
    complex*16 Il, Ir, IIl, IIr, IIIl, IIIr, IVl, IVr
        open(1, file='boundaryTest.txt', FORM='FORMATTED')
        do alfa = alfaMin, alfaMax, alfaStep
            alfa_c =(1d0,0d0)*alfa
            w = 7d0*2d0*pi
            Q = 1d3
            t = 0d0
            t(1,1) = Q
            
            call makeA(rho, eps22, eps11, e24, e15, c44, c55, w, alfa_c, a)
            call makeSigma(a, sigma)
            call makeP(sigma, a, p)
            call makeB(h, eps0, eps22, e24, c44, alfa_c, p, sigma, B)
            call STAR5(B,t,C,R,4,4,1,2)
            
            call makeU(0d0, sigma, t, U)
            call makeFi(0d0, sigma, t, p, Fi)
            call makedU(0d0, sigma, t, dU)
            call makedFi(0d0, sigma, t, p, dFi)
            Il = c44*dU; Ir = Q - e24*dFi;
            IIIl = eps0*alfa*Fi; IIIr = eps22*dFi - e24*dU;
            
            call makeU(-h, sigma, t, U)
            call makeFi(-h, sigma, t, p, Fi)
            call makedU(-h, sigma, t, dU)
            call makedFi(-h, sigma, t, p, dFi)
            IIl = c44*dU; IIr = -e24*dFi
            IVl = eps0*alfa*Fi; IVr = -eps22*dFi + e24*dU
!                                   1       2           3       4           5       6           7           8       9           10          11          12          13          14          15          16          17        
            write(1, '(17E15.6E3)') alfa, real(Il), real(Ir), imag(Il), imag(Ir), real(IIl), real(IIr), imag(IIl), imag(IIr), real(IIIl), real(IIIr), imag(IIIl), imag(IIIr), real(IVl), real(IVr), imag(IVl), imag(IVr)
        enddo 
        close(1)
    END SUBROUTINE testBoundary
    
    
    !                                           Вторые производные полей
    SUBROUTINE dz2u_integrand(alfa, s, n)
        implicit none;
        integer n, i
        complex*16 alfa, s(n), sigma(2), Q, t(4,1), a(4), p(2), B(4,4), C(4,4), R(4,4), dz2U 

            Q = 1d0
            t = 0d0
            t(1,1) = Q
            
            call makeA(rho, eps22, eps11, e24, e15, c44, c55, w, alfa, a)
            call makeSigma(a, sigma)
            call makeP(sigma, a, p)
            call makeB(h, eps0, eps22, e24, c44, alfa, p, sigma, B)
            call STAR5(B,t,C,R,4,4,1,2)
            
            do i = 1, n
                call maked2U(z(i), sigma, t, dz2U)
                s(i) = dz2U*exp(-ci*alfa*x(i)) + dz2U*exp(ci*alfa*x(i))
                s(i) = s(i)/(2d0*pi)
            enddo     
    END SUBROUTINE dz2u_integrand
    
    
    SUBROUTINE dz2phi_integrand(alfa, s, n)
        implicit none;
        integer n, i
        complex*16 alfa, s(n), sigma(2), Q, t(4,1), a(4), p(2), B(4,4), C(4,4), R(4,4), dz2Phi 

            Q = 1d0
            t = 0d0
            t(1,1) = Q
            
            call makeA(rho, eps22, eps11, e24, e15, c44, c55, w, alfa, a)
            call makeSigma(a, sigma)
            call makeP(sigma, a, p)
            call makeB(h, eps0, eps22, e24, c44, alfa, p, sigma, B)
            call STAR5(B,t,C,R,4,4,1,2)
            
            do i = 1, n
                call maked2Fi(z(i), sigma, t, p, dz2Phi)
                s(i) = dz2Phi*exp(-ci*alfa*x(i)) + dz2Phi*exp(ci*alfa*x(i))
                s(i) = s(i)/(2d0*pi)
            enddo     
    END SUBROUTINE dz2phi_integrand
    
    
    SUBROUTINE dx2u_integrand(alfa, s, n)
        implicit none;
        integer n, i
        complex*16 alfa, s(n), sigma(2), Q, t(4,1), a(4), p(2), B(4,4), C(4,4), R(4,4), U 

            Q = 1d0
            t = 0d0
            t(1,1) = Q
            
            call makeA(rho, eps22, eps11, e24, e15, c44, c55, w, alfa, a)
            call makeSigma(a, sigma)
            call makeP(sigma, a, p)
            call makeB(h, eps0, eps22, e24, c44, alfa, p, sigma, B)
            call STAR5(B,t,C,R,4,4,1,2)
            
            do i = 1, n
                call makeU(z(i), sigma, t, U)
                s(i) = -alfa**2*U*exp(-ci*alfa*x(i)) - alfa**2*U*exp(ci*alfa*x(i))
                s(i) = s(i)/(2d0*pi)
            enddo     
    END SUBROUTINE dx2u_integrand
    
    
    SUBROUTINE dx2phi_integrand(alfa, s, n)
        implicit none;
        integer n, i
        complex*16 alfa, s(n), sigma(2), Q, t(4,1), a(4), p(2), B(4,4), C(4,4), R(4,4), Fi 

            Q = 1d0
            t = 0d0
            t(1,1) = Q
            
            call makeA(rho, eps22, eps11, e24, e15, c44, c55, w, alfa, a)
            call makeSigma(a, sigma)
            call makeP(sigma, a, p)
            call makeB(h, eps0, eps22, e24, c44, alfa, p, sigma, B)
            call STAR5(B,t,C,R,4,4,1,2)
            
            do i = 1, n
                call makeFi(z(i), sigma, t, p, Fi)
                s(i) = -alfa**2*Fi*exp(-ci*alfa*x(i)) - alfa**2*Fi*exp(ci*alfa*x(i))
                s(i) = s(i)/(2d0*pi)
            enddo     
    END SUBROUTINE dx2phi_integrand

        !                                           Первые производные полей
    SUBROUTINE dzu_integrand(alfa, s, n)
        implicit none;
        integer n, i
        complex*16 alfa, s(n), sigma(2), Q, t(4,1), a(4), p(2), B(4,4), C(4,4), R(4,4), dzU 

            Q = 1d0
            t = 0d0
            t(1,1) = Q
            
            call makeA(rho, eps22, eps11, e24, e15, c44, c55, w, alfa, a)
            call makeSigma(a, sigma)
            call makeP(sigma, a, p)
            call makeB(h, eps0, eps22, e24, c44, alfa, p, sigma, B)
            call STAR5(B,t,C,R,4,4,1,2)
            
            do i = 1, n
                call makedU(z(i), sigma, t, dzU)
                s(i) = dzU*exp(-ci*alfa*x(i)) + dzU*exp(ci*alfa*x(i))
                s(i) = s(i)/(2d0*pi)
            enddo     
    END SUBROUTINE dzu_integrand
    
    
    SUBROUTINE dzphi_integrand(alfa, s, n)
        implicit none;
        integer n, i
        complex*16 alfa, s(n), sigma(2), Q, t(4,1), a(4), p(2), B(4,4), C(4,4), R(4,4), dzPhi 

            Q = 1d0
            t = 0d0
            t(1,1) = Q
            
            call makeA(rho, eps22, eps11, e24, e15, c44, c55, w, alfa, a)
            call makeSigma(a, sigma)
            call makeP(sigma, a, p)
            call makeB(h, eps0, eps22, e24, c44, alfa, p, sigma, B)
            call STAR5(B,t,C,R,4,4,1,2)
            
            do i = 1, n
                call makedFi(z(i), sigma, t, p, dzPhi)
                if (alfa==0d0) dzPhi = 0d0
                s(i) = dzPhi*exp(-ci*alfa*x(i)) + dzPhi*exp(ci*alfa*x(i))
                s(i) = s(i)/(2d0*pi)
            enddo     
    END SUBROUTINE dzphi_integrand
    
    
    SUBROUTINE dxu_integrand(alfa, s, n)
        implicit none;
        integer n, i
        complex*16 alfa, s(n), sigma(2), Q, t(4,1), a(4), p(2), B(4,4), C(4,4), R(4,4), U 

            Q = 1d0
            t = 0d0
            t(1,1) = Q
            
            call makeA(rho, eps22, eps11, e24, e15, c44, c55, w, alfa, a)
            call makeSigma(a, sigma)
            call makeP(sigma, a, p)
            call makeB(h, eps0, eps22, e24, c44, alfa, p, sigma, B)
            call STAR5(B,t,C,R,4,4,1,2)
            
            do i = 1, n
                call makeU(z(i), sigma, t, U)
                s(i) = -ci*alfa*U*exp(-ci*alfa*x(i)) + ci*alfa*U*exp(ci*alfa*x(i))
                s(i) = s(i)/(2d0*pi)
            enddo     
    END SUBROUTINE dxu_integrand
    
    
    SUBROUTINE dxphi_integrand(alfa, s, n)
        implicit none;
        integer n, i
        complex*16 alfa, s(n), sigma(2), Q, t(4,1), a(4), p(2), B(4,4), C(4,4), R(4,4), Fi 

            Q = 1d0
            t = 0d0
            t(1,1) = Q
            
            call makeA(rho, eps22, eps11, e24, e15, c44, c55, w, alfa, a)
            call makeSigma(a, sigma)
            call makeP(sigma, a, p)
            call makeB(h, eps0, eps22, e24, c44, alfa, p, sigma, B)
            call STAR5(B,t,C,R,4,4,1,2)
            
            do i = 1, n
                call makeFi(z(i), sigma, t, p, Fi)
                if (alfa==0d0) Fi = 0d0
                s(i) = -ci*alfa*Fi*exp(-ci*alfa*x(i)) + ci*alfa*Fi*exp(ci*alfa*x(i))
                s(i) = s(i)/(2d0*pi)
            enddo     
    END SUBROUTINE dxphi_integrand

    
    SUBROUTINE testEq
    implicit none
    integer Ndz, i
    real*8 t1,t2,t3,t4,tm,tp,eps,step,IntLimit, dz(10)
    complex*16 dz2u(200), dx2u(200), dz2fi(200), dx2fi(200)
        open(1, file='testEq.txt', FORM='FORMATTED')
        w = 2d0*2d0*pi
        t1 = 0d0 
        t2 = 0d0 
        t3 = 0d0 
        t4 = 0d0 
        tm = 2d-2 
        tp = 0d0 
        eps = 1d-6
        step = 1d-2 
        IntLimit = 1d5
        call Hamin(haminDelta,dzetaMin, dzetaMax, haminStep, haminEps, 10, dz, Ndz)
        t1 = dz(1)*0.5d0; t2=t1; t3 = t1;
        t4 = dz(Ndz)+1.5d0
        
        !call dinn5(dx2u_integrand,t1,t2,t3,t4,tm,tp,eps,step,IntLimit,200,dx2u)
        call dinn5(dz2u_integrand,t1,t2,t3,t4,tm,tp,eps,step,IntLimit,200,dz2u) 
        
        !call dinn5(dz2phi_integrand,t1,t2,t3,t4,tm,tp,eps,step,IntLimit,200,dz2fi)
        !call dinn5(dx2phi_integrand,t1,t2,t3,t4,tm,tp,eps,step,IntLimit,200,dx2fi)
        do i = 1, 200
            write(1, '(10E15.6E3)') x(i), z(i), real(c55*dx2u(i) + c44*dz2u(i) + e15*dx2fi(i) + e24*dz2fi(i)), real(-rho*w**2*u(i))
        enddo
        close(1)
    END SUBROUTINE testEq
    
    
    
    SUBROUTINE testBound
    implicit none
    integer Ndz, i
    real*8 t1,t2,t3,t4,tm,tp,eps,step,IntLimit, dz(10)
    complex*16 dzu(200), dxu(200), dzfi(200), dxfi(200)
    complex*16 Il(200), Ir(200), IIl(200), IIr(200), IIIl(200), IIIr(200), IVl(200), IVr(200)
        open(1, file='testEq.txt', FORM='FORMATTED')
        w = 2d0*2d0*pi
        
        t1 = 0d0 
        t2 = 0d0 
        t3 = 0d0 
        t4 = 0d0 
        tm = 2d-2 
        tp = 0d0 
        eps = 1d-6
        step = 1d-2 
        IntLimit = 1d5
        call Hamin(haminDelta,dzetaMin, dzetaMax, haminStep, haminEps, 10, dz, Ndz)
        t1 = dz(1)*0.5d0; t2=t1; t3 = t1;
        t4 = dz(Ndz)+1.5d0
        
        z = 0               
        call dinn5(dxu_integrand,t1,t2,t3,t4,tm,tp,eps,step,IntLimit,200,dxu)
        call dinn5(dzu_integrand,t1,t2,t3,t4,tm,tp,eps,step,IntLimit,200,dzu)     
        call dinn5(dzphi_integrand,t1,t2,t3,t4,tm,tp,eps,step,IntLimit,200,dzfi)
        call dinn5(dxphi_integrand,t1,t2,t3,t4,tm,tp,eps,step,IntLimit,200,dxfi)     
        Il = c44*dzu; Ir = -e24*dzfi;
        IIIl = dxfi*eps0; IIIr = ci*e24*dzu - ci*eps22*dzfi;
        
        z = -h               
        call dinn5(dxu_integrand,t1,t2,t3,t4,tm,tp,eps,step,IntLimit,200,dxu)
        call dinn5(dzu_integrand,t1,t2,t3,t4,tm,tp,eps,step,IntLimit,200,dzu)     
        call dinn5(dzphi_integrand,t1,t2,t3,t4,tm,tp,eps,step,IntLimit,200,dzfi)
        call dinn5(dxphi_integrand,t1,t2,t3,t4,tm,tp,eps,step,IntLimit,200,dxfi)  
        IIl = c44*dzu; IIr = -e24*dzfi;
        IVl = dxfi*eps0; IVr = ci*eps22*dzfi - ci*e24*dzu
        
        
        do i = 1, 200!                 1    2       3               4           5           6           7               8          9                10          11                  12          13          14                  15          16          17              18  
            write(1, '(18E15.6E3)') x(i), z(i), real(Il(i)), real(Ir(i)), imag(Il(i)), imag(Ir(i)), real(IIl(i)), real(IIr(i)), imag(IIl(i)), imag(IIr(i)), real(IIIl(i)), real(IIIr(i)), imag(IIIl(i)), imag(IIIr(i)), real(IVl(i)), real(IVr(i)), imag(IVl(i)), imag(IVr(i))
        enddo
        close(1)
    END SUBROUTINE testBound
    
end program pz4

