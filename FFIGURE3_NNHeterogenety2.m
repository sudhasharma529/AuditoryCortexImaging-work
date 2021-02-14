
clear
load('ALL_ANIMALS_6s')
close all
for rg=2:4
    bb=[];no=1;
    clearvars -except ALL_ANIMALS data rg bb no rgsM whichtype
    for ex=1:size(ALL_ANIMALS,2)
        clearvars -except ALL_ANIMALS data rg no ex bb rgsM  whichtype
        rois=[];
        rois=unique(data(data(:,9)==rg & data(:,10)==ex,4));
        for roi=1:length(rois)
            clearvars -except ALL_ANIMALS data rg no ex roi rois bb rgsM  whichtype
            ac=[];
            ac=data(data(:,9)==rg & data(:,10)==ex & data(:,4)==rois(roi) & data(:,7)~=20 & data(:,7)~=0 & data(:,7)~=4,:);
            whichtype=2;
            for pp=1:size(ac,1)
                if ac(pp,7)==whichtype
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
                   
                    for ty=[1 2 5 6 7 8]
                        aa=[];
                        aa=dist(dist(:,3)==ty,:);
                        if ~isempty(aa)
                            [h k]=min(aa(:,1));
                            bb(no,ty)=aa(k,1);
                        end
                    end
                    no=no+1;
                end
            end
        end
    end
    rgsM{rg}=bb;
end

col={[1 0 0],[0 0.7 0],[],[],[1 0 1],[0 1 0],[0 0 1],[0 1 1]};

for rg=2:4
    all=[];
    all=rgsM{rg};
    for ty=[1 2 5 6 7 8]
        aa=[];
        aa=nonzeros(all(:,ty));
        
        plot(rg,mean(aa),'.','MarkerSize',40,'Color',col{ty})
        hold on
        xlim([1 5])
        
        for kk=1:1000
            curr=[];
            curr=aa;
            a=[];
            a=randi(length(aa),1,200);
            BS(kk,:)=curr(a);
        end
        mBS=nanmean(BS,2);
        
        hold on
        aud=sort(mBS);
        ciaud=[aud(25) aud(975)];
        rgsmci(ty,1,rg)=mean(aa);
        rgsmci(ty,2,rg)=aud(25);
        rgsmci(ty,3,rg)=aud(975);
        
        plot([rg rg],ciaud,'Color',col{ty})
        title(whichtype)
        hold on
    end
end

