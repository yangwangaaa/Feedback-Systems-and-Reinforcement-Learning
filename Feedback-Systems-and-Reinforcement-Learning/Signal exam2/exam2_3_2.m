clear all
clc
a=0;b=0;
P=[0.3 0.7;0.7 0.3];
pi(:,1)=[1,0];
x=-1;
C=zeros(2,2);%counts of states from i to j
V=zeros(1,2);%vists of state 1,2
var_sym=zeros(2,2);
var_non=zeros(2,2);
for j=1:100
for i=1:200
    if x==-1
        u2=rand;
        if u2<P(1,1)
            x=-1;
            C(1,1)=C(1,1)+1;
            V(1)=V(1)+1;
        else
            x=1;
            C(1,2)=C(1,2)+1;
            V(2)=V(2)+1;
        end
    elseif x==1
        u2=rand;
        if u2<P(2,2)
            x=1;
            C(2,2)=C(2,2)+1;
            V(2)=V(2)+1;
        else
            x=-1;
            C(2,1)=C(2,1)+1;
            V(1)=V(1)+1;
        end
    end
end

P_est_sym=[1-(C(1,2)+C(2,1))/(V(1)+V(2)) (C(1,2)+C(2,1))/(V(1)+V(2));(C(1,2)+C(2,1))/(V(1)+V(2)) 1-(C(1,2)+C(2,1))/(V(1)+V(2))];
P_est_non=[C(1,1)/V(1) C(1,2)/V(1);C(2,1)/V(2) C(2,2)/V(2)];
for ii=1:2
    for jj=1:2
        var_sym(ii,jj)=var_sym(ii,jj)+(P(ii,jj)-P_est_sym(ii,jj))^2;
    end
end
for ii=1:2
    for jj=1:2
        var_non(ii,jj)=var_non(ii,jj)+(P(ii,jj)-P_est_non(ii,jj))^2;
    end
end
end
var_sym(ii,jj)=var_sym(ii,jj)/100
var_non(ii,jj)=var_non(ii,jj)/100