function ref1 = ref1_1()

	% Trasarea caractristicii la scara semilogaritmica
	% Formula de calcul:
	% gamma = uT * 1/2.3 * delta_uD / delta_lg(iD)
	% uT = (const) 25mV
	% y - y0 = m(x - x0) => y - lg(iD(1)) = m(x - uD(1))
	% pentru x = 0 => y = y0 - mx0 => y = lg(iD(0)) - m * uD(0)
	iD = [0.1; 0.2; 0.5; 1; 2; 5; 10];
	uD_1N4148 = [0.580 0.719 1.078 1.590 2.629 5.575 11.310];
	uD_1N4007 = [0.584 0.716 1.045 1.555 2.530 5.550 11.300];
	uD_BAT42 = [0.315 0.440 0.765 1.230 2.23  5.260 11.300];
	uD_1N5819 = [0.260 0.370 0.683 1.183 2.142 5.110 11.280];
	uD_DZ3V3 = [2.040 2.320 2.875 3.600 4.825 8.150 11.440];
	uD_LEDR = [1.730 1.850 2.175 2.745 3.740 6.760 11.370];
	uD_LEDG = [1.850 1.970 2.300 2.840 3.900 6.910 11.370];
	uD_LEDB = [2.600 2.720 3.070 3.640 4.610 7.700 11.370];

	ud1 = [0.536 0.554 0.578 0.597 0.617 0.645 0.662];
	ud2 = [0.416 0.452 0.5 0.535 0.571 0.619 0.643];
	% din cauza ca in simulare aveam valori constante dioda BAT42 am egalat-o cu 1N4007
	ud3 = [0.416 0.452 0.5 0.535 0.571 0.619 0.643];
	ud4 = [0.067 0.087 0.113 0.134 0.155 0.182 0.197];
	ud5 = [1.786 2.053 2.407 2.676 2.945 3.3 3.482];
	ud6 = [1.551 1.587 1.634 1.67 1.706 1.754 1.778];
	ud7 = [1.717 1.771 1.843 1.897 1.951 2.022 2.059];
	ud8 = [3.036 3.09 3.161 3.215 3.269 3.34 3.337];



	uD = [uD_1N4148; uD_1N4007; uD_BAT42; uD_1N5819; uD_DZ3V3; uD_LEDR; uD_LEDG; uD_LEDB];
	%semilogx(uD_1N4148,iD,uD_1N4007,iD,uD_BAT42,iD,uD_1N5819,iD,uD_DZ3V3,iD,uD_LEDR,iD,uD_LEDG,iD,uD_LEDB,iD)
	ud = [ud1; ud2; ud3; ud4; ud5; ud6; ud7; ud8];
	hold on

	xlabel ("uD(V)");
	ylabel ("lg iD(iD/1mA)");


	hold on
	semilogx(ud1,iD,'k','LineWidth',2)
	semilogx(ud2,iD,'m','LineWidth',2)
	semilogx(ud3,iD,'c','LineWidth',2)
	semilogx(ud4,iD,'k','LineWidth',2)
	semilogx(ud5,iD,'c','LineWidth',2)
	semilogx(ud6,iD,'r','LineWidth',2)
	semilogx(ud7,iD,'g','LineWidth',2)
	semilogx(ud8,iD,'b','LineWidth',2)
	legend ("uD_1N4148","uD_1N4007","uD_BAT42","uD_1N5819","uD_DZ3V3","uD_LEDR","uD_LEDG","uD_LEDB");
	hold off

	delta_lgiD = log(iD(7) - iD(1));
	delta_ud = zeros(8,1);
	for i = 1:8
		delta_ud(i) = ud(i,7) - ud(i,1);
	end

	for i = 1:8
		gamma(i) = 1/25 * 1/(2.3) * delta_ud(i) / delta_lgiD * 10 ^ 3;
	end

	gamma

	for i = 1:8
		I0(i) = log(iD(1)) - (delta_lgiD  / delta_ud(i)) * ud(i,1); % mA
		% y   =    y0	   -              m             *    x0
		% folosind ecuatia dreptei det. de panta si punctul (iD(1),ud(i,1))
	end
	I0

end
