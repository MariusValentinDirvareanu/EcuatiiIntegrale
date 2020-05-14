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
    
    function val=G(indx,indy)
        W0=phi1(1,1)*phi2(1,2)-phi2(1,1)*phi1(1,2);
        if indx<=indy
            val=-1/(r(0)*W0)*phi1(indx)*phi2(indy);
        else
            val=-1/(r(0)*W0)*phi1(indy)*phi2(indx);
        end
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
    
%     for i=1:N+1
%         for j=1:N+1
%             valG(i,j)=G(i,j);
%         end
%     end
%     
%     figure(1)
%     surf(y,x,valG)
    
    
    for i=1:length(x)
        for j=1:length(y)
            int(j)=G(i,j)*f(y(j));
        end
        U(i)=trapz(y,int);
    end
%     figure(2);
%     plot(x,phi1);
%     legend('x','Phi 1');
%     figure(3);
%     plot(y,phi2);
%     legend('x','Phi 2');
%     figure(4);
    plot(x,U);
    hold on;
    legend('U');
end