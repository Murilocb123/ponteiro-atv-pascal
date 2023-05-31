program TrabalhoFutebolGabrielSchulzeMuriloPt;
uses crt;

const tam= 25;

type
   vet = array[1..tam] of string;
   vet_int = array[1..tam] of integer;

var fila: vet;
    op,posi_livre:integer;
    elem:string;

procedure inicializa(var pos:integer);
begin
   pos:=0;
end;

procedure ler_elemento(var el:string);
begin
  writeln('Digite o elemento');
  readln(el);
end;

procedure insere_fila(var f:vet; var posi:integer; var el:string);
begin
  if (posi<tam) then 
	begin
    posi:=posi+1;
    f[posi]:=el;
  end
  else begin
      writeln('Fila cheia');
      readkey
  end
end;

procedure remove_fila(var f:vet;var posi:integer);
var i:integer;
var el:string;
begin
  if posi>0 then 
	begin
     el:=f[1];
     for i:=1 to posi-1 do
        f[i]:=f[i+1];
     posi:=posi-1;
     writeln ('Elemento removido ',el);
  end
  else 
      writeln('Fila vazia');
  readkey
end;

procedure escreve_fila(f:vet;posi:integer);
var i:integer;

begin
	if posi>0 then
	begin
  	for I:=1 to posi do
     	writeln ('Posição: ', I, ' Elemento: ', f[i],' ');
  end
  else
  		writeln ('Fila vazia');
end;


{Programa Principal}
begin
   clrscr;
   inicializa(posi_livre);
   op:=0;
   while op<> 5 do 
	 begin
     clrscr;
     writeln ('    MENU    ');
     writeln ('------------');
     writeln;
     writeln (' 1-Inserir  ');
     writeln (' 2-Remover  ');
     writeln (' 3-Escrever ');
     writeln (' 4-Sair     ');
     writeln;
     write('    ==> ');
     readln (op);
     clrscr;
     if op =1 then 
		 begin
       ler_elemento(elem);
       insere_fila(fila,posi_livre,elem);
     end 
		 else if op =2 then 
        remove_fila(fila,posi_livre)
     else if op=3 then 
		 begin
         escreve_fila(fila,posi_livre);
         readkey;
     end;
   end;
end.                                                                          