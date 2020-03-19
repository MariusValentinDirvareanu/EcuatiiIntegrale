% Ecuatia integrala Fredholm de speta a 2-a. Metoda numerica
% Dirvareanu Marius-Valentin 1341a
function EcFrNum(a,b,lambda,I)
    %I=5
    F=zeros(I+1,1);
    U=F;
    A=zeros(I+1);
    h=(b-a)/I;
    x=a:h:b;
    function k=k(x,t)
        if (x>0 && x<t)
            k=sin(x)*cos(t);
        else
            k=sin(t)*cos(x);
        end
    end

    function f=f(x)
        f=cos(x);
    end
    for i=1:I+1
        F(i,1)=f(x(i));
    end
    figure(1)
    for i=1:I+1
        for j=1:I+1
            if j==1
                A(i,j)=h/2*lambda*k(x(i),x(1));
            else
                if j==I+1
                    A(i,j)=h/2*lambda*k(x(i),x(I+1));
                else 
                    A(i,j)=h*lambda*k(x(i),x(j));
                end
            end
            val(i)=A(i,j)*U(j,1);
        end
        U(i,1)=val(i)+F(i,1);
    end
    plot(x,U,'r');
end