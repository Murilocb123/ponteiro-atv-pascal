program index_ponteiro;
uses crt, 
lista_string, 
lista_ponteiro,
series,
views;

      

var series:serieArray;
    serie:tSerie;
    op, op2, posi,posi_remove, qtd:integer;
    valor:tipoInf;
    elem:string; 


begin
    initSerie(series);
    clrscr;
    writeln('--------------------Bem vindo a lista ------------------');
    while(op2<>3) do
    begin
        op2:=0;
        op:=0;
        viewSerieTimes();
        readln(op2);
        if(op2=1) or (op2=2) then
        begin
            clrscr;
            serie := series[op2];
            while(op<>6) do
            begin
                op:=0;
                viewMenu(serie.nome);
                readln(op);
                writeln('qtd:',serie.qtd);
                case op of
                    1:begin
                        viewInsert();
                        readln(elem);
                        valor.nome:=elem;
                        inicializarListaPonteiroTipoInf(valor);
                        inserirNaListaPonteiro(valor,serie.lista, serie.listaFim, serie.qtd);
                    end;
                    2:begin
                        viewRemove();
                        readln(posi);
                        removerDaListaPonteiroPorPosicao(posi,serie.lista, serie.listaFim, serie.qtd);
                    end;
                    3:escreverListaPonteiro(serie.lista, serie.qtd, false);
                    4:escreverListaPonteiro(serie.listaFim, serie.qtd, true);
                    5:alterarDadosListaPonteiro(serie.lista,serie.listaFim, serie.qtd);
                end;
                series[op2]:=serie;
                clrscr;
            end;
        end;
    end;
end.