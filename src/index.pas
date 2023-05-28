program index;
uses crt, lista_string;

var lista, listaFim:tListaPonteiro;
    op, posi, qtd:integer;
    valor:tipoInf;


begin
    inicializarListaString(lista);
    writeln('--------------------Bem vindo a lista ------------------');
    while(op<>6) do
    begin
        writeln('1 - Inserir');
        writeln('2 - Remover');
        writeln('3 - Imprimir');
        writeln('4 - Imprimir');
        writeln('5 - Alterar');
        writeln('6 - Sair');

        readln(op);
        case op of
            1:begin
                writeln('Digite o elemento a ser inserido');
                readln(valor);
                inserirNaListaString(valor,lista, listaFim, qtd);
            end;
            2:begin
                writeln('Digite a posicao a ser removida');
                readln(posi);
                removerDaListaStringPorPosicao(posi,lista, listaFim, qtd);
            end;
            3:escreverListaString(lista, listaFim, qtd, false);
            4:escreverListaString(lista, listaFim, qtd, true);
            5:escreverListaStringtst(listaFim)
        end;
        clrscr;
    end;
end.