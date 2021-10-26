function dXdt=pendulo_simple(t,X)  %  
    %Parametros del sistema
    m=5;
    g=9.8;
    l=1;
      
    %x1=X(1), x2=X(2)
    
    dXdt=[X(2);(-g/l)*sin(X(1))];
%     dXdt=[X(2);(f-k*X(1)-c*X(2))/m];

end