!======================================================================
!
!     NAME : F5D2.F
!
!     AUTHOR : YI-WEI, CHANG
!
!     DESCRIPTION : SECONDON ORDER SUBDIFFERENTIAL OF FIFTH ORDER 
!                   FINITE DIFFERENCE

      SUBROUTINE F5D2(NX, H, Y, YD)
      INCLUDE "/pub2/yiwei/KH/code/mtcal/F5D_COEF.F"
      DIMENSION :: Y(NX), YD(NX)

 
!$OMP PARALLEL DO
!$OMP+PRIVATE(I,TP1,TP2,TP3,TP4,TP5,TP6)
!$OMP+SHARED(Y,YD)
      DO I = 1, NX
      IF (I <= 3) THEN
      CALL DIFAB(F5D2FB0*Y(I),   F5D2FB1*Y(I+1),TP1)
      CALL DIFAB(F5D2FB2*Y(I+2), F5D2FB3*Y(I+3),TP2)
      CALL DIFAB(F5D2FB4*Y(I+4), F5D2FB5*Y(I+5),TP3)
      CALL DIFAB(F5D2FB6*Y(I+6), F5D2FB7*Y(I+7),TP4)
      CALL DIFAB(TP1,           -TP2,           TP5)
      CALL DIFAB(TP3,           -TP4,           TP6)
      CALL DIFAB(TP5,           -TP6,         YD(I))
      YD(I) = YD(I) / H
      ELSEIF (I >= NX-2) THEN
      CALL DIFAB(F5D2FB0*Y(I),   F5D2FB1*Y(I-1),TP1)
      CALL DIFAB(F5D2FB2*Y(I-2), F5D2FB3*Y(I-3),TP2)
      CALL DIFAB(F5D2FB4*Y(I-4), F5D2FB5*Y(I-5),TP3)
      CALL DIFAB(F5D2FB6*Y(I-6), F5D2FB7*Y(I-7),TP4)
      CALL DIFAB(TP1,           -TP2,           TP5)
      CALL DIFAB(TP3,           -TP4,           TP6)
      CALL DIFAB(TP5,           -TP6,         YD(I))
      YD(I) = YD(I) / H
      ELSE
      CALL DIFAB(F5D2C3*Y(I-3),  F5D2C2*Y(I-3), TP1)
      CALL DIFAB(F5D2C1*Y(I-2),  F5D2C0*Y(I  ), TP2)
      CALL DIFAB(F5D2C1*Y(I+1),  F5D2C2*Y(I+2), TP3)
      CALL DIFAB(F5D2C3*Y(I+3),  0.D0,          TP4)  
      CALL DIFAB(TP1,           -TP2,           TP5)
      CALL DIFAB(TP3,           -TP4,           TP6)
      CALL DIFAB(TP5,           -TP6,         YD(I))
      YD(I) = YD(I) / H
      ENDIF
      ENDDO      
!$OMP END PARALLEL DO      
      END
