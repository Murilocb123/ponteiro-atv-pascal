unit lista_string;

interface
type tipoInf = string;
type tListaPonteiro = ^l;
l = record
    anterior:tListaPonteiro;
    dado:tipoInf;
    prox:tListaPonteiro;
end;

procedure escreverListaString(lista:tListaPonteiro);
procedure escreverListaStringtst(lista:tListaPonteiro);
procedure removerDaListaStringPorPosicao(posicao: integer; var lista: tListaPonteiro);
procedure inserirNaListaString(valor: tipoInf;var lista: tListaPonteiro);
procedure inicializarListaString(var lista: tListaPonteiro);

implementation
//Procedimentos
procedure escreverListaString(lista: tListaPonteiro);
var aux:tListaPonteiro;
    posi:integer;
begin
    if (lista=NIL) then
        writeln('Lista vazia')
    else
    begin
        aux:=lista;
        while (aux<>NIL) do
        begin
            posi:=posi+1;
            writeln(posi ,' - ',aux^.dado);
            aux:=aux^.prox;
        end;
    end;
    readkey;
end;

{prova real}
procedure escreverListaStringtst(lista: tListaPonteiro);
var aux:tListaPonteiro;
    posi:integer;
begin
    if (lista=NIL) then
        writeln('Lista vazia')
    else
    begin
        aux:=lista;
        while (aux<>NIL) do
        begin
            posi:=posi+1;
            writeln('-------------------');
            writeln((posi-1) ,' - ',aux^.anterior^.dado);
            writeln(posi ,' - ',aux^.dado);
            writeln((posi+1) ,' - ',aux^.prox^.dado);
            writeln('-------------------');
            aux:=aux^.prox;
        end;
    end;
    readkey;
end;

procedure removerDaListaStringPorPosicao(posicao: integer; var lista: tListaPonteiro);
var aux, anterior:tListaPonteiro;
    i:integer;
begin
    if (lista=NIL) then
        writeln('Lista vazia')
    else
    begin
        aux:=lista;
        anterior:=lista;
        i:=1;
        while (aux<>NIL) and (i<posicao) do
        begin
            anterior:=aux;
            aux:=aux^.prox;
            i:=i+1;
        end;
        if (aux=NIL) then
        begin
            writeln('Posicao nao encontrada');
            readkey;
        end
        else
        begin
            if (aux=lista) then
                lista:=lista^.prox
            else
                anterior^.prox:=aux^.prox;
            dispose(aux);
        end;
    end;
end;  

{Insere na lista de forma ordenada, considerando que ou será inserido no inicio ou depois de um elemento}
procedure inserirNaListaString(valor: tipoInf; var lista: tListaPonteiro);
var atual, anterior, newValue: tListaPonteiro;
    bExiste: boolean;
begin
  new(newValue);
  if (newValue=NIL) then
      writeln('Memoria cheia')
  else 
  begin
      inicializarListaString(newValue^.anterior);
      newValue^.dado:=valor;
      inicializarListaString(newValue^.prox);
      if NOT(lista=NIL) and NOT (lista^.dado > newValue^.dado) then
      begin
        atual:=lista;
        while (atual<>NIL) and (atual^.dado <= newValue^.dado) and not(bExiste) do
        begin
          if (atual^.dado = newValue^.dado) then
            bExiste:=true;
          anterior:=atual;
          atual:=atual^.prox;
        end;
          if bExiste then
          begin
            writeln('Valor ja existe na lista');
            dispose(newValue);
            readkey;
          end
          else 
          begin
            newValue^.anterior:=anterior;
            anterior^.prox:=newValue;
            newValue^.prox:=atual;
            atual^.anterior:=newValue;
          end;
        end
      else //insere no inicio ou quando a lista esta vazia
      begin
        lista^.anterior:=newValue;
        newValue^.prox:=lista;
        lista:=newValue;
      end;
    end;
end;



procedure inicializarListaString(var lista: tListaPonteiro);
begin
  lista:=NIL;
end;

end.