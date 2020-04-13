% Developed by Aaron John Sabu for ME6102 under Prof Prasanna Gandhi
% ode: Solve the ODEs related to a double pendulum
% Fixed pendulum (flexible massless rod) + Mobile pendulum (rigid massless rod)

function [dO] = ode(~,O)
    
    l0  = 0.5;
    l1  = 0.3;
    m0  = 0.02;
    m1  = 0.03;
    k   = 1;
    g   = 9.81;
    
    dO    = zeros(6,1);
    dO(1) = O(2);
    dO(2) = -(1/(m0+m1))*( (m1*l1*( (dO(6)*cos(O(5)))-(dO(5)*dO(5)*sin(O(5))) ))+ k*O(1) - k*l0*O(1)/(((O(1)*O(1))+(O(3)*O(3)))^0.5) );
    dO(3) = O(4);
    dO(4) = -(1/(m0+m1))*( (m1*l1*( (dO(5)*dO(5)*cos(O(5)))-(dO(6)*sin(O(5))) ))+ k*O(3) - k*l0*O(3)/(((O(1)*O(1))+(O(3)*O(3)))^0.5) + (m0+m1)*g );
    dO(5) = O(6);
    dO(6) = -(1/(l1))*( dO(5)*(cos(O(5))*dO(3)-sin(O(5))*dO(1) )+(dO(2)*cos(O(5))+dO(4)*sin(O(5))) + dO(5)*(dO(1)*sin(O(5))-dO(3)*cos(O(5)))+ g*sin(O(5)) );
end
