function ftheta = f(theta,mic_locations)
    % INPUT     
    % theta             current state estimate
    % mic_locations     microphonne locations
    % OUTPUT
    % ftheta            evaluation of f at current state estimate
    
    c      = 343; % in [m/s]
    for mic = 1:length(mic_locations)
        ftheta(mic) = theta(3) + (1/c)*norm(theta(1:2) - mic_locations(mic, :)');
    end
    ftheta = ftheta';
end