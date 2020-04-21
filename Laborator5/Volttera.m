function Volttera(T,I)
    % Ecuatia integrala Volttera
    % Laborator 5
    % Dirvareanu Marius-Valentin 1341a
    Iinitial=I;
    % coef poate fi schimbat astfel incat sa se obtina un grafic cat mai
    % bun
    for coef=5:15
        I=Iinitial*coef;
        U=zeros(I+1);
        h=T/I;
        % T=10 
        t=0:h:T;
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
        hold on;
    end
end