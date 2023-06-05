program index_ponteiro;
uses crt, 
lista_string, 
lista_ponteiro,
views;

var lista, listaFim:tListaTimes;
    op, posi,posi_remove, qtd:integer;
    valor:tipoInf;
    elem:string;


begin
    inicializarListaPonteiro(lista);
    clrscr;
    op:=0;
    writeln('--------------------Bem vindo a lista ------------------');
    while(op<>6) do
    begin

        viewMenu();
        readln(op);
        case op of
            1:begin
                viewInsert();
                readln(elem);
                valor.nome:=elem;
                inicializarListaPonteiroTipoInf(valor);
                inserirNaListaPonteiro(valor,lista, listaFim, qtd);
            end;
            2:begin
                viewRemove();
                readln(posi);
                removerDaListaPonteiroPorPosicao(posi,lista, listaFim, qtd);
            end;
            3:escreverListaPonteiro(lista, listaFim, qtd, false);
            4:escreverListaPonteiro(lista, listaFim, qtd, true);
            5://escreverListaPonteirotst(listaFim)
        end;
        clrscr;
    end;
end.