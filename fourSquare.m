function [image_out, row_out] = fourSquare(image_in, row_in)
% FOURSQUARE
    
    % give shorter names to row_in elements
    pos = row_in(1:2);
    i = row_in(3);

    % four adjacent squares
    if F(i - 1) ~= 0  % exception for being at end of sequence
        if I(pos(1) - F(i - 1), pos(2) + F(i)) ~= 0  % i.e. if not already black
            % top right corner
            image_in(
                pos(1)-F(i-1):pos(1)-F(i-1)+F(i-1)-1, ...
                pos(2)+F(i):pos(2)+F(i)+F(i-1)-1
            ) = zeros(F(i-1));
            master_add = [master_add; pos(1) - F(i-1), pos(2) + F(i), i-1, 0];
        end
        % top left corner
        if I(pos(1)-F(i-1),pos(2)-F(i-1)) ~= 0
            image_in(
                pos(1) - F(i - 1):pos(1) - F(i - 1) + F(i - 1) - 1, ...
                pos(2) - F(i - 1):pos(2) - F(i - 1) + F(i - 1) - 1
            ) = zeros(F(i - 1));
            master_add = [master_add; pos(1) - F(i - 1), pos(2) - F(i - 1), i - 1, 0];
        end
        % bottom left corner
        if I(pos(1) + F(i), pos(2) - F(i - 1)) ~= 0
            image_in(
                pos(1) + F(i):pos(1) + F(i) + F(i - 1) - 1, ...
                pos(2) - F(i - 1):pos(2) - F(i - 1)+F(i - 1) - 1
            ) = zeros(F(i - 1));
            master_add = [master_add; pos(1) + F(i), pos(2) - F(i - 1), i - 1, 0];
        end
        % bottom right corner
        if I(pos(1) + F(i), pos(2) + F(i)) ~= 0
            image_in(
                pos(1) + F(i):pos(1) + F(i) + F(i - 1) - 1, ...
                pos(2) + F(i):pos(2) + F(i) + F(i - 1) - 1
            ) = zeros(F(i - 1));
            master_add = [master_add; pos(1) + F(i), pos(2) + F(i), i - 1, 0];
        end
    end

    row_in(4) = 1;
    row_out = row_in;
    image_out = image_in;
    
end
