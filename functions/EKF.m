function [th_ekf,P_ekf] = EKF(th_0,P_0,y,mic_locations,R,Q)
    % INPUT 
    % th_0              prior mean
    % P_0               prior covariance matrix
    % y                 measurements for k = 1,...,137
    % mic_locations     microphone locations
    % R                 measurement noise covariance matrix
    % Q                 process noise covariance matrix
        
    % OUTPUT    
    % th_ekf            mean of the filtering distribution for every k
    % P_ekf             covariance matrix of the filtering distribution for every k    
        
    th_ekf(:,1) = th_0;
    P_ekf(:,:,1) = P_0;

    for iter = [2:137]
        y_k = y(iter,:)';
        [th_kk,P_kk] = timeupdate_ekf(th_ekf(:, iter-1), P_ekf(:,:,iter-1), Q);
        [th_ekf(:,iter),P_ekf(:,:,iter)] = measupdate_ekf(th_kk,P_kk,y_k,mic_locations,R);
    end
end


