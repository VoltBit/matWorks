function f1 = eea_ref_4()

	#Amplificarea de tensiune: Uout / Uin
	# Circuit inversor____________(1)
	printf("\nCircuit inversor \n");
	
	# Vout = (-1) * Rf * Uin / Rin
	# Vout = -URf
	# URf = Rf * I2 ( unde I2 = I1)
	
	Rf = 10 * 10^3; #(Ohm)
	Rin = 10^3; #(Ohm)
	Uin = 460 * 10^(-3); #(V)
	VoutM = 4.59
	
	Vout = (-1) * Rf * Uin / Rin #(V)
	AuM = VoutM / Uin
	AuC = Vout / Uin
	
	#Verificare:
	I1 = Uin / Rin;
	printf("Verificare: ");
	(-1) * Rf * I1
	printf ("\n");
	
	#Circuit neinversor____________(2)
	printf("Circuit neinversor \n");
	
	#Vout = (1 + R2 / R1) * Uin
	#Vout = Uin - UR2
	
	Uin = 468 * 10^(-3);
	R1 = 10^3;
	R2 = 10^4;
	VoutM = 5.17
	Vout = (1 + R2 / R1) * Uin
	AuM = VoutM / Uin
	AuC = Vout / Uin
	
	printf ("\n");
	#Circuit integrator____________(3)
	printf("Circuit integrator \n");
	
	Uin = 712 * 10^(-3);
	R = 10^3;
	C = 100 * 10^(-9); #F
	VoutM = 5.9
	#Vout = int(Uin / R * C, t = 0..infinity)
	# Vout = (-1) * integrala[0 to inf] (Vin / R * C)
	
	# I = Vin / R
	# Zc = 1 / s * C unde s = 2 * pi * f, unde f este frecventa
	#Zc = 1 / 2 * pi * f * C
	f = 200;
	I = Uin / R;
	Zc = 1 /( 2 * pi * f * C);
	Vout = (-1) * I * Zc
	
	AuM = VoutM / Uin
	AuC = Vout / Uin
	printf ("\n");
endfunction
