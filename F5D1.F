!======================================================================
!
!
!     NAME : F5D1.F
!
!     AUTHOR : YI-WEI, CHANG
!
!     DESCRIPTION : FIRST DIFFERENTIAL OF FIFTH ORDER FINITE DIFFERENCE

      SUBROUTINE F5D1(NX, H, Y, YD)
      INCLUDE "F5D_COEF.F"
      DIMENSION :: Y(NX), YD(NX)

 
!$OMP PARALLEL DO
!$OMP+PRIVATE(I,TP1,TP2,TP3,TP4,TP5,TP6)
!$OMP+SHARED(Y,YD)
      DO I = 1, NX
      IF (I <= 3) THEN
!      INCLUDE "F5D1_F.F"
      CALL DIFAB(0.D0,           F5D1FB0*Y(I),  TP1)
      CALL DIFAB(F5D1FB1*Y(I+1), F5D1FB2*Y(I+2),TP2)
      CALL DIFAB(F5D1FB3*Y(I+3), F5D1FB4*Y(I+4),TP3)
      CALL DIFAB(F5D1FB5*Y(I+5), F5D1FB6*Y(I+6),TP4)
      CALL DIFAB(TP1,           -TP2,           TP5)
      CALL DIFAB(TP3,           -TP4,           TP6)
      CALL DIFAB(TP5,           -TP6,         YD(I))
      YD(I) = YD(I) / H
      ELSEIF (I >= NX-2) THEN
!      INCLUDE "F5D1_B.F"            
      CALL DIFAB(F5D1FB0*Y(I),   F5D1FB1*Y(I-1),TP1)
      CALL DIFAB(F5D1FB2*Y(I-2), F5D1FB3*Y(I-3),TP2)
      CALL DIFAB(F5D1FB4*Y(I-4), F5D1FB5*Y(I-5),TP3)
      CALL DIFAB(F5D1FB6*Y(I-6), 0.D0,          TP4)                  
      CALL DIFAB(TP1,           -TP2,           TP5)
      CALL DIFAB(TP3,           -TP4,           TP6)
      CALL DIFAB(TP5,           -TP6,         YD(I))
      YD(I) = YD(I) / H
      ELSE
!      INCLUDE "F5D1_C.F" 
      CALL DIFAB(0.D0,           F5D1C3*Y(I-3), TP1)
      CALL DIFAB(F5D1C2*Y(I-2),  F5D1C1*Y(I-1), TP2)
      CALL DIFAB(F5D1C1*Y(I+1),  F5D1C2*Y(I+2), TP3)
      CALL DIFAB(F5D1C3*Y(I+3),  0.D0,          TP4)  
      CALL DIFAB(TP1,           -TP2,           TP5)
      CALL DIFAB(TP3,           -TP4,           TP6)
      CALL DIFAB(TP5,           -TP6,         YD(I))
      YD(I) = YD(I) / H
      ENDIF
      ENDDO      
!$OMP END PARALLEL DO      
      END
