function m = AA_testing()

	A = linspace(1,1000000,10000);
	f = A;
	g = log(A).^5;
	hold
	plot(A,f,'r','LineWidth',2);
	plot(A,g,'LineWidth',2);
	title('n vs (log(n))^5')
	legend('n','(log(n))^5');

	f = log(A);
	g = log(A.^2);
	figure()
	hold
	plot(A,f,'r','LineWidth',2);
	plot(A,g,'LineWidth',2);
	title('log(n) vs (log(n^2)')
	legend('log(n)','(log(n^2)');

	f = A.*100 + log(A);
	g = A + log(A).^10;
	figure()
	hold
	plot(A,f,'r','LineWidth',2);
	plot(A,g,'LineWidth',2);
	title('n*100 + log(n) vs n + (log(n))^10')
	legend('n*100 + log(n)','n + (log(n))^10');

print("test");

endfunction
