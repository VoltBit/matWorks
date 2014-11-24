function f = ref3()

	size = 5;
	u0 = [2.6 3.58 0.069 1.5 0.678]; # V
	ui = [53 46 71.7 31 71.1]; # mV
	u0inf = [ 4.8 6.56 0.103 3.21 1.33 ]; # V
	vcc = [ 10 15 15 15 15 ]; # V
	fgen = [ 3 3 3 30 3 ];
	rgen = [ 47 47 47 0.22 47 ]; # kOhm
	rsar = [  4.7 4.7 0.22 4.7 4.7]; # kOhm
	ug = [ 0.4 0.4 0.4 0.2 0.4 ]; # V
	Zo = zeros(1,size); Au = zeros(1,size); Ai = zeros(1,size); Zi = zeros(1,size);
	for i = 1:size
		Zo(i) = rsar(i) * ( u0inf(i) / u0(i) - 1);
	endfor
	Zo
	for i = 1:size
		Au(i) = u0(i) / ui(i) * 10^3;
	endfor
	Au
	for i = 1:size
		Ai(i) = (u0(i) / (ug(i) - ui(i) * 10^(-3))) * rgen(i) / rsar(i);
	endfor
	Ai
	for i = 1:size
		Zi(i) = (ui(i) / (ug(i) * 10^3 - ui(i))) * rgen(i);
	endfor
	Zi
	
	#Z0 = rsar * (u0inf / u0 - 1)
	#Au = u0 / ui
	#Ai = (u0 / (ug - ui)) * rgen / rsar
	#Zi = (ui / (ug - ui)) * rgen
		
	Nume = {"EM(PSF1)"; "EM(PSF2)"; "CM"; "BM"; "SD"};
	bar(Au,'g')
	set(gca, 'XTick', 1:5, 'XTickLabel', Nume);
	title("Dimensiunea amplificarii de tensiune",'FontSize',20)
	xlabel("Tipul conexiunii",'FontSize',16)
	ylabel("Valoarea amplificarii",'FontSize',16)
	
	figure()
	bar(Ai,'g')
	set(gca, 'XTick', 1:5, 'XTickLabel', Nume);
	title("Dimensiunea amplificarii de curent",'FontSize',20)
	xlabel("Tipul conexiunii",'FontSize',16)
	ylabel("Valoarea amplificarii",'FontSize',16)
	
	text = strcat("Valoarea impedantei (k",'\Omega',")");
	
	figure()
	bar(Zi,'g')
	set(gca, 'XTick', 1:5, 'XTickLabel', Nume);
	title("Dimensiunea impedantei de intrare",'FontSize',20)
	xlabel("Tipul conexiunii",'FontSize',16)
	ylabel(text,'FontSize',16)
	
	figure()
	bar(Zo,'g')
	set(gca, 'XTick', 1:5, 'XTickLabel', Nume);
	title("Dimensiunea impedantei de iesire",'FontSize',20)
	xlabel("Tipul conexiunii",'FontSize',16)
	ylabel(text,'FontSize',16)

end
