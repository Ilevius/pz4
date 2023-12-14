        !COMPILER-GENERATED INTERFACE MODULE: Wed Nov 15 17:27:14 2023
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE DGAUS__genmod
          INTERFACE 
            SUBROUTINE DGAUS(A,ND,N,CD)
              INTEGER(KIND=4) :: ND
              COMPLEX(KIND=8) :: A(ND,ND)
              INTEGER(KIND=4) :: N
              COMPLEX(KIND=8) :: CD
            END SUBROUTINE DGAUS
          END INTERFACE 
        END MODULE DGAUS__genmod
