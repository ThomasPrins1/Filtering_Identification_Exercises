function [p_kf,P_kf] = KF(p_0,P_0,R,Q,y)
    % INPUT: 
    % p_0       prior mean
    % P_0       prior covariance matrix
    % R         Measurement noise covariance matrices for k = 1,...,137
    % Q         Process noise covariance matrix
    % y         Measurements for k = 1,...,137
    % OUTPUT    
    % p_kf      Mean of the filtered distribution for every k
    % P_kf      Covariance matrix of the filtered distribution for every k
    
    p_kf(:,1) = p_0;
    P_kf(:,:,1) = P_0;

    for iter = [2:137]
        y_k = y(iter,:);
        R_k = R(:,:,iter);
        [p_kk,P_kk] = timeupdate_kf(p_kf(:, iter-1), P_kf(:,:,iter-1), Q);
        [p_kf(:,iter),P_kf(:,:,iter)] = measupdate_kf(p_kk,P_kk,R_k,y_k);
    end

end
