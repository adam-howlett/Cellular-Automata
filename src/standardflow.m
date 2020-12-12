clear all

time=50;
LaneLength=200;
N=0.3*LaneLength; 
pos=ones(1,N);
dens=N./LaneLength;
Lane=zeros(time,LaneLength);  
pos=round(linspace(1,(1.*LaneLength),N));
vel=ones(1,length(pos)); 
vmax(1:N)=5;
Lane(1,pos)=vel + 1; 
p=0.5;

pspeed=0;
a=(rand(1,N)-0.5);
direction = a./abs(a);
vmax=vmax+(floor(rand(1,N)-pspeed)).*direction;

tic
for t=2:time    
    %Checking for cars before accelerating, decelerating if not
    for n=1:length(pos)
        x=1;
        y=1;
        while x <= vel(n)+1;
            temp=pos(n)+x;
            wrap = 1 + mod(temp-1,LaneLength);
            if Lane((t-1),wrap)
                vel(n)=x-1;
                x=vel(n)+2;
            else
                x=x+1;
                y=y+1;
            end
        end
        if x==y;
            vel(n)=vel(n)+1;
        end
    end
    %
    
    %slowdown
    vel=vel + (floor(rand(1,N)-p));
    vel(vel<0) = 0;
    %
    
    %speed check
    veltemp=vel-vmax;
    veltemp(veltemp>0)=0;
    vel=vmax+veltemp;
    %
    
    %advance statement
    Lane(t,pos) = 0;
    temp=pos + vel;
    wrap =1+mod(temp-1,LaneLength);
    Lane(t,wrap)=vel+1;
    pos=wrap;
    %
end

toc


flowi=zeros(400,500);
for x=100:time
    for y=1:LaneLength
    if Lane(x,y) ~= 0
    flowi(x,y)=Lane(x,y)-1;
    end
    end
end
flow=sum(flowi(:))./(time-100);

imagesc(Lane)
colorbar
grid on

ylabel('Time')
xlabel('Car Position')