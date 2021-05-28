function visualize_mishras_bird_func_2d
  x=linspace(-10,0,1000);
  y=linspace(-10,0,1000);
  [xx,yy]=meshgrid(x,y);
  
  contour(xx,yy,sin(yy)*e.^((1-cos(xx)).^2)+cos(xx)*e.^((1-sin(yy)).^2)+(xx-yy).^2)
  
  hold on
  
  function z = g(x,y)
    val = (xx+5).^2 + (yy+5).^2 - 25;
    z = val < 0;
    z = double(z);
  endfunction
  
  g = g(xx,yy);
  contour(xx,yy,g)
  
endfunction