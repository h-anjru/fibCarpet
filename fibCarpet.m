function fibCarpet(f)
% FIBCARPET

    tic

    % used in nested function fourSquare() below; set as global as to not be
    %     called in/out
    global master_add

    % call fibonacci() to generate sequence (seq_ bc reasons)
    F = fibonacci(f, 0, 1);

    % begin with a blank white canvas
    image_width = 2 * (sum(F) - 0.5 * (max(F)));
    I = ones(image_width);

    % draw initial center square
    m = 0.5 * image_width - 0.5 * max(F) + 1;
    I(m:m + max(F) - 1, m:m + max(F) - 1) = zeros(max(F));
    master = [m, m, length(F), 0];
    name = ['fibcarpet_' num2str(f) '_1.png'];
    imwrite(I, name)

    % placeholder value for while loop below
    new = 1;

    while new ~= 0  % new = length of list of squares to be added
        % look thru list of squares; if no children, call fourSquare
        for ii = 1:size(master, 1)
            if master(ii, 4) == 0
                [I, master(ii, 1:4)] = fourSquare(I, master(ii, 1:4));
            end
        end

        % how many new squares are there?
        new = size(master_add, 1);
        % add new squares to master
        master = [master; master_add];
        master_add = [];

        % if new squares are added, write new image; else, we're done
        if new ~= 0
            fprintf('...added %i new squares.\n', new)
            name = ['fibcarpet_' num2str(f) '_' num2str(new) '.png'];
            imwrite(I, name)
        else
            fprintf('...done!\n')
        end
    end

    toc
end
