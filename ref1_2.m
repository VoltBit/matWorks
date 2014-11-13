function ref1 = ref1_2()

	iD = [0.1 0.2 0.5 1 2 5 8];
	ud1 = [0.536 0.554 0.578 0.597 0.617 0.645 0.662];
	ud2 = [0.416 0.452 0.5 0.535 0.571 0.619 0.643];
	% din cauza ca in simulare aveam valori constante dioda BAT42 am egalat-o cu 1N4007
	ud3 = [0.416 0.452 0.5 0.535 0.571 0.619 0.643];
	ud4 = [0.067 0.087 0.113 0.134 0.155 0.182 0.197];
	ud5 = [1.786 2.053 2.407 2.676 2.945 3.3 3.482];
	ud6 = [1.551 1.587 1.634 1.67 1.706 1.754 1.778];
	ud7 = [1.717 1.771 1.843 1.897 1.951 2.022 2.059];
	ud8 = [3.036 3.09 3.161 3.215 3.269 3.34 3.337];

	ux = [0 5];
	ix = [5 0];
	figure;
	xlabel('uD(V)'); ylabel('id(mA)'); title('1N4148');

	%[coord_Ud,coord_Id] = ployxpoly(ud1,iD,ux,ix);
	plot(ud1,iD,ux,ix);


	figure(8)
	xlabel('uD(V)'); ylabel('id(mA)'); title('LEDB');

	%[coord_Ud,coord_Id] = ployxpoly(ud1,iD,ux,ix);
	plot(ud8,iD,ux,ix);
end