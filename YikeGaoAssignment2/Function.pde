PImage invert(PImage im)
{
  PImage im_new = im.copy();
  float R, G, B;
  float R_new, G_new, B_new;
  color c, c_new;
  colorMode(RGB,255);
  for (int x=0; x<im.width; x++)
    for (int y=0; y<im.height; y++)
    {
      c = im.get(x, y);
      R = red(c);
      G = green(c);
      B = blue(c);
      R_new = 255 - R;
      G_new = 255 - G;
      B_new = 255 - B;
      c_new = color (R_new, G_new, B_new);
      im_new.set (x, y, c_new);
    }
  return im_new;
}
PImage threshold(PImage im){
PImage im_new = im.copy();
float R,G,B;
color c,c_new;
float g;
colorMode(RGB,255);
 for (int x=0; x<im.width; x++)
    for (int y=0; y<im.height; y++)
    {
      c = im.get(x, y);
      R = red(c);
      G = green(c);
      B = blue(c);
      g = (R +G +B)/3;
      if(g>200 )
      {c_new = color (255);}
      else if(g>150){
      c_new = color(200);
      }else if(g>100){
      c_new = color(150);
      }else if(g>50){
      c_new = color(50);}
      else{
      c_new = color(0);
      }
      
      im_new.set (x, y, c_new);
    }

return im_new;
}

PImage greyscale(PImage im) {
  PImage im_new = im.copy();
  float R, G, B;
  color c, c_new;
  colorMode(RGB,255);
  for (int x=0; x<im.width; x++)
    for (int y=0; y<im.height; y++)
    {
      c = im.get(x, y);
      R = red(c);
      G = green(c);
      B = blue(c);
      c_new = color ((R+G+B)/3);
      im_new.set (x, y, c_new);
    }
  return im_new;
}
PImage brighten(PImage im){
  PImage im_new = im.copy();
  float R, G, B;
  float R_new, G_new, B_new;
  color c, c_new;
  colorMode(RGB,255);
  for (int x=0; x<im.width; x++)
    for (int y=0; y<im.height; y++)
    {
      c = im.get(x, y);
      R = red(c);
      G = green(c);
      B = blue(c);
      R_new = R+100;
      G_new = G+100;
      B_new = B+100;
      c_new = color (R_new, G_new, B_new);
      im_new.set (x, y, c_new);
    }
  return im_new;

}

PImage darken(PImage im){
  PImage im_new = im.copy();
  float R, G, B;
  float R_new, G_new, B_new;
  color c, c_new;
  colorMode(RGB,255);
  for (int x=0; x<im.width; x++)
    for (int y=0; y<im.height; y++)
    {
      c = im.get(x, y);
      R = red(c);
      G = green(c);
      B = blue(c);
      R_new = R-100;
      G_new = G-100;
      B_new = B-100;
      c_new = color (R_new, G_new, B_new);
      im_new.set (x, y, c_new);
    }
  return im_new;

}
PImage colorizeBlue(PImage im){
  PImage im_new = im.copy();
  float R, G, B;
  color c, c_new;
  colorMode(RGB,255);
  for (int x=0; x<im.width; x++)
    for (int y=0; y<im.height; y++)
    {
      c = im.get(x, y);
      R = red(c);
      G = green(c);
      B = blue(c);
      c_new = color (0, 0, B);
      im_new.set (x, y, c_new);
    }
  return im_new;

}
PImage highSaturation(PImage im){
PImage im_new = im.copy();
float H,S,B;
color c,c_new;
colorMode(HSB,255);
  for (int x=0; x<im.width; x++)
    for (int y=0; y<im.height; y++){
    c = im.get(x,y);
    H = hue(c);
    S = saturation(c);
    B = brightness(c);
    c_new = color(H,S+100,B);
    im_new.set(x,y,c_new);
    
    }
return im_new;

}

PImage blendImage(PImage im, PImage im2, float T )
{
PImage im_new = im.copy();
float R_new, G_new, B_new;
color c1, c2, c_new;
for (int x=0; x<im.width; x++)
for (int y=0; y<im.height; y++)
{
c1 = im.get(x, y);
c2 = im2.get(x, y);
R_new = red(c1)*T + red(c2)*(1-T);
G_new = green(c1)*T + green(c2)*(1-T);
B_new = blue(c1)*T + blue(c2)*(1-T);
c_new = color (R_new, G_new, B_new);
im_new.set (x, y, c_new);
}
return im_new;
}

PImage maskImage(PImage im, PImage mask)
{
PImage im_new = createImage(im.width, im.height, ARGB);
float R_new, G_new, B_new, A_new;
color c1, c2, c_new;
for (int x=0; x<im.width; x++)
for (int y=0; y<im.height; y++)
{
c1 = im.get(x, y);
c2 = mask.get(x, y);
R_new = red(c1);
G_new = green(c1);
B_new = blue(c1);
A_new = brightness(c2);
c_new = color (R_new, G_new, B_new, A_new);
im_new.set (x, y, c_new);
}
return im_new;
}

PImage subtractImage(PImage im, PImage im2 )
{
PImage im_new = im.copy();
float R_new, G_new, B_new;
color c1, c2, c_new;
for (int x=0; x<im.width; x++)
for (int y=0; y<im.height; y++)
{
c1 = im.get(x, y);
c2 = im2.get(x, y);
R_new = red(c1) - red(c2);
G_new = green(c1) - green(c2);
B_new = blue(c1) - blue(c2);
c_new = color (R_new, G_new, B_new);
im_new.set (x, y, c_new);
}
return im_new;
}
