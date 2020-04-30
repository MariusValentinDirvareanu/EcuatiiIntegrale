function Green()
    l=pi/2;
    N=10;
    I=10;
    x=linspace(l,0,N+1);
    
    
    function val=r(x)
        val=1;
    end

    function val=p(x)
        val=-1;
    end

    function val=f(x)
        val=-sin(2*x);
    end
    w(0)=[0;1];
    w(l)=[0;1];

    function val=F(x,w)
        val=[w(2);-r(x)'/r(x)*w(2)+x/r(x)*w(1)];
    end
    
    
    
end