%% function [n] = i_refraccio(M, x)
%%
%%	M: ha de ser una cel·la d'strings, amb els noms de tots els materials dels que es vol calcular el seu index. 
%%	x: Es un vector que representa totes les longituds d'ona per les que es vol calcular l'index .
%%	n: Pot ser un escalar, un vector o una matriu segons les dimension de M i x.
%%
%%	Exemple: 	i_refraccio({'vidre' 'bk7' 'mgf2'}, 0.4:0.1:1), per tant n sera una matriu, on cada fila correspon a cada material.
		
						
function [n] = i_refraccio(M, x)
	
	n = zeros(size(M,2),size(x,2));
	
	
	for z=1:size(M,2);
	
	switch M{1,z}

		case {'TiO2' 'tio2' 'Tio2' 'TiO_2'}
		
		n(z,:) =   sqrt( 5.913 + 0.2441*x.^2./(x.^2-0.0803) );
		
		case {'MgF2' 'mgf2' 'Mgf2' 'MgF_2'}
		
		n(z,:) = (sqrt(1+ ((0.48755108.*x.^2)./(x.^2-0.04338408^2))+((0.39875031*x.^2)./(x.^2-0.09461442^2))+((2.3120353.*x.^2)./(x.^2-23.793604^2))));
		
		case {'BK7' 'bk7' 'BK_7'}
		
		n(z,:) =  (sqrt( 1 + 1.03961212.*x.^2./(x.^2-0.00600069867) + 0.231792344*x.^2/(x.^2-0.0200179144) + 1.01046945*x.^2./(x.^2-103.560653) ));
		
		case {'Vidre' 'vidre'}
		
		n(z,:) = (1.52*ones(1, size(x,2)));
		
		case {'vacio' 'aire' '1'}
		
		n(z,:) = (1.*ones(1, size(x,2)));
		
		otherwise
		
		error('Error 404,  material number "%d" not found \n', z)
		
	end	
	end
		
	if (size(M,2) == 1)
	%plot(x, n, '-;n;');
	end
	
	%switch size(x,2)
	%	case 1 break
	%	otherwise 
			
	%		plot(x, n, '-;n(lambda);');
	%		plot(x, n(2;:),'-;MgF2;')
	%		plot(x, n(3;:),'-;BK7;')
	%		plot(x, n(4;:),'-;Vidre;')
	%endswitch
	

