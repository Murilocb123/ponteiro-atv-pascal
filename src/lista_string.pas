unit lista_string;
uses crt;
interface
const tam= 25;

type
   vet = array[1..tam] of string;
   
type 
lista_string = record
     values: vet;
     posicao: integer;
end;

procedure inicializa(var lista:lista_string);
procedure ler_elemento(var el:string);
procedure insere_fila(var f:lista_string; var el:string);
procedure remove_fila(var f:lista_string; var posi:integer);
procedure escreve_fila(f:lista_string);

implementation
procedure inicializa(var lista:lista_string);
begin
   lista.posicao:=0;
end;

procedure ler_elemento(var el:string);
begin
  writeln('Digite o elemento');
  readln(el);
end;

procedure insere_fila(var f:lista_string; var el:string);
begin
  if (lista_string.posicao<tam) then 
	begin
    lista_string.posicao:=lista_string.posicao+1;
    lista_string.values[lista_string.posicao]:=el;
  end
  else begin
      writeln('Fila cheia');
      readkey
  end
end;

procedure remove_fila(var f:lista_string; var posi:integer);
var i:integer;
var el:string;
begin
  if f.posicao>0 then
  Begin
    if not(posi>f.posicao) then
    begin
      el:=f.values[posi];
      for i:=posi to f.posicao-1 do
        f.values[i]:=f.values[i+1];
      f.posicao:=f.posicao-1;
      writeln ('Elemento removido ',el);
    end
    else
    writeln ('Posição não existente');
  end
  else
  writeln('Fila vazia');
  readkey
end;

procedure escreve_fila(f:lista_string);
var i:integer;
begin
	if posi>0 then
	begin
  	for I:=1 to posi do
     	writeln ('Posicao: ', I, ' Elemento: ', f.values[i],' ');
  end
  else
  		writeln ('Fila vazia');
end;                                                                        