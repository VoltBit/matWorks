function ref1 = ref1_1()


	% Trasarea caractristicii la scara semilogaritmica
	% Formula de calcul:
	% gamma = uT * 1/2.3 * delta_uD / delta_lg(iD)
	% uT = (const) 25mV
	% I0 = ?
	iD = [0.1; 0.2; 0.5; 1; 2; 5; 8];
	uD_1N4148 = [0.580 0.719 1.078 1.590 2.629 5.575 11.310];
	uD_1N4007 = [0.584 0.716 1.045 1.555 2.530 5.550 11.300];
	uD_BAT42 = [0.315 0.440 0.765 1.230 2.23  5.260 11.300];
	uD_1N5819 = [0.260 0.370 0.683 1.183 2.142 5.110 11.280];
	uD_DZ3V3 = [2.040 2.320 2.875 3.600 4.825 8.150 11.440];
	uD_LEDR = [1.730 1.850 2.175 2.745 3.740 6.760 11.370];
	uD_LEDG = [1.850 1.970 2.300 2.840 3.900 6.910 11.370];
	uD_LEDB = [2.600 2.720 3.070 3.640 4.610 7.700 11.370];

	uD = [uD_1N4148; uD_1N4007; uD_BAT42; uD_1N5819; uD_DZ3V3; uD_LEDR; uD_LEDG; uD_LEDB];
	%semilogx(uD_1N4148,iD,uD_1N4007,iD,uD_BAT42,iD,uD_1N5819,iD,uD_DZ3V3,iD,uD_LEDR,iD,uD_LEDG,iD,uD_LEDB,iD)
	hold on

	xlabel ("uD(V)");
	ylabel ("lg iD(iD/1mA)");
	semilogx(uD_1N4148,iD,'k','LineWidth',2)
	semilogx(uD_1N4007,iD,'m','LineWidth',2)
	semilogx(uD_BAT42,iD,'c','LineWidth',2)
	semilogx(uD_1N5819,iD,'k','LineWidth',2)
	semilogx(uD_DZ3V3,iD,'c','LineWidth',2)
	semilogx(uD_LEDR,iD,'r','LineWidth',2)
	semilogx(uD_LEDG,iD,'g','LineWidth',2)
	semilogx(uD_LEDB,iD,'b','LineWidth',2)
	legend ("uD_1N4148","uD_1N4007","uD_BAT42","uD_1N5819","uD_DZ3V3","uD_LEDR","uD_LEDG","uD_LEDB");
	hold off

	delta_lgiD = log(iD(7)) - log(iD(1));
	delta_uD = zeros(8,1);
	for i = 1:8
		delta_uD(i) = uD(i,7) - uD(i,1);
	end
	
	for i = 1:8
		gamma(i) = 25 * 1/2.3 * delta_uD(i) / delta_lgiD;
	end

	gamma



	%________________________________________________

	% Determinarea PSF
	pause
end
