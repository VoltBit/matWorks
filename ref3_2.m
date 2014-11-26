function f = ref3_2()

	size = 5;
	u0 = [1.5 2.3 0.062 1.44 0.62]; # V
	ui = [29.1 24 64.3 37.7 64.3]; # mV
	u0inf = [ 3 3.7 0.075 3.6 1.2 ]; # V
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
	title("Dimensiunea amplificari de curent",'FontSize',20)
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
