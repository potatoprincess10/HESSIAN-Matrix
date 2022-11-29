clc
syms x y z 
A = [0,0,0,0]
B = [0,0,0,0]
ps = [0,0,0,0]
f=21*x*y + (x^2)*y -x*(y^2) 
fx=diff(f,x)
fy=diff(f,y) 
[xcr,ycr]=solve(fx,fy)
[xcr,ycr]
for i=1:4
    A(i)=xcr(i);
    B(i)=ycr(i);
end
fxx=diff(fx,x)
fxy=diff(fx,y)
fyy=diff(fy,y) 
hessdetf=fxx*fyy-fxy^2
ds = - 4*x*y - (2*x - 2*y + 21)^2;
for i=1:2
    for j=1:2
        if i==1 && j==1
        hes(i,j)= fxx;
        else if i==2 && j==2
         hes(i,j)= fyy;
        else 
            hes(i,j)= fxy;
        end
        end
    end
end
disp (hes);
for i=1:4
    x = A(i);
    y = B(i);
    ps(i) = - 4*x*y - (2*x - 2*y + 21)^2;
    xx(i) = 2*y;
    if ps(i)<=0
        disp("saddle point");
    else if ps(i)>=0
        if xx(i)>=0
        disp("local minima");
        else if xx(i)<=0
        disp("local maxima");
        end
        end
    end
    end
end

