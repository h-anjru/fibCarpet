function bmp2png(f)
%BMP2PNG Convert bmp to png

    path = ['yourpath\fibcarpet', num2str(f)];
    cd(path)

    listing = dir;

    % generate list of filenames of detected stems (.txt)
    names = cell(length(listing), 1);

    for ii = 1:length(listing)
        if endsWith(listing(ii).name, '.png') == 1
            names(ii) = {listing(ii).name};
        end
        names = names(~cellfun(@isempty, names));
    end

    for ii = 1:length(names)
        file = names{ii};
        I = imread(file);
        file_ = replace(file, '.bmp', '.png');
        imwrite(I, file_)
    end

    cd 'yourpath\fibcarpet\'

end