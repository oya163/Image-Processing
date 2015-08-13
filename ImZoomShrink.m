function [OutIm_Bilinear, OutIm_Nearest, OutIm_Nearest_Floor] = ImZoomShrink(InputImage, newRow, newCol)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Image Processing                       %
% Assignment 1                           %
%                                        %
% Name - Oyesh Mann Singh                %
% LUID - L20372791                       %
%                                        %
% This is a MATLAB program to implement  %
% Nearest Interpolation and Bilinear     %
% Interpolation method                   % 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Input:
% InputImage  - input image (gray level 8 bits)
% newCol - number of columns of output image;
% newRow - number of rows of output image;
%
% Output:
% OutIm_Bilinear   - output image (newRow*newCol) computed using bilinear method;
% OutIm_Nearest    - output image (newRow*newCol) computed using nearest method;


% get the size of input image
[oldRow, oldCol] = size(InputImage);
%disp(size(InputImage));

% calculating zoom factors of row and columns
zoomRowFactor = newRow/oldRow;
zoomColFactor = newCol/oldCol;

% Initialize two output images to black;
OutIm_Bilinear=uint8(zeros(newRow, newCol));
OutIm_Nearest=uint8(zeros(newRow, newCol));
OutIm_Nearest_Floor=uint8(zeros(newRow, newCol));

for i = 1:newRow
    for j = 1:newCol
        x = i/zoomRowFactor;
        y = j/zoomColFactor;
        
        if x < 1
            x = 1;
        end
        
        if y < 1
            y = 1;
        end        
        
        %Output image using Nearest Interpolation
        OutIm_Nearest_Floor(i,j) = InputImage(floor(x+0.5),floor(y+0.5));
        OutIm_Nearest(i,j) = InputImage(round(x),round(y));
        
        %Intensity calculation for Bilinear Interpolation
        Intensity1 = (floor(x+1)-x)*InputImage(floor(x),floor(y)) + (x-floor(x))*InputImage(ceil(x),floor(y)); 
        Intensity2 = (floor(x+1)-x)*InputImage(floor(x),ceil(y)) + (x-floor(x))*InputImage(ceil(x),ceil(y)); 
        Intensity = (floor(y+1)-y)*Intensity1 + (y-floor(y))*Intensity2;
        
        %Output image using Bilinear Interpolation
        OutIm_Bilinear(i,j) = Intensity;
    end
end

        





