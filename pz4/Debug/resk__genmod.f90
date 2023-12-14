        !COMPILER-GENERATED INTERFACE MODULE: Sat Dec 02 22:26:12 2023
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE RESK__genmod
          INTERFACE 
            SUBROUTINE RESK(H,EPS0,EPS11,EPS22,E15,E24,C44,C55,RHO,W,DZ,&
     &HT,RES,Z,N)
              INTEGER(KIND=4) :: N
              REAL(KIND=8) :: H
              REAL(KIND=8) :: EPS0
              REAL(KIND=8) :: EPS11
              REAL(KIND=8) :: EPS22
              REAL(KIND=8) :: E15
              REAL(KIND=8) :: E24
              REAL(KIND=8) :: C44
              REAL(KIND=8) :: C55
              REAL(KIND=8) :: RHO
              REAL(KIND=8) :: W
              REAL(KIND=8) :: DZ
              REAL(KIND=8) :: HT
              COMPLEX(KIND=8) :: RES(N)
              REAL(KIND=8) :: Z(N)
            END SUBROUTINE RESK
          END INTERFACE 
        END MODULE RESK__genmod
