function png2gif(f)

    path = ['yourpath\fibcarpet', num2str(f)];
    cd(path)

    listing = dir;

    % generate list of filenames of detected stems (.txt)
    names = cell(length(listing), 1);

    for ii = 1:length(listing)
        if endsWith(listing(ii).name,'.png') == 1
            names(ii) = {listing(ii).name};
        end
        names = names(~cellfun(@isempty,names));
    end

    % generate index from number of squares (store as integer)
    % add column to names cell array
    names{2, f} = [];
    names(2, :) = names(1, :);

    for jj = 1:length(names)
        name = names{2, jj};
        name = replace(name, ['fibcarpet_' num2str(f) '_'],'');
        name = replace(name, '.png', '');
        names{2, jj} = str2double(name);
    end

    % sort the names, discard the index
    [~, idx] = sort([names{2, :}], 'ascend');
    names = names(:, idx);
    names(2, :) = [];

    filename = ['fibcarpet_', num2str(f), '_fullres.gif'];

    for jj = 1:length(names)
        A = imread(names{jj});
        if jj == 1
            imwrite(A, filename, 'gif', 'LoopCount', Inf, 'DelayTime', 0.5);
        elseif jj == length(names)
            imwrite(A, filename, 'gif', 'WriteMode', 'append', 'DelayTime', 2);
        else
            imwrite(A, filename, 'gif', 'WriteMode', 'append', 'DelayTime', 0.5);
        end
    end

    cd 'yourpath\fibcarpet\'

end
