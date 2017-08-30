!======================================================================
!
!     NAME : PF5D1.F
!
!     AUTHOR : YI-WEI, CHANG
!
!     DESCRIPTION : PERIODIC FIRST SUBDIFFERENTIAL FORMULA OF FIFTH 
!                   ORDER FINITE DIFFERENCE

      SUBROUTINE PF5D1(MX, H, Y, YD)
      INCLUDE "/pub2/yiwei/1_fortran/code/mtcal/F5D_COEF.F"
      DIMENSION Y(MX), YD(MX)
 
!$OMP PARALLEL DO
!$OMP+PRIVATE(I,IM3,IM2,IM1,IP1,IP2,IP3,TP1,TP2,TP3,TP4,TP5,TP6)
!$OMP+SHARED(Y,YD)
      DO I = 1, MX
      IM3 = I-3
      IM2 = I-2
      IM1 = I-1
      IP1 = I+1
      IP2 = I+2
      IP3 = I+3

      IF     (IM3 .EQ.   -2) THEN
      IM3 = MX-2
      IM2 = MX-1
      IM1 = MX
      ELSEIF (IM3 .EQ.   -1) THEN
      IM3 = MX-1
      IM2 = MX
      ELSEIF (IM3 .EQ.    0) THEN
      IM3 = MX
      ELSEIF (IP3 .EQ. MX+1) THEN
      IP3 = 1
      ELSEIF (IP3 .EQ. MX+2) THEN
      IP3 = 2
      IP2 = 1
      ELSEIF (IP3 .EQ. MX+3) THEN
      IP3 = 3
      IP2 = 2
      IP1 = 1
      ENDIF

      CALL DIFAB(0.D0,           F5D1C3*Y(IM3), TP1)
      CALL DIFAB(F5D1C2*Y(IM2),  F5D1C1*Y(IM1), TP2)
      CALL DIFAB(F5D1C1*Y(IP1),  F5D1C2*Y(IP2), TP3)
      CALL DIFAB(F5D1C3*Y(IP3),  0.D0,          TP4)  
      CALL DIFAB(TP1,           -TP2,           TP5)
      CALL DIFAB(TP3,           -TP4,           TP6)
      CALL DIFAB(TP5,           -TP6,         YD(I))
      YD(I) = YD(I) / H
      ENDDO
!$OMP END PARALLEL DO      
      END
