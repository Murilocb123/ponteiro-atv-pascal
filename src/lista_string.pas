unit lista_string;
interface
uses crt, views;
const tam= 25;

type
   vet = array[1..tam] of string;
   
type 
tlista_string = record
     values: vet;
     posicao: integer;
end;

procedure inicializaListaString(var lista:tlista_string);
procedure ler_elemento(var el:string);
procedure insere_lista(var f:tlista_string; var el:string);
procedure remove_lista(var f:tlista_string; var posi:integer);
procedure escreve_lista(f:tlista_string);
procedure alterarDadosListaString(var lista:tlista_string);

implementation
procedure inicializaListaString(var lista:tlista_string);
begin
   lista.posicao:=0;
end;

procedure ler_elemento(var el:string);
begin
  writeln('Digite o elemento');
  readln(el);
end;

{criar procedimento para inserir na lista de forma ordenada}
procedure insere_lista(var f:tlista_string; var el:string);
var i:integer;
begin
  with f do begin
  if posicao<tam then
  begin
    if posicao=0 then
    begin
      posicao:=posicao+1;
      values[posicao]:=el;
    end
    else
    begin
      i:=posicao;
      while (i>0) and (el<values[i]) do
      begin
        values[i+1]:=values[i];
        i:=i-1;
      end;
      values[i+1]:=el;
      posicao:=posicao+1;
    end;
  end
  else
    writeln('lista cheia');
  end;
end;


procedure remove_lista(var f:tlista_string; var posi:integer);
var i:integer;
var el:string;
begin
  with f do begin 
  if posicao>0 then
  Begin
    if not(posi>posicao) then
    begin
      el:=values[posi];
      for i:=posi to posicao-1 do
        values[i]:=values[i+1];
      posicao:=posicao-1;
      writeln ('Elemento removido ',el);
    end
    else
    writeln ('Posição não existente');
  end
  else
  writeln('lista vazia');
  end;
  readkey
end;

procedure escreve_lista(f:tlista_string);
var i:integer;
begin
	if f.posicao>0 then
	begin
  	for I:=1 to f.posicao do
     	writeln ('Posicao: ', I, ' Elemento: ', f.values[i],' ');
  end
  else
  		writeln ('lista vazia');
end; 

procedure alterarDadosListaString(var lista:tlista_string);
var opcao,posi:integer;
    el:string;
begin
  escreve_lista(lista);
  while opcao<>4 do
  begin
    viewMenuTimeDados();
    readln(opcao);
    case opcao of
      1: begin
        ler_elemento(el);
        insere_lista(lista,el);
      end;
      2: begin
        viewRemove();
        readln(posi);
        remove_lista(lista,posi);
      end;
      3: begin
        escreve_lista(lista);
        readkey;
      end;
    end;
    clrscr();   
  end;
end;
end.
