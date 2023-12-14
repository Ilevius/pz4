        !COMPILER-GENERATED INTERFACE MODULE: Mon Dec 04 15:36:09 2023
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE MAKEDFI__genmod
          INTERFACE 
            SUBROUTINE MAKEDFI(Z,SIGMA,T,P,DFI)
              REAL(KIND=8) :: Z
              COMPLEX(KIND=8) :: SIGMA(2)
              COMPLEX(KIND=8) :: T(4)
              COMPLEX(KIND=8) :: P(2)
              COMPLEX(KIND=8) :: DFI
            END SUBROUTINE MAKEDFI
          END INTERFACE 
        END MODULE MAKEDFI__genmod
