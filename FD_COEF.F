!=======================================================================
!     Name : F5D_coef.f
!
!     Author : Yi-Wei Chang
!
!     Description : Coefficient of the fifth order finite difference in 
!                   both central and forward, backward different

!     F5DxCy  : Coefficient of x-th subdifferential formulation of
!               central differences of fifth order finite difference
!
!     F5DxFBy : Coefficient of x-th subdifferential formulation of
!               forward and backward differences of fifth order finite 
!               difference
  
!=======================================================================
!     F5d1 coefficient
!   
      PARAMETER(F5D1C3  = 1.d0/60.d0,     F5D1C2 = 3.d0/20.d0,
     |          F5D1C1  = 3.d0/4.d0, 
     |          F5D1FB0 = 49.d0/20.d0,    F5D1FB1 = 6.d0, 
     |          F5D1FB2 = 15.d0/2.d0,     F5D1FB3 = 20.d0/3.d0, 
     |          F5D1FB4 = 15.d0/4.d0,     F5D1FB5 = 6.d0/5.d0, 
     |          F5D1FB6 = 1.d0/6.d0                                    )

!=======================================================================
!     F5d2 coefficient
!
      PARAMETER(F5D2C3  = 1.d0/90.d0,     F5D2C2 = 3.d0/20.d0,
     |          F5D2C1  = 3.d0/2.d0,      F5D2C0 = 49.d0/18.d0,
     |          F5D2FB0 = 469.d0/90.d0,   F5D2FB1 = 223.d0/10.d0, 
     |          F5D2FB2 = 879.d0/20.d0,   F5D2FB3 = 949.d0/18.d0, 
     |          F5D2FB4 = 41.d0,          F5D2FB5 = 201.d0/10.d0, 
     |          F5D2FB6 = 1019.d0/180.d0, F5D2FB7 = 7.d0/10.d0         )
      
!=======================================================================
!     F5d3 coefficient
!
      PARAMETER(F5D3C4  = 7.d0/240.d0,    F5D3C3 = 3.d0/10.d0,
     |          F5D3C2  = 169.d0/120.d0,  F5D3C1  = 61.d0/30.d0, 
     |          F5D3FB0 = 801.d0/80.d0,   F5D3FB1 = 349.d0/6.d0, 
     |          F5D3FB2 = 18353.d0/120.d0,F5D3FB3 = 2391.d0/10.d0, 
     |          F5D3FB4 = 1457.d0/6.d0,   F5D3FB5 =4891.d0/30.d0, 
     |          F5D3FB6 = 561.d0/8.d0,    F5D3FB7 = 527.d0/30.d0,
     |          F5D3FB8 = 469.d0/240.d0                                )

!=======================================================================
!     F5d4 coefficient
!
      PARAMETER(F5D4C4  = 7.d0/240.d0,    F5D4C3 = 2.d0/5.d0,
     |          F5D4C2  = 169.d0/60.d0,   F5D4C1  = 122.d0/15.d0, 
     |          F5D4C0  = 91.d0/8.d0, 
     |          F5D4FB0 = 1069.d0/80.d0,  F5D4FB1 = 1316.d0/15.d0, 
     |          F5D4FB2 = 15289.d0/60.d0, F5D4FB3 = 2144.d0/5.d0, 
     |          F5D4FB4 = 10993.d0/24.d0, F5D4FB5 = 4772.d0/15.d0, 
     |          F5D4FB6 = 2803.d0/20.d0,  F5D4FB7 = 536.d0/15.d0,
     |          F5D4FB8 = 967.d0/240.d0                               )
