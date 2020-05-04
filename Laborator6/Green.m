% Functia Green
% Laborator 6
% Dirvareanu Marius-Valentin 1341a
function Green(l,N)
    %l=pi/2; N=10;
    function val=r(x)
        val=1;
    end
    function val=rprim(x)
        val=0;
    end
    function val=p(x)
        val=-1;
    end
    function val=f(x)
        val=-sin(2*x);
    end
    
    function val=F(x,w)
        val=zeros(2,1);
        val(1)=w(2);
        val(2)=-rprim(x)/r(x)*w(2)+p(x)/r(x)*w(1);
    end
    div_x=linspace(0,l,N+1);
    div_xinv=linspace(l,0,N+1);

    [x,phi1]=ode45(@F,div_x,[0 1]);
    [y_inv,phi2_inv]=ode45(@F,div_xinv,[0 1]);
    for k=1:N+1
        y(k)=y_inv(N+1-k+1);
        for j=1:2
            phi2(k,j)=phi2_inv(N+1-k+1,j);
        end
    end
    for n=1:N+1
        for i=1:2
            u(n,i)=trapz(x,phi1(n,i).*phi2(n,i).*f(x));
        end
    end
    u
    figure(1);
    plot(x,phi1);
    legend('x','Phi 1');
    figure(2);
    plot(y,phi2);
    legend('x','Phi 2');
    figure(3);
    plot(x,u);
    legend('x','u');
end