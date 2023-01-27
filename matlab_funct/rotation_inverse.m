function [theta1, theta2, r1, r2] = rotation_inverse(R)
    %calc theta
    %check if sin_theta = 0
        %if it's, disp(no solution for theta=0)
        %         disp(set theta=+-pi, 2)
    sin_theta = sqrt(((R(1, 2) - R(2, 1))^2 + (R(1, 3) - R(3, 1))^2 + (R(2, 3) - R(3, 2))^2 ));


    cos_theta = R(1,1) + R(2, 2) + R(3,3) -1;
    theta1 = atan2(sin_theta, cos_theta);
    theta2 = atan2(-sin_theta, cos_theta); 

    if ((theta1 | theta2) ~= 0)
        r1 = 1/(2*sin_theta)*[(R(2, 2) - R(2, 3));
                              (R(1, 3) - R(3, 1));
                              (R(2, 1) - R(1, 2))
            ]; 
        r2 = 1/(2*(-sin_theta))*[(R(2, 2) - R(2, 3));
                                 (R(1, 3) - R(3, 1));
                                 (R(2, 1) - R(1, 2))
            ]; 

        return
    else
        disp('sin_theta = 0');
        dips('no solution for theta=0, set theta to +-pi/2');
        theta1 = pi/2;
        theta2 = -pi/2;
        r1 = [sqrt((R(1,1)+1)/2);
             sqrt((R(2,2)+1)/2);
             sqrt((R(2,2)+1)/2)];

        r2 = [-sqrt((R(1,1)+1)/2);
             -sqrt((R(2,2)+1)/2);
             -sqrt((R(2,2)+1)/2)];
        return

    end