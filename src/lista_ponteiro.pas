unit lista_ponteiro;

interface
uses crt, lista_string, views;
type tipoInf = record
    nome:string;
    acessos_rebaixamentos:tlista_string;
    titulos:tlista_string;
end;
     
type tListaTimes = ^l;
l = record
    anterior:tListaTimes;
    dado:tipoInf;
    prox:tListaTimes;
end;

procedure escreverListaPonteiro(lista: tListaTimes; var qtd: integer; initFim: boolean);
procedure removerDaListaPonteiroPorPosicao(posicao: integer; var lista, listaFim: tListaTimes; var qtd: integer);
procedure inserirNaListaPonteiro(valor: tipoInf; var lista, listaFim: tListaTimes; var qtd: integer);
procedure inicializarListaPonteiro(var lista: tListaTimes);
procedure inicializarListaPonteiroTipoInf(var dado: tipoInf);
procedure alterarDadosListaPonteiro(var lista, listaFim: tListaTimes; var qtd: integer);
procedure atualizaUltimoElementoListaPonteiro(var listaFim: tListaTimes);
function retornarListaPonteiroPorPosicao(posicao: integer; lista: tListaTimes): tListaTimes;

implementation
//Procedimentos
procedure escreverListaPonteiro(lista: tListaTimes; var qtd: integer; initFim: boolean);
var aux:tListaTimes;
    posi:integer;
begin
    if (lista=NIL) then
        writeln('Lista vazia')
    else
    begin
      aux:=lista;
      if initFim then
        posi:=qtd
      else
        posi:=1;
        while (aux<>NIL) do
        begin 
            writeln(posi ,' - ',aux^.dado.nome);
            if initFim then
            begin
              aux:=aux^.anterior;
              posi:=posi-1;
            end
            else
            begin
              aux:=aux^.prox;
              posi:=posi+1;
            end; 
        end;
    end;
    readkey;
end;

procedure removerDaListaPonteiroPorPosicao(posicao: integer; var lista, listaFim: tListaTimes; var qtd: integer);
var aux, anterior:tListaTimes;
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
                lista:=aux^.prox
            else
            begin
                anterior^.prox:=aux^.prox;
                if (aux^.prox<>NIL) then
                begin
                    aux^.prox^.anterior:=anterior;
                end;
            end;
            if (aux^.prox = nil) then
                listaFim:=anterior
            else
            begin
                if (anterior^.prox^.prox=nil) then
                begin
                    listaFim:=anterior^.prox;
                end;
            end;
            dispose(aux);
            qtd:=qtd-1;
        end;
    end;
end;  

{Insere na lista de forma ordenada, considerando que ou será inserido no inicio ou depois de um elemento}
procedure inserirNaListaPonteiro(valor: tipoInf; var lista, listaFim: tListaTimes; var qtd: integer);
var atual, anterior, newValue: tListaTimes;
    bExiste: boolean;
begin
  new(newValue);
  if (newValue=NIL) then
      writeln('Memoria cheia')
  else 
  begin
      inicializarListaPonteiro(newValue^.anterior);
      newValue^.dado:=valor;
      inicializarListaPonteiro(newValue^.prox);
      if NOT(lista=NIL) and NOT (lista^.dado.nome > newValue^.dado.nome) then
      begin
        atual:=lista;
        while (atual<>NIL) and (atual^.dado.nome <= newValue^.dado.nome) and not(bExiste) do
        begin
          if (atual^.dado.nome = newValue^.dado.nome) then
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
      if not(bExiste) and (newValue^.prox=NIL) then
        listaFim:=newValue;
        
      if not(bExiste) then
        qtd:=qtd+1;
    end;
end;



procedure inicializarListaPonteiro(var lista: tListaTimes);
begin
  lista:=NIL;
end;

procedure inicializarListaPonteiroTipoInf(var dado: tipoInf);
begin
  inicializaListaString(dado.acessos_rebaixamentos);
  inicializaListaString(dado.titulos);
end;

procedure atualizaUltimoElementoListaPonteiro(var listaFim: tListaTimes);
begin
  if not(listaFim=NIL) then
    listaFim:=listaFim^.anterior;
end;

function retornarListaPonteiroPorPosicao(posicao: integer; lista: tListaTimes): tListaTimes;
var aux:tListaTimes;
    i:integer;
begin
    if (lista=NIL) then
        writeln('Lista vazia')
    else
    begin
        aux:=lista;
        i:=1;
        while (aux<>NIL) and (i<posicao) do
        begin
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
            retornarListaPonteiroPorPosicao:=aux;
        end;
    end;
end;


procedure alterarDadosListaPonteiro(var lista, listaFim: tListaTimes; var qtd: integer);
var op, timePosi:integer;
    lista_aux: tListaTimes;
begin
  escreverListaPonteiro(lista, qtd, false);
  if(lista <> nil) then
  begin
    while(timePosi > qtd) or (timePosi < 1) do
    begin
      viewUpdate();
      readln(timePosi);
      if (timePosi > qtd) or (timePosi < 1) then
      begin
        writeln('Posicao invalida');
        readkey;
      end;
      lista_aux:=retornarListaPonteiroPorPosicao(timePosi, lista);
    end;
    while (op <> 4) do
    begin
      viewMenuTime(lista_aux^.dado.nome);
      readln(op);
      case op of
        1: alterarDadosListaString(lista_aux^.dado.titulos);
        2: alterarDadosListaString(lista_aux^.dado.acessos_rebaixamentos);
        3: begin
          writeln('----------------------titulos--------------------------');
          escreve_lista(lista_aux^.dado.titulos);
          writeln('----------------acessos/rebaixamentos------------------');
          escreve_lista(lista_aux^.dado.acessos_rebaixamentos);
          readkey;
        end;
        end;
        clrscr();
      end;
      if (lista_aux^.anterior = nil) then
        lista:=lista_aux
      else if(lista_aux^.prox = nil) then
        listaFim:=lista_aux;
      lista_aux:=nil;
    end;
end;

end.