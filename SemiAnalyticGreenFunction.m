function G = SemiAnalyticGreenFunction(model)

Q = model.P/model.rhoi/model.h;
AlphaXi = ( model.D*model.k.^4 /  model.rhoi/model.h ).^(1/4); % Has units of frequency
t = model.t;
G = zeros(model.nx,model.nt);
dx = model.L/model.nx;

for i = 1:model.nt
	Ghat = Q .* sin( t(i) * AlphaXi.^2) ./ AlphaXi.^2;
	Ghat(1) = Q * t(i); % Beam
	G(:,i) = ifftshift(ifft(Ghat))/dx;
end

