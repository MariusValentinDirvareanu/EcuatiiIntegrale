% Ecuatia integrala Fredholm de speta a 2-a. Metoda aprox succesive
% Laborator 1
% Dirvareanu Marius-Valentin 1341a
function EcFr(a,b,alfa,N,I)
    %N=1,I=5
    u=zeros(N+1);
    h=(b-a)/I;
    x=a:h:b;
    function k=k(x,y)
        k=x*y/50;
    end

    function f=f(x)
        f=pi*x/50*(cos(alfa*pi)-1)+sin(alfa*x);
    end

    for i=1:I+1
        u(1,i)=f(x(i));
    end
    figure(1);
    plot(x,u(1,:));
    hold on;
    for n=1:N
        for i=1:I+1
            for j=1:I+1
                val(j)=k(x(i),x(j))*u(n,j);
            end
            u(n+1,i)=trapz(x,val)+f(x(i));
        end
        
        plot(x,u(n+1,:));
        hold on;
    end
    legend('U');
end