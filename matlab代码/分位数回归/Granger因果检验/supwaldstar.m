function star=supwaldstar(AIC_zhong,wald)
value=[0	1	1	1	2	2	2	3	3	3	4	4	4	5	5	5
1	2.71	3.84	6.63	4.61	5.99	9.21	6.25	7.81	11.34	7.78	9.49	13.28	9.24	11.07	15.09
1.08	3.47	4.73	7.82	5.42	6.86	10.3	7.19	8.83	12.58	8.93	10.63	14.64	10.39	12.28	16.34
1.17	3.79	5.1	8.26	5.8	7.31	10.71	7.64	9.29	13.05	9.42	11.17	15.17	10.96	12.88	16.83
1.27	4.02	5.38	8.65	6.12	7.67	11.01	7.98	9.62	13.39	9.82	11.63	15.91	11.4	13.27	17.32
1.49	4.38	5.91	9	6.6	8.11	11.77	8.5	10.15	14.23	10.35	12.27	16.64	12.05	14	18.06
2.25	5.1	6.57	9.82	7.45	9.02	12.91	9.46	11.17	14.88	11.39	13.32	17.66	13.09	15.16	19.23
3.45	5.59	7.05	10.53	8.06	9.67	13.53	10.16	12.05	15.71	12.1	14.12	18.54	13.86	15.93	19.99
5.44	6.05	7.51	10.91	8.57	10.19	14.16	10.76	12.58	16.24	12.8	14.79	19.1	14.58	16.48	20.67
9	6.46	7.93	11.48	9.1	10.75	14.47	11.29	13.16	16.6	13.36	15.34	19.78	15.17	17.25	21.39
16	6.8	8.45	11.69	9.59	11.26	15.09	11.8	13.69	17.28	13.82	15.84	20.24	15.63	17.88	21.9
32.11	7.17	8.85	12.35	10.01	11.79	15.51	12.27	14.15	17.68	14.31	16.45	20.71	16.2	18.35	22.49
81	7.63	9.31	12.69	10.5	12.27	16.04	12.81	14.62	18.28	14.94	16.98	21.04	16.87	18.93	23.34
361	8.19	9.84	13.01	11.2	12.93	16.44	13.47	15.15	19.06	15.62	17.56	21.54	17.69	19.61	24.18];
x=value(2:14,1);y=value(2:14,2:16);
for i=1:17
pi(1,i)=0.1+0.05*(i-1);
end
for i=1:16
tao(1,i)=(pi(1,i+1)*(1-pi(1,i)))/(pi(1,i)*(1-pi(1,i+1)));
end
q=AIC_zhong(1:16,4);
star(:,1)=linspace(0.1,0.9,17);
for i=1:16
    yi(i,:) = interp1(x,y,tao(1,i)); 
    value2(i,:)=yi(i,3*q(i)-2:3*q(i));
    if wald(i)>=value2(i,3)
       star(i,2)=3;
    elseif wald(i)>=value2(i,2)
        star(i,2)=2;
    elseif wald(i)>=value2(i,1)
        star(i,2)=1;
    else star(i,2)=0;
    end
end
        
