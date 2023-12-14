! Search for roots F(t) as minimum points of |F(t)|
! (alternative to Halfc)

    subroutine Hamin(F,smin,smax,hs,eps,Nmax,dz,Ndz)
    implicit none
    integer Nmax,Ndz,itmax,im

    real(8) smin,smax,hs,ht,eps,dz(Nmax), &
    s(3),t(3),fs(3),ft(3),fs21,fs32,F,fzero,tm,fm
    
! zero level

    Ndz=21; fm=0d0; ht=(smax - smin)/(Ndz+1)
    do tm = smin,smax,ht
      fm = fm + abs(F(tm))
    end do 
    
   fzero = (fm/Ndz)*1d-2
 
! initial values	

    Ndz=0; itmax = 1;
           s(1)=smin;    fs(1)=abs(F(s(1)))
           s(2)=s(1)+hs; fs(2)=abs(F(s(2))); fs21=fs(2)-fs(1)
           s(3)=s(2)+hs; 
                     
! ht steps

    do while (itmax > 0) 
           
      if(s(3).ge.smax)then          
         s(3)=smax; itmax = -1
      end if ! tmax          
      fs(3)=abs(F(s(3))); fs32=fs(3)-fs(2)

! check a sign of minimum
    
      if((fs21.le.0d0).and.(fs32.ge.0d0))then
        t(:)=s(:); ft(:)=fs(:); ht=hs

! root refinement
      
 2      im = minloc(ft,1); tm=t(im); fm=ft(im)
  
        if(ht < eps)then
          if(fm < fzero)then
            Ndz=Ndz+1; dz(Ndz)=tm
            if(Ndz.ge.Nmax)return           
          end if ! fm
          
          s(1)=tm; fs(1)=fm
          s(2)=s(1)+hs; fs(2)=abs(F(s(2))); fs21=fs(2)-fs(1)
          s(3)=s(2)+hs; cycle
            
        end if ! accuracy 
                  
        ht=ht/2d0; t(1)=tm-ht; ft(1)=abs(F(t(1)))
                   t(2)=tm;    ft(2)=fm
                   t(3)=tm+ht; ft(3)=abs(F(t(3)))
        go to 2
      
      end if ! refinement
      
! next hs step
    
      s(1)=s(2);    fs(1)=fs(2)
      s(2)=s(3);    fs(2)=fs(3); fs21=fs(2)-fs(1)
      s(3)=s(2)+hs; 
 
    end do ! while
    
    end ! Hamin
                     
        