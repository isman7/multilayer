%% function [] = Ncapes(materials, sub, l_r, N)
%%
%%	materials: ha de ser una cel·la d'strings, amb els noms de tots els materials que formaran el recobriment, importa l´ordre. 
%%	sub: ha de ser una cel·la d'un component, amb una string que informi de forma correcta del material que tindrem a la base.
%%	N: Es el nombre de cops que volem aplicar la composicio de capes escollida a 'materials'.
%%	l_r: longitud de referecia.
%%
%%	


	
function [l, R, T] = Ncapes(materials, sub, l_r, N)
	
	l = 0.4:0.005:1;
	R = zeros(1,size(l,2));
	T = zeros(1,size(l,2));
	n_s = i_refraccio(sub,l);
	
	
	m = matriuM(materials,l,l_r);
	M =  m(:,:,:,1);
	
	if size(materials,2)>1
		for f = 2:size(materials,2)
	
			for z= 1:size(m,3)
		
			M(:,:,z) = M(:,:,z)*m(:,:,z,f);
			M(:,:,z) = M(:,:,z)^N;
			
			end
		end
	end
	
	
	for z = 1:size(T,2)
		
	R(z) = (abs((M(1,1,z)-M(2,1,z) + n_s(z)*(M(2,1,z)-M(2,2,z)))/(M(1,1,z)+(n_s(z)*M(1,2,z))+M(2,1,z)+(n_s(z)*M(2,2,z)))))^2;
	
	end
	
	T = 1-R;	
	

		

