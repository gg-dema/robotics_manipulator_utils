%exam of 05/06/20
% 4dof rrpr
%ho calcolato a mano la tabella DH
clear all; 
syms la lb lf lw 
syms q1 q2 q3 q4


%[alpha a d theta]
%DH table:
dh_table = [pi/2, 0,  lb,  q1;
            pi,   lf, 0,   q2;
            pi,   la, 0,   q3;
            0,    lw, 0,   q4];

A_01 = DHMatrix(dh_table(1, :))
A_12 = DHMatrix(dh_table(2, :))
A_23 = DHMatrix(dh_table(3, :))
A_34 = DHMatrix(dh_table(4, :))

A_04 = simplify(A_01*A_12*A_23*A_34)
p_h_inFrame4 = [0,0,0,1].'
p_h_inFrame0 = simplify(A_04 * p_h_inFrame4)



%second part

clear all
syms q1 q2 q3 l

fr_q = [ (l*cos(q1)) + q3*cos(q1+q2) ;
         l*sin(q1) + q3*sin(q1 +q2);
         q1 + q2]
j = jacobian(fr_q, [q1, q2, q3])
R_01 = [cos(q1), -sin(q1), 0;
        sin(q1), cos(q1), 0;
        0, 0, 1]




