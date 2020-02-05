function model = LoadParameters(type)
%
% First list the "default parameters".
% Then below list special cases.
%
model.nt = 2^10;
nx = 2^14; model.nx=nx;
model.tmax=250;
model.L = 1e7;
model.dt = model.tmax/model.nt;
model.dx = model.L/model.nx;
model.x = [0:nx-1]' * model.dx - model.L/2;
model.k = Make_Wavenumber_Vector(model.L,model.nx);

model.rhoi = 916;					% Density of ice
model.rhow = 1024;					% Density of water
h = 450;							% Ice thickness
model.H = 1000;						% Water depth
E = 8.7e9;							% Young's modulus
nu = 0.3;							% Poisson's Ratio
model.D = E * h^3 / 12 / (1-nu^2);	% Flexural Rigidity
model.g = 9.8;						% Gravity
model.P = -1;						% Applied Pressure, negative down
model.h=h;

model.t = linspace(0,model.tmax,model.nt);

phi0 = 0.072;
model.M = model.rhow * model.g * model.h^3 /12 * phi0;

if strcmpi(type,'ZeroRigidity')
	model.D = 0;
end
