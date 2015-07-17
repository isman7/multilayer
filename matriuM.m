%% function [n] = matriuM(material, l, l_r)
%%
%%	material: ha de ser una cel·la d'strings, amb els noms de tots els materials dels que es vol calcular el seu index. 
%%	l: Es un vector que representa totes les longituds d'ona per les que es vol la matriu M .
%%	l_r: longitud de referecia.
%%
%%	Exemple: 	matriuM({"vidre" "bk7" "mgf2"}, 0.4:0.1:1, 0.587) 
		
function [M] = matriuM(material, l, l_r)
	
	n = i_refraccio(material, l); 
	d = l_r./(4*(i_refraccio(material, l_r))');
	M = zeros(2,2,size(n,2),size(d,2));
	
	k = 2*pi./l;
	
	for z = 1:size(d,2)
		
		M(1,1,:,z) = cos(k.*n(z,:).*d(z));
		M(1,2,:,z) = i*sin(k.*n(z,:).*d(z))./n(z,:);
		M(2,1,:,z) = i*n(z,:).*sin(k.*n(z,:).*d(z));
		M(2,2,:,z) = M(1,1,:,z);
	end
				

