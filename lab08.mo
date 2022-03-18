model lab08
parameter Real M01 = 3.8;
parameter Real M02 = 2.8;
parameter Real pcr=28;
parameter Real N = 38;
parameter Real q = 1;
parameter Real tau1 = 28;
parameter Real tau2 = 18;
parameter Real p1w = 8.8;
parameter Real p2w = 11.8;

parameter Real a1 = pcr/(tau1*tau1*p1w*p1w*N*q);
parameter Real a2 = pcr/(tau2*tau2*p2w*p2w*N*q);
parameter Real b = pcr/(tau1*tau1*p1w*p1w*tau2*tau2*p2w*p2w*N*q);
parameter Real c1 = (pcr-p1w)/(tau1*p1w);
parameter Real c2 = (pcr-p2w)/(tau2*p2w);
Real M1(start=M01);
Real M2(start=M02);
Real tetta();
equation
der (tetta) = time/c1;
der (M1) = M1 - (b/c1)*M1*M2-(a1/c1)*M1*M1;
//для 1 случая
//der (M2) = (c2/c1)*M2-(b/c1)*M1*M2-(a2/c1)*M2*M2;
//для второго случая
der (M2) = (c2/c1)*M2-((b/c1)+0.00073)*M1*M2-(a2/c1)*M2*M2;

end lab08;
