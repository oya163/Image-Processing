function OutIm = HistogramEq(InIm)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Image Processing Class Assignment 1    %
%                                        %
% Name - Oyesh Mann Singh                %
% LUID - L20372791                       %
%                                        %
% Histogram Equalization                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Input:
% InIm    - input image 
%
% Output:
% OutIm   - output image 
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% get the size of input image;
[row, col] = size(InIm);

% initalize the histogram array;
H = zeros(1,256);
% initalize the output image;
OutIm = uint8(zeros(row, col));

% Step 1: compute histogram using two for loops (note the index starts from 1);
for i = 1:row
    for j = 1:col
        H(InIm(i,j)) = H(InIm(i,j)) + 1;
    end
end

% Step 2: compute PDF;
totalPixel = row * col;
PDF = zeros(1,256);
for i = 1:256
    PDF(i) = H(i) / totalPixel;
end

% Step 3: compute CDF (Hint: use 'cumsum' function, type 'help cumsum' to see help)
CDF = (cumsum(PDF))*255;

% Step 4: compute transformation T
T = round(CDF);

% Step 5: generate output image using two for loops and transformation T;
for i = 1:row
    for j = 1:col
        OutIm(i,j) = T(InIm(i,j));
    end
end