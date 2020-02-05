function G = SemiAnalyticGreenFunction(model)

Q = model.P/model.rhoi/model.h;
C =  model.D*model.k.^4;
B = model.rhoi*model.h; 
A = sqrt(C./B); % Has units of frequency
t = model.t;
G = zeros(model.nx,model.nt);
dx = model.L/model.nx;

for i = 1:model.nt
	Ghat = Q .* sin( t(i) * A) ./ A;
	Ghat(1) = Q * t(i); % Beam
	G(:,i) = ifftshift(ifft(Ghat))/dx;
end

G = G * model.rhoi * model.h; % undo scaling; return physical units
