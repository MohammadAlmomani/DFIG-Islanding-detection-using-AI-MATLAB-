function [X,Y,Z]=Zcontourf(Out,Targ,P,nn)
X=unique(P(1:242*(12-nn),1));
Y=unique(P(:,2));
for i=1:484
    d0=1:12-nn;
    d0=d0+(12-nn)*i-(12-nn);
    Z(i)=(1-(sum(abs(Out(d0)-Targ(d0))))/numel(d0))*100;
end
n=numel(Z)/4;
Z=(Z(1:n)+Z(n+1:2*n)+Z(2*n+1:2:4*n)+Z(2*n+2:2:4*n))/4;
Z=reshape (Z,numel(X),numel(Y));
%   Z=round(Z/10)*10;
% Z(1:2,:)=ceil(Z(1:2,:)/20)*20;
% Z(:,1:2)=ceil(Z(:,1:2)/20)*20;
% Z(end-2:end,:)=ceil(Z(end-2:end,:)/20)*20;
% Z(:,end-2:end)=ceil(Z(:,end-2:end)/20)*20;

% X=[-36; -33; X; 36;39];
% Y=[-28; -24; Y; 24;28];
% Z=[ 100*ones(2,size(Z,2));Z;100*ones(2,size(Z,2))];
% Z=[ 100*ones(size(Z,1),2),Z,100*ones(size(Z,1),2)];


end