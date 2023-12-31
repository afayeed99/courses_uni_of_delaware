T=linspace(323.15,373.15,100);
kdehy=(exp(24.3-12300./T)).*60;
Kads=exp(11.1-3300./T);
kdehy=kdehy';
Kads=Kads';
Massreq_1=zeros(100,1);
Massreq_2=zeros(100,1);
Massreq_3=zeros(100,1);
T=T';
Fa0=500; %kmol/hr
for i=1:100;
    fun= @(x) abs((kdehy(i,1).*(1-(((x.^2)./(4.*(1-x).^2))))./(1+(Kads(i,1).*x)./(2-2.*x)).^2)).^-1;
    %fun= @(x) kdehy(1,1).*(1-(((x.^2)./(4.*(1-x).^2))))./(1+(Kads(1,1).*x)./(2-2.*x)).^2;
    q1=integral(fun,0,0.75);
    %q2=integral(fun,0,0.95);
    %q3=integral(fun,0,0.99);
    Massreq_1(i,1)=Fa0*q1;
    %Massreq_2(i,1)=Fa0*q2;
    %Massreq_3(i,1)=Fa0*q3;
end
