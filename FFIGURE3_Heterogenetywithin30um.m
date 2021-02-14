
clear
load('ALL_ANIMALS_6s')
close all
for rg=2:4
    no=1;
    clearvars -except ALL_ANIMALS data rg no rgsA0 rgsv0 rgsMA rgsMV rgsMAV rgsM rgsM0
    for ex=1:size(ALL_ANIMALS,2)
        clearvars -except ALL_ANIMALS data rg no ex dif difv0 difA0 difMA difMV difMAV difM0 rgsA0 rgsv0 rgsMA rgsMV rgsMAV rgsM rgsM0
        rois=[];
        rois=unique(data(data(:,9)==rg & data(:,10)==ex,4));
        for roi=1:length(rois)
            clearvars -except ALL_ANIMALS data rg no ex roi rois dif difv0 difA0 difMA difMV difMAV difM0 rgsA0 rgsv0 rgsMA rgsMV rgsMAV rgsM rgsM0
            ac=[];
            ac=data(data(:,9)==rg & data(:,10)==ex & data(:,4)==rois(roi),:);
            
            for pp=1:size(ac,1)
                if ac(pp,7)==2
                    nn=1;dist=[];
                    for uu=1:size(ac,1)
                        if sum(ac(pp,:)-ac(uu,:))~=0
                            x1=ac(pp,23);
                            y1=ac(pp,24);
                            x2=ac(uu,23);
                            y2=ac(uu,24);
                            dist(nn,1)=(sqrt(((x2-x1).^2) + ((y2-y1).^2))).*1.17;
                            dist(nn,2)=ac(pp,7);
                            dist(nn,3)=ac(uu,7);
                            nn=nn+1;
                        end
                    end
                    ee=[];hk=[];maingrp=[];
                    [ee hk]=sort(dist(:,1));
                    maingrp=dist(hk(ee<=50),:);
                    maingrp(maingrp(:,3)==20 | maingrp(:,3)==4 | maingrp(:,3)==0,:)=[];
                    
                    if size(maingrp,1)>5
                        Mgrp=[];
                        Mgrp=maingrp;
                        Mgrp(Mgrp(:,3)==2,3)=0;
                        Mgrp(Mgrp(:,3)==1|Mgrp(:,3)==5|Mgrp(:,3)==6|Mgrp(:,3)==7|Mgrp(:,3)==8,3)=1;
                        dif(no)=sum(Mgrp(:,3))/size(maingrp,1);
                        
                        a0grp=[];
                        a0grp=maingrp;
                        a0grp(a0grp(:,3)==1|a0grp(:,3)==5|a0grp(:,3)==6|a0grp(:,3)==7|a0grp(:,3)==8,3)=0;
                        a0grp(a0grp(:,3)==2,3)=1;
                        difA0(no)=sum(a0grp(:,3))/size(maingrp,1);
                        
                        v0grp=[];
                        v0grp=maingrp;
                        v0grp(v0grp(:,3)==2|v0grp(:,3)==5|v0grp(:,3)==6|v0grp(:,3)==7|v0grp(:,3)==8,:)=0;
                        v0grp(v0grp(:,3)==1,3)=1;
                        difv0(no)=sum(v0grp(:,3))/size(maingrp,1);
                        
                        MAgrp=[];
                        MAgrp=maingrp;
                        MAgrp(MAgrp(:,3)==2|MAgrp(:,3)==1|MAgrp(:,3)==5|MAgrp(:,3)==7|MAgrp(:,3)==8,:)=0;
                        MAgrp(MAgrp(:,3)==6,3)=1;
                        difMA(no)=sum(MAgrp(:,3))/size(maingrp,1);
                        
                        MAVgrp=[];
                        MAVgrp=maingrp;
                        MAVgrp(MAVgrp(:,3)==2|MAVgrp(:,3)==5|MAVgrp(:,3)==6|MAVgrp(:,3)==7|MAVgrp(:,3)==1,:)=0;
                        MAVgrp(MAVgrp(:,3)==8,3)=1;
                        difMAV(no)=sum(MAVgrp(:,3))/size(maingrp,1);
                        
                        MVgrp=[];
                        MVgrp=maingrp;
                        MVgrp(MVgrp(:,3)==2|MVgrp(:,3)==1|MVgrp(:,3)==6|MVgrp(:,3)==7|MVgrp(:,3)==8,:)=0;
                        MVgrp(MVgrp(:,3)==5,3)=1;
                        difMV(no)=sum(MVgrp(:,3))/size(maingrp,1);
                        
                        M0grp=[];
                        M0grp=maingrp;
                        M0grp(M0grp(:,3)==2|M0grp(:,3)==5|M0grp(:,3)==6|M0grp(:,3)==1|M0grp(:,3)==8,:)=0;
                        M0grp(M0grp(:,3)==7,3)=1;
                        difM0(no)=sum(M0grp(:,3))/size(maingrp,1);
                        
                        no=no+1;
                    end
                    
                end
            end
        end
    end
    rgsM{rg}=dif;
    rgsv0{rg}=difv0;
    rgsMA{rg}=difMA;
    rgsMAV{rg}=difMAV;
    rgsMV{rg}=difMV;
    rgsM0{rg}=difM0;
    rgsA0{rg}=difA0;
end

clearvars -except rgsM rgsv0 rgsMA rgsMAV rgsMV rgsM0 rgsA0
ty={rgsv0,rgsA0,rgsMV,rgsMA,rgsM0,rgsMAV,rgsM};
col={[1 0 0],[0 0.7 0],[],[],[1 0 1],[0 1 0],[0 0 1],[0 1 1],[0 0 0]};
ak=[1 2 5 6 7 8 9];
for ii=1:length(ty)
    rgs={[]};
    rgs=ty{ii};
    
    rgsm(ii,:)=[nanmean(rgs{2}) nanmean(rgs{3}) nanmean(rgs{4})];
    for kk=1:1000
        cnt=1;
        for jj=2:4
            curr=rgs{jj};
            a=randi(length(rgs{jj}),1,200);
            BS(kk,cnt,:)=curr(a);
            cnt=cnt+1;
        end
    end
    mBS=nanmean(BS,3);
    
    subplot(2,2,1),plot(1:3,rgsm(ii,:),'.', 'MarkerSize', 40,'Color',col{ak(ii)})
    title(ak(ii))
    hold on
    plot([0 4],[0.5 0.5],'k')
    ylim([0 1])
    hold on
    aud=sort(mBS(:,1));
    ciaud=[aud(25) aud(975)];
    a1=sort(mBS(:,2));
    cia1=[a1(25) a1(975)];
    auv=sort(mBS(:,3));
    ciauv=[auv(25) auv(975)];
    rsmci(ii,1:2)=ciaud;
    rsmci(ii,3:4)=cia1;
    rsmci(ii,5:6)=ciauv;
    
    plot([1 1],ciaud,'Color',col{ak(ii)})
    plot([2 2],cia1,'Color',col{ak(ii)})
    plot([3 3],ciauv,'Color',col{ak(ii)})
    hold on
end


