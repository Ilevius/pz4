        !COMPILER-GENERATED INTERFACE MODULE: Sat Dec 02 22:26:12 2023
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE MAKEB__genmod
          INTERFACE 
            SUBROUTINE MAKEB(H,EPS0,EPS22,E24,C44,ALFA,P,SIGMA,B)
              REAL(KIND=8) :: H
              REAL(KIND=8) :: EPS0
              REAL(KIND=8) :: EPS22
              REAL(KIND=8) :: E24
              REAL(KIND=8) :: C44
              COMPLEX(KIND=8) :: ALFA
              COMPLEX(KIND=8) :: P(2)
              COMPLEX(KIND=8) :: SIGMA(2)
              COMPLEX(KIND=8) :: B(4,4)
            END SUBROUTINE MAKEB
          END INTERFACE 
        END MODULE MAKEB__genmod
