% Database
clearvars -except dffdata dffTPdata data ALL_ANIMALS
find_figure('Allcells')
for rg=2:4
    a=[];
    a=data(data(:,9)==rg&data(:,7)~=20&data(:,7)~=4&data(:,7)~=0,:);
    
    rc=size(a,1);
    a1(1,1,rg)=length(find(a(:,7)==1))/rc;
    a1(1,2,rg)=length(find(a(:,7)==5))/rc;
    a1(1,3,rg)=length(find(a(:,7)==8))/rc;
%     
    a1(2,1,rg)=length(find(a(:,7)==2))/rc;
    a1(2,2,rg)=length(find(a(:,7)==6))/rc;
    a1(2,3,rg)=length(find(a(:,7)==8))/rc;
    
    a1(3,1,rg)=length(find(a(:,7)==5))/rc;
    a1(3,2,rg)=length(find(a(:,7)==6))/rc;
    a1(3,3,rg)=length(find(a(:,7)==7))/rc;
    a1(3,4,rg)=length(find(a(:,7)==8))/rc;
    
    a1(4,1,rg)=length(find(a(:,7)==4))/rc;
    
    a1(5,1,rg)=length(find(a(:,7)==20))/rc;
    
end

for stim=1:5
    a=[];
    for rg=1:4
        a(rg,:)=squeeze(a1(stim,:,rg));
    end
    subplot(2,5,stim),bar(a,'stacked')
    ylim([0 1])
end

clearvars -except dffdata dffTPdata data ALL_ANIMALS
find_figure('Allcellmdff')
for rg=1%1:4
    a=[];
    a=data(data(:,9)==rg,:);
    adff=dffdata(data(:,9)==rg,:,:,:);
    
    rc=size(a,1);
    a1=[];
    a1=squeeze(mean(adff(a(:,7)==1,:,:,:),3));
    subplot(2,3,1),plot(squeeze(mean(a1(:,1,:),1)),'r')
    hold on
    subplot(2,3,1),plot(squeeze(mean(a1(:,2,:),1)),'g')
    subplot(2,3,1),plot(squeeze(mean(a1(:,3,:),1)),'b')
    
    a1=[];
    a1=squeeze(mean(adff(a(:,7)==2,:,:,:),3));
    subplot(2,3,2),plot(squeeze(mean(a1(:,1,:),1)),'r')
    hold on
    subplot(2,3,2),plot(squeeze(mean(a1(:,2,:),1)),'g')
    subplot(2,3,2),plot(squeeze(mean(a1(:,3,:),1)),'b')
    ylim([-0.05 0.2])
    
    a1=[];
    a1=squeeze(mean(adff(a(:,7)==5,:,:,:),3));
    subplot(2,3,3),plot(squeeze(mean(a1(:,1,:),1)),'r')
    hold on
    subplot(2,3,3),plot(squeeze(mean(a1(:,2,:),1)),'g')
    subplot(2,3,3),plot(squeeze(mean(a1(:,3,:),1)),'b')
    ylim([-0.05 0.2])
    a1=[];
    a1=squeeze(mean(adff(a(:,7)==6,:,:,:),3));
    subplot(2,3,4),plot(squeeze(mean(a1(:,1,:),1)),'r')
    hold on
    subplot(2,3,4),plot(squeeze(mean(a1(:,2,:),1)),'g')
    subplot(2,3,4),plot(squeeze(mean(a1(:,3,:),1)),'b')
    ylim([-0.05 0.2])
    a1=[];
    a1=squeeze(mean(adff(a(:,7)==7,:,:,:),3));
    subplot(2,3,5),plot(squeeze(mean(a1(:,1,:),1)),'r')
    hold on
    subplot(2,3,5),plot(squeeze(mean(a1(:,2,:),1)),'g')
    subplot(2,3,5),plot(squeeze(mean(a1(:,3,:),1)),'b')
    ylim([-0.05 0.2])
    a1=[];
    a1=squeeze(mean(adff(a(:,7)==8,:,:,:),3));
    subplot(2,3,6),plot(squeeze(mean(a1(:,1,:),1)),'r')
    hold on
    subplot(2,3,6),plot(squeeze(mean(a1(:,2,:),1)),'g')
    subplot(2,3,6),plot(squeeze(mean(a1(:,3,:),1)),'b')
    ylim([-0.05 0.2])
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% clearvars -except dffdata dffTPdata data
% yh=0;
% 
% for rg=[1 2 3 4]
%     
%     clearvars -except dffdata dffTPdata data type rg yy allenh
%     
%     a=[];adff=[];tdff=[];a1=[];a1dff=[];t1dff=[];
%     a=data(data(:,9)==rg,:);
%     adff=dffdata(data(:,9)==rg,:,:,:);
%     madff=squeeze(mean(adff,3));
%     tdff=dffTPdata(data(:,9)==rg,:,:,:);
%     
%     Ealln=a(a(:,8)>0,:);
%         
%     yy(rg,1)=length(find(Ealln(:,7)==5));
%     yy(rg,2)=length(find(Ealln(:,7)==6));
%     yy(rg,3)=length(find(Ealln(:,7)==7));
%     yy(rg,4)=length(find(Ealln(:,7)==8));
% end
%  allenh=yy;
% 
% clearvars -except dffdata dffTPdata data allenh
% yh=0;
% 
% for rg=[1 2 3 4]
%     
%     clearvars -except dffdata dffTPdata data type rg yy allenh allsupp
%     
%     a=[];adff=[];tdff=[];a1=[];a1dff=[];t1dff=[];
%     a=data(data(:,9)==rg,:);
%     adff=dffdata(data(:,9)==rg,:,:,:);
%     madff=squeeze(mean(adff,3));
%     tdff=dffTPdata(data(:,9)==rg,:,:,:);
%     
%     Ealln=a(a(:,8)<0,:);
%     
%     yy(rg,1)=length(find(Ealln(:,7)==5));
%     yy(rg,2)=length(find(Ealln(:,7)==6));
%     yy(rg,3)=length(find(Ealln(:,7)==7));
%     yy(rg,4)=length(find(Ealln(:,7)==8));
%     
%    
% end
%  allsupp=yy;
% %  totcells=[2842 3276 2466 1184]';
%   totcells=[2765 2185 3299 1519]';
%  totcells2=repmat(totcells,[1,8]);
%  all=[allsupp allenh];
%  
%  find_figure('Allcells')
%  
%  allx=all./totcells2;
%  
%  tt(1,:)=allx(1,1:4);
%  tt(2,:)=allx(1,5:8);
%  subplot(2,5,6),bar(tt,'stacked')
%  ylim([0 0.35])
%  tt(1,:)=allx(2,1:4);
%  tt(2,:)=allx(2,5:8);
%  subplot(2,5,7),bar(tt,'stacked')
%  ylim([0 0.35])
%  tt(1,:)=allx(3,1:4);
%  tt(2,:)=allx(3,5:8);
%  subplot(2,5,8),bar(tt,'stacked')
%  ylim([0 0.35])
%  tt(1,:)=allx(4,1:4);
%  tt(2,:)=allx(4,5:8);
%  subplot(2,5,9),bar(tt,'stacked')
%  ylim([0 0.35])
%  
 
 clearvars -except dffdata dffTPdata data ALL_ANIMALS
 
 table=[];
 for rg=1:4
     data2=[];
     data2=data(find(data(:,9)==rg),:);
     table(rg,1)=length(find(data2(:,7)==1));
     table(rg,2)=length(find(data2(:,7)==5));
     table(rg,3)=length(find(data2(:,7)==8));
     table(rg,4)=length(find(data2(:,7)==2));
     table(rg,5)=length(find(data2(:,7)==6));
     table(rg,6)=length(find(data2(:,7)==7));
     table(rg,7)=length(find(data2(:,7)==4));
     table(rg,8)=length(find(data2(:,7)==20));
     table(rg,9)=sum(table(rg,:));
 end
 table(5,:)=sum(table,1);
 
 %%%%%%% supp enc table%%%%%%
 table2=[];
 for rg=1:4
     data2=[];
     data2=data(find(data(:,9)==rg),:);
     table2(rg,1)=length(find(data2(:,7)==5 & data2(:,8)<0));
     table2(rg,2)=length(find(data2(:,7)==5 & data2(:,8)>0));
     table2(rg,3)=length(find(data2(:,7)==8 & data2(:,8)<0));
     table2(rg,4)=length(find(data2(:,7)==8 & data2(:,8)>0));
     table2(rg,5)=length(find(data2(:,7)==6 & data2(:,8)<0));
     table2(rg,6)=length(find(data2(:,7)==6 & data2(:,8)>0));
     table2(rg,7)=length(find(data2(:,7)==7 & data2(:,8)<0));
     table2(rg,8)=length(find(data2(:,7)==7 & data2(:,8)>0));
end
 find_figure('SuppENC')
  for rg=2:4
      data2=[];
      data2=data(data(:,9)==rg & (data(:,7)~=20&data(:,7)~=4&data(:,7)~=0) ,:);
      enc=[];supp=[];nn=1;
      for ty=[5 6 7 8]
          enc(1,nn)=size(data2(data2(:,8)==-1 & data2(:,7)==ty,:),1)/size(data2,1);
          enc(2,nn)=size(data2(data2(:,8)==1 & data2(:,7)==ty,:),1)/size(data2,1);
          nn=nn+1;
      end
      subplot(2,2,rg),bar(enc,'stacked')
      ylim([0 0.5])
  end
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
 
for ty=[1 2 5 6 7 8]
    aa=[];
    aadff=squeeze(mean(dffdata(data(:,7)==ty&data(:,9)>1,:,:,:),3));
    bb=[];
    if ty==1|ty==5|ty==8
    srt=1;
    elseif ty==7
        srt=3;
    elseif ty==2|ty==6
        srt=2;
    end
        
    bb=squeeze(aadff(:,srt,:));
    
    [h k]=sort(mean(bb(:,10:13),2));
    aadff=aadff(k,:,:);
    figure
    for con=1:3
    subplot(1,3,con),imagesc(squeeze(aadff(:,con,7:20)))
    caxis([-0.1 0.3])
    end
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

find_figure('reliability')
clearvars -except dffdata dffTPdata data ALL_ANIMALS
col={[1 0 0],[0 1 0],[0 0 1]};
for rg=2:4
    subplot(3,1,rg-1)
    for stim=13:15
        nn=1;aa=[];
        for ty=[1 5 7 8 6 2]
            dd=[];
            dd=data(data(:,9)==rg & data(:,7)==ty,stim);
            aa(nn)=mean(dd);
            ss(nn)=std(dd)/sqrt(size(dd,1));
            nn=nn+1;
        end
        plot(aa,'Color',col{stim-12})
        ylim([0 0.7])
        hold on
        errorbar(aa,ss,'Color',col{stim-12})
        hold on
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% %%%%%%%%%%%%% Table for Inhibitory neurons%%%%%%%%%%%%%%%%%
% clearvars -except dffdata dffTPdata data ALL_ANIMALS
% find_figure('Allcells')
% data3=data(data(:,6)==1,:);
%  table=[];
%  for rg=2:4
%      data2=[];
%      data2=data3(find(data3(:,9)==rg),:);
%      table(rg,1)=length(find(data2(:,7)==1));
%      table(rg,2)=length(find(data2(:,7)==5));
%      table(rg,3)=length(find(data2(:,7)==8));
%      table(rg,4)=length(find(data2(:,7)==2));
%      table(rg,5)=length(find(data2(:,7)==6));
%      table(rg,6)=length(find(data2(:,7)==7));
% %      table(rg,7)=length(find(data2(:,7)==4));
% %      table(rg,8)=length(find(data2(:,7)==20));
%      table(rg,9)=sum(table(rg,:));
%  end
%  table(5,:)=sum(table,1);
% 
% 
%  clearvars -except dffdata dffTPdata data ALL_ANIMALS
%  find_figure('Allcells')
%  data3=data(data(:,6)==1&(data(:,10)==1|data(:,10)==5),:);
%  table=[];
%  for rg=2:4
%      data2=[];
%      data2=data3(find(data3(:,9)==rg),:);
%      tot=length(find(data2(:,7)==1|data2(:,7)==5|data2(:,7)==8|data2(:,7)==2|data2(:,7)==6|data2(:,7)==7));
%      table(rg,1)=length(find(data2(:,7)==1))/tot;
%      table(rg,2)=length(find(data2(:,7)==5))/tot;
%      table(rg,3)=length(find(data2(:,7)==8))/tot;
%      table(rg,4)=length(find(data2(:,7)==2))/tot;
%      table(rg,5)=length(find(data2(:,7)==6))/tot;
%      table(rg,6)=length(find(data2(:,7)==7))/tot;
%      %      table(rg,7)=length(find(data2(:,7)==4));
%      %      table(rg,8)=length(find(data2(:,7)==20));
%      table(rg,9)=sum(table(rg,:));
%  end
% %  table(5,:)=sum(table,1);
% la{1}='v0';
% la{2}='mv';
% la{3}='mav';
% la{4}='a0';
% la{5}='ma';
% la{6}='m0';
% for rg=2:4
%     subplot(2,3,rg-1),pie(table(rg,1:6),la)
% end
% 
% 
%  clearvars -except dffdata dffTPdata data ALL_ANIMALS
%  find_figure('Allcells')
%  data3=data(data(:,6)==1&(data(:,10)==2|data(:,10)==3|data(:,10)==4),:);
%  table=[];
%  for rg=2:4
%      data2=[];
%      data2=data3(find(data3(:,9)==rg),:);
%      tot=length(find(data2(:,7)==1|data2(:,7)==5|data2(:,7)==8|data2(:,7)==2|data2(:,7)==6|data2(:,7)==7));
%      table(rg,1)=length(find(data2(:,7)==1))/tot;
%      table(rg,2)=length(find(data2(:,7)==5))/tot;
%      table(rg,3)=length(find(data2(:,7)==8))/tot;
%      table(rg,4)=length(find(data2(:,7)==2))/tot;
%      table(rg,5)=length(find(data2(:,7)==6))/tot;
%      table(rg,6)=length(find(data2(:,7)==7))/tot;
%      %      table(rg,7)=length(find(data2(:,7)==4));
%      %      table(rg,8)=length(find(data2(:,7)==20));
%      table(rg,9)=sum(table(rg,:));
%  end
% %  table(5,:)=sum(table,1);
%  la{1}='v0';
% la{2}='mv';
% la{3}='mav';
% la{4}='a0'; 
% la{5}='ma';
% la{6}='m0';
%  for rg=2:4
%     subplot(2,3,rg-1+3),pie(table(rg,1:6),la)
% end
%  
%  
%  
%  
% x=[547 2842; 1016 3276; 736 2466; 309 1184];
% 
% [h,p,X2] = chi2cont(x)
% 
% tmcomptest(x)
% 
% X=[208 547];
% N=[755 755];
% [h,p, chi2stat,df] = prop_test(X , N, 'true')