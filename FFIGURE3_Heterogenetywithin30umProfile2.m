
clear
load('ALL_ANIMALS_6s')
close all

clearvars -except ALL_ANIMALS data di dis Au
for rg=2:4
    dis=1;alldist=zeros(8,20);
    for di=50:50:500;
        no=1;
        clearvars -except ALL_ANIMALS data rg no dis di Au ty alldist alldist2
        for ex=1:size(ALL_ANIMALS,2)
            clearvars -except ALL_ANIMALS data rg no ex dif difv0 difA0 difMA difMV difMAV difM0 dis di Au ty alldist alldist2
            rois=[];
            rois=unique(data(data(:,9)==rg & data(:,10)==ex,4));
            for roi=1:length(rois)
                clearvars -except ALL_ANIMALS data rg no ex roi rois dif difv0 difA0 difMA difMV difMAV difM0 dis di Au ty alldist alldist2
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
%                         alldist=[alldist; max(dist(:,1))];
                        ee=[];hk=[];maingrp=[];
                        [ee hk]=sort(dist(:,1));
%                         maingrp=dist(hk(ee<=di & ee>=di-50),:);
                        maingrp=dist(hk(ee<=di),:);
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
                            alldist(2,dis)=alldist(2,dis)+sum(a0grp(:,3));
                            
                            v0grp=[];
                            v0grp=maingrp;
                            v0grp(v0grp(:,3)==2|v0grp(:,3)==5|v0grp(:,3)==6|v0grp(:,3)==7|v0grp(:,3)==8,:)=0;
                            v0grp(v0grp(:,3)==1,3)=1;
                            difv0(no)=sum(v0grp(:,3))/size(maingrp,1);
                            alldist(1,dis)=alldist(1,dis)+sum(v0grp(:,3));
                            
                            MAgrp=[];
                            MAgrp=maingrp;
                            MAgrp(MAgrp(:,3)==2|MAgrp(:,3)==1|MAgrp(:,3)==5|MAgrp(:,3)==7|MAgrp(:,3)==8,:)=0;
                            MAgrp(MAgrp(:,3)==6,3)=1;
                            difMA(no)=sum(MAgrp(:,3))/size(maingrp,1);
                            alldist(6,dis)=alldist(6,dis)+sum(MAgrp(:,3));
                            
                            MAVgrp=[];
                            MAVgrp=maingrp;
                            MAVgrp(MAVgrp(:,3)==2|MAVgrp(:,3)==5|MAVgrp(:,3)==6|MAVgrp(:,3)==7|MAVgrp(:,3)==1,:)=0;
                            MAVgrp(MAVgrp(:,3)==8,3)=1;
                            difMAV(no)=sum(MAVgrp(:,3))/size(maingrp,1);
                            alldist(8,dis)=alldist(8,dis)+sum(MAVgrp(:,3));
                            
                            MVgrp=[];
                            MVgrp=maingrp;
                            MVgrp(MVgrp(:,3)==2|MVgrp(:,3)==1|MVgrp(:,3)==6|MVgrp(:,3)==7|MVgrp(:,3)==8,:)=0;
                            MVgrp(MVgrp(:,3)==5,3)=1;
                            difMV(no)=sum(MVgrp(:,3))/size(maingrp,1);
                            alldist(5,dis)=alldist(5,dis)+sum(MVgrp(:,3));
                            
                            M0grp=[];
                            M0grp=maingrp;
                            M0grp(M0grp(:,3)==2|M0grp(:,3)==5|M0grp(:,3)==6|M0grp(:,3)==1|M0grp(:,3)==8,:)=0;
                            M0grp(M0grp(:,3)==7,3)=1;
                            difM0(no)=sum(M0grp(:,3))/size(maingrp,1);
                            alldist(7,dis)=alldist(7,dis)+sum(M0grp(:,3));
                            no=no+1;
                        end
                    end
                end
            end
        end
        
        ty(1,dis)={difv0};
        ty(2,dis)={difA0};
        ty(5,dis)={difMV};
        ty(6,dis)={difMA};
        ty(7,dis)={difM0};
        ty(8,dis)={difMAV};
        ty(9,dis)={dif};
        dis=dis+1;
    end

    clearvars -except ty ALL_ANIMALS data rg Au alldist alldist2
    col={[1 0 0],[0 0.7 0],[],[],[1 0 1],[0 1 0],[0 0 1],[0 1 1],[0 0 0]};
    ak=[1 2 5 6 7 8 9];
    for type=[1 2 5 6 7 8 9]
        for dis=1:size(ty,2)
            rgs=[];
            rgs=ty{type,dis};
            mci=[0 0 0 0];mBS=[];aud=[];
            if ~isempty(rgs)
                BS=[];
                for kk=1:1000
                    cnt=1;curr=[];a=[];
                    curr=rgs;
                    a=randi(length(rgs),1,200);
                    BS(kk,cnt,:)=curr(a);
                    cnt=cnt+1;
                end
                mBS=nanmean(BS,3);
                aud=sort(mBS(:,1));
                mci=[nanmean(rgs) aud(25) aud(975)];
                Au{rg}{type,dis}=mci;
            end
        end
    end
    alldist2{rg}=alldist;
end

col={[1 0 0],[0 0.7 0],[],[],[1 0 1],[0 1 0],[0 0 1],[0 1 1],[0 0 0]};

figure
for rg=2:4
    for rr=[1 2 5 6 7 8 9]
        mm=[];cil=[];ciu=[];
        for dis=1:size(Au{rg},2)
            mm(dis)=Au{rg}{rr,dis}(1);
            cil(dis)=Au{rg}{rr,dis}(2);
            ciu(dis)=Au{rg}{rr,dis}(3);
        end
        subplot(1,4,rg), plot(50:50:500,mm,'Color',col{rr})
        ylim([0 1])
        xlim([0 500])
        dist=50:50:500;
        hold on
        for dis=1:size(Au{rg},2)
            plot([dist(dis) dist(dis)],[cil(dis) ciu(dis)],'Color',col{rr})
        hold on
        end
        hold on
    end
end


