function res = hbg(im,thresh)

% inputs
% im is the fourier transform of the image
% thresh is the cutoff circle radius

%outputs
% res is the boosted image


[r,c]=size(im);
d0=thresh;
d=zeros(r,c);
h=zeros(r,c);

for i=1:r
    for j=1:c
     d(i,j)=  sqrt( (i-(r/2))^2 + (j-(c/2))^2);
    end
end

A=1.75; % boost factor or coefficient

for i=1:r
    for j=1:c
        
         h(i,j)= 1-exp ( -( (d(i,j)^2)/(2*(d0^2)) ) );
         h(i,j)=(A-1)+h(i,j);
    end
  
end


for i=1:r
    for j=1:c
    res(i,j)=(h(i,j))*im(i,j);
    end
end




