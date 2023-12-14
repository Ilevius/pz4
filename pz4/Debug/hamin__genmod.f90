        !COMPILER-GENERATED INTERFACE MODULE: Wed Nov 15 17:34:57 2023
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE HAMIN__genmod
          INTERFACE 
            SUBROUTINE HAMIN(F,SMIN,SMAX,HS,EPS,NMAX,DZ,NDZ)
              INTEGER(KIND=4) :: NMAX
              REAL(KIND=8) :: F
              EXTERNAL F
              REAL(KIND=8) :: SMIN
              REAL(KIND=8) :: SMAX
              REAL(KIND=8) :: HS
              REAL(KIND=8) :: EPS
              REAL(KIND=8) :: DZ(NMAX)
              INTEGER(KIND=4) :: NDZ
            END SUBROUTINE HAMIN
          END INTERFACE 
        END MODULE HAMIN__genmod
