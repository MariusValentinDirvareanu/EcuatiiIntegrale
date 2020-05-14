% Ecuatia integrala Fredholm de speta a 2-a. Nucleu finit
% Laborator 4
% Dirvareanu Marius-Valentin 1341a
function Fredholm2NucleuFinit(alpha,beta,lambda,a,b,N,M)
    h=(beta-alpha)/M;
    C=zeros(N,1);
    function f=f(x)
        f=x+2;
    end
    function phi=phi(indice,x)
        if indice==a
            phi=sin(x);
        end
        if indice==b
            phi=1;
        end
    end
    function psi=psi(indice,y)
        if indice==a
            psi=y;
        end
        if indice==b
            psi=cos(y);
        end
    end

    x=a:h:b; 
    
    u=zeros(1,M+1);
    
    % Calcul
    figure(1);
    for k=1:N
        for j=1:N
            for i=1:M+1
                integrand(i)=phi(k,x(i))*psi(j,x(i));
                integrand2(i)=psi(j,x(i))+f(x(i));
                val(j)=C(j,1)*phi(j,x(i))+f(x(i));
            end
            A(j,k)=trapz(x,integrand);
            B(j,1)=trapz(x,integrand2);
            C(j,1)=lambda*A(j,k).*C(j,1)+B(j,1);
            u(k+1,j)=lambda*val(j);
            plot(x,u(k+1,:));
            hold on;
        end
    end
end