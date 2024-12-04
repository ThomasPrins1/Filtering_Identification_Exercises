function dF = Jacobian(theta,mic_locations)
    % INPUT     
    % theta             current state estimate
    % mic_locations     microphonne locations
    % OUTPUT
    % dF                evaluation of Jacobian at current state estimate
    
    c = 343; % in [m/s]

    dF = zeros(8,3);
    for mic = [1:8]:
        denom = c*norm(theta(1:2)-mic_locations(mic,:)');
        x_diff = theta(1) - mic_locations(mic, 1)';
        y_diff = theta(2) - mic_locations(mic, 2)';
        dF(mic,:) = [x_diff/denom, y_diff/denom, 1];
    end

end