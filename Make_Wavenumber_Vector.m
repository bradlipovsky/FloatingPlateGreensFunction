function k = Make_Wavenumber_Vector(L,nx)

model.nt = 2^10;
model.tmax=250;
model.dt = model.tmax/model.nt;
model.L = 1e7;

dx = L/nx; 
k = zeros(nx,1);
k(1:nx/2+1) = 2*[0:nx/2]/nx;
k(nx:-1:nx/2+2) = -k(2:nx/2);
k = k*pi/dx;
