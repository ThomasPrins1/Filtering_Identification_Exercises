function [th_hat, P_hat] = NLS(yk,th_hat0,R,maxiter,mic_locations)
    % INPUT: 
    % y_k               kth measurement
    % th_hat0           initial estimate
    % R                 covariance matrix of measurement noise
    % maxiter           maximum number of iterations 
    % mic_locations     microphone locations
    
    % OUTPUT    
    % th_hat            mean of kth NLS estimate
    % P_hat             covariance matrix of kth NLS estimate
    
    W = inv(R);
    th_hat(:,1) = th_hat0;
    P_hat(:,:,1) = 1000*eye(3,3);

    for iter = [2:maxiter]
        F = Jacobian(th_hat(:,iter-1), mic_locations);
        ftheta = f(th_hat(:,iter-1), mic_locations);
        err = yk(iter-1,:)' - ftheta';

        delta_theta = inv(F'*W*F)*F'*W*err;
        th_hat(:,iter) = th_hat(:,iter-1) + delta_theta;
        P_hat(:,:,iter) = inv(F'*F);    
    end

end



