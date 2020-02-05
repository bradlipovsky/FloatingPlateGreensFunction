clear;

model = LoadParameters('');
G = SemiAnalyticGreenFunction(model);
[~,G_moment] = gradient(G,model.dx);
G_moment = G_moment * model.M;

%subplot(121);
[b,a]=butter(2,1/ (1/2/model.dt),'low'); % 1 Hz lowpass
[~,station_location] = min(abs(model.x - 20e3));
G_moment_f = filtfilt(b,a, G_moment(station_location,:) );

figure(1);
plot(model.t,G_moment_f);
xlabel('Time (s)'); ylabel('Vertical Displacement (m)');
hold off;

figure(2);
pcolor(model.t,model.x/1e3,G_moment ); 
ylabel('Space (km)'); xlabel('Time (s)');
shading flat;
caxis([-1 1]*1e-8)
ylim(100*[-1 1]);
hold off;
