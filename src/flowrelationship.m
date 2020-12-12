%% run for one case
clear all
rho=zeros(1,100);
Q=rho;
tic
time=1000;
LaneLength=100;
for N=1:LaneLength
    [x,y]=traffic(N,0.2,time,LaneLength);
    rho(N)=x;
    Q(N)=y;
end
toc

Q(length(rho))=0;
scatter(rho,Q,'x')
xlabel('Density')
ylabel('Flow Q, in average speed of all cars')

%% averages over n cases
clear all
n= 100;
time=50;
LaneLength=100;
rho1=zeros(n,LaneLength);
Q1=rho1;

for k=1:n
    for N=1:LaneLength
    [x,y]=traffic(N,0.2,time,LaneLength);
    rho1(k,N)=x;
    Q1(k,N)=y;
    end
end

for k=1:LaneLength
    Q(k)=sum(Q1(:,k))./n;
    rho(k)=sum(rho1(:,k))./n;
end

scatter(rho,Q,'x')
hold on
plot(rho,Q)
hold on
xlabel('Density')
ylabel('Flow Q, in average speed of all cars')




