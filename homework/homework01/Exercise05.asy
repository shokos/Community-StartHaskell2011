import three;

currentprojection=perspective(3,-3,2,center=true);
size(5cm);

path3 ls12=(1,0,0)..(1,2,0);
path3 ls23=(1,2,0)..(0,2,1);
path3 ls34=(0,2,1)..(0,0,1);
path3 ls41=(0,0,1)..(1,0,0);
path3 ls16=(1,0,0)..(-1,0,0);
path3 ls64=(-1,0,0)..(0,0,1);
path3 ls65=(-1,0,0)..(-1,2,0);
path3 ls35=(0,2,1)..(-1,2,0);
path3 ls52=(-1,2,0)..(1,2,0);

draw(ls12);
draw(ls23);
draw(ls34);
draw(ls41);
draw(ls16);
draw(ls64);
draw(ls65,dashed);
draw(ls35,dashed);
draw(ls52,dashed);

dot(ls12,red);
dot(ls34,red);
dot(ls65,red);

label("1",(1,0,0),SE,red);
label("2",(1,2,0),SE,red);
label("3",(0,2,1),N,red);
label("4",(0,0,1),N,red);
label("5",(-1,2,0),NW,red);
label("6",(-1,0,0),SW,red);
