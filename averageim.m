function averageim
im=imread('lena.bmp');
im=im/4;
Out=zeros(256,256,100);

for i=1:100
    Position=ceil(rand(5000,2)*256);
    noiseim=im;
     for j=1:5000
        noiseim(Position(j,1),Position(j,2))=255;
    end
    Out(:,:,i)=noiseim;
end

