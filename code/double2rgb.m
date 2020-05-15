function double2rgb(r,g,b,n, picture)
  [uR, sR, vR] = svd(r);
  [uG, sG, vG] = svd(g);
  [uB, sB, vB] = svd(b);
  
  imgR = uR(:,1:n) * sR(1:n,1:n) * transpose(vR(:,1:n));
  imgG = uG(:,1:n) * sG(1:n,1:n) * transpose(vG(:,1:n));
  imgB = uB(:,1:n) * sB(1:n,1:n) * transpose(vB(:,1:n));
  
  img = picture;
  
  img(:,:,1) = imgR;
  img(:,:,2) = imgG;
  img(:,:,3) = imgB;
  
  imshow(img*255)
endfunction
