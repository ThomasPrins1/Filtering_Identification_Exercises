function [th_kk,P_kk] = timeupdate_ekf(th_k,P_k,Q)
    % INPUT
    % th_k   mean of filtering distribution for k|k
    % P_k    covariance matrix of filtering distribution for k|k
    % Q      process noise covariance matrix
    % OUTPUT
    % th_kk  mean of predictive distribution for k+1|k
    % P_kk   covariance of predicted distribution for k+1|k
    
    th_kk(1:2,1) = th_k(1:2,1);
    th_kk(3,1) = th_k(3,1) + 0.5115;
    P_kk = P_k + Q;

end
