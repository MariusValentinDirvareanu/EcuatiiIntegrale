function Volttera(T,I)
    U=zeros(I+1);
    h=T/I;
    % T=10 
    t=0:h:T;

    function k=k(t,s)
        k=sin(t-s);
    end

    function f=f(t)
        f=sin(3*t);
    end

    U(1)=f(t(1));
    U(2)=(h/2*k(t(2),t(1))*U(1)+f(t(2)))/(1-h/2*k(t(2),t(2)));

    for i=3:I+1
        U(i)=f(t(i))+h/2*k(t(i),t(1))*U(1);
        for j=2:i-1
            U(i)=U(i)+h*k(t(i),t(j))*U(j);
        end
        U(i)=U(i)/(1-h/2*k(t(i),t(i)));
    end
    plot(t,U);
    % TODO: Adaugare legenda pentru fiecare set de iteratii
    % legend(num2str(I));
    hold on;
end