function [outim1, outim2]=assign2(I)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Image Processing Class Assignment 2    %
%                                        %
% Name - Oyesh Mann Singh                %
% LUID - L20372791                       %
%                                        %
% Implementation of Mean Filter          %  
% and Laplacian Filter                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

inim = double(I);

% step 1: call smoothfcn and sharpenfcn to filter image and save the output
% image to outim1;
outim1 = smoothfcn(inim);
outim1 = sharpenfcn(outim1);

% step 2: call sharpenfcn and smoothfcn to filter image and save the output
% image to outim2;
outim2 = sharpenfcn(inim);
outim2 = smoothfcn(outim2);

%display the output images
figure(1)
subplot(1,3,1)
imshow(uint8(I))
subplot(1,3,2)
imshow(uint8(outim2));
subplot(1,3,3)
imshow(uint8(outim2));

% step 3: computer subtraction using outim1 and outim2 and save it to subim
subim = round(imsubtract(outim2,outim1));
subim = sum(sum(abs(subim)));
% step 4: sum the subim to see whether all intensities are zeros.
disp(['The difference is:' num2str(subim)]);
end

function outImage1=smoothfcn(inputImage)
    [row, col] = size(inputImage);
    outImage1=(zeros(row,col));
    mean_filter = double(ones(3,3));
    % step 5: define and apply 3*3 mean filter
    
    %copying the border from input image to output image
	for x = 1:row
        outImage1(x,1) = inputImage(x,1);
    end
    
    %copying the border from input image to output image
    for y = 1:col
        outImage1(1,y) = inputImage(1,y);
    end
    
    %copying the border from input image to output image
    for a = 1:col
        outImage1(row,a) = inputImage(row,a);
    end
    
    %copying the border from input image to output image
    for b = 1:row
        outImage1(b,col) = inputImage(b,col);
    end
    
    %apply mean filter with convolution method
	for i = 2:row-1
		for j = 2:col-1
			temp_mat = [ inputImage(i-1,j-1) inputImage(i-1,j) inputImage(i-1,j+1); inputImage(i,j-1) inputImage(i,j) inputImage(i,j+1); inputImage(i+1,j-1) inputImage(i+1,j) inputImage(i+1,j+1)];
			outImage1(i,j) = (sum(sum(mean_filter .* temp_mat)) / 9);
		end
	end
end


function outImage2=sharpenfcn(inputImage)
    [row, col] = size(inputImage);
    outImage2=(zeros(row,col));
    laplace_filter = double([0 -1 0; -1 4 -1; 0 -1 0]);
    % step 6: define and apply 3*3 Laplacian filter (center value 4);
	
    %copying the border from input image to output image
    for x = 1:row
        outImage2(x,1) = inputImage(x,1);
    end
    
    %copying the border from input image to output image
    for y = 1:col
        outImage2(1,y) = inputImage(1,y);
    end
    
    %copying the border from input image to output image
    for a = 1:col
        outImage2(row,a) = inputImage(row,a);
    end
    
    %copying the border from input image to output image
    for b = 1:row
        outImage2(b,col) = inputImage(b,col);
    end
    
    %apply laplace filter with convolution method
    for i = 2:row-1
		for j = 2:col-1
			temp_mat = [ inputImage(i-1,j-1) inputImage(i-1,j) inputImage(i-1,j+1); inputImage(i,j-1) inputImage(i,j) inputImage(i,j+1); inputImage(i+1,j-1) inputImage(i+1,j) inputImage(i+1,j+1)];
            outImage2(i,j) = sum(sum((laplace_filter .* temp_mat)));
		end
    end 
end
