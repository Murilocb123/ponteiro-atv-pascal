unit views;
interface

procedure viewSerieTimes();
procedure viewMenu(value: string);
procedure viewInsert();
procedure viewRemove();
procedure viewMenuTime(value: string);
procedure viewMenuTimeDados();
procedure viewUpdate();

implementation

procedure viewSerieTimes();
begin
        writeln('-------------------------');
        writeln('  Escolha uma opcao: ');
        writeln('    1 - Serie A');
        writeln('    2 - Serie B');
        writeln('    3 - Sair');
        writeln('-------------------------');
end;
procedure viewMenu(value: string);
begin
        writeln('----------Serie ',value,'----------');
        writeln('  Escolha uma opcao: ');
        writeln('    1 - Inserir');
        writeln('    2 - Remover');
        writeln('    3 - Imprimir');
        writeln('    4 - Imprimir de tras pra frente');
        writeln('    5 - Alterar');
        writeln('    6 - voltar');
        writeln('-------------------------');
end;

procedure viewMenuTimeDados();
begin
        writeln('-------------------------');
        writeln('  Escolha uma opcao: ');
        writeln('    1 - Inserir');
        writeln('    2 - Remover');
        writeln('    3 - Imprimir');
        writeln('    4 - Voltar');
        writeln('-------------------------');
end;
procedure viewMenuTime(value:string);
begin
        writeln('----------',value,'----------');
        writeln('  Escolha uma opcao: ');
        writeln('    1 - Alterar titulos');
        writeln('    2 - Alterar acessos ou rebaixamentos');
        writeln('    3 - Imprimir');
        writeln('    4 - Voltar');
        writeln('-------------------------');
end;


procedure viewInsert();
begin
    writeln('--------------------------------');
    writeln('Digite o elemento a ser inserido');
    writeln('--------------------------------');
end;


procedure viewRemove();
begin
    writeln('--------------------------------');
    writeln('Digite o elemento a ser removido');
    writeln('--------------------------------');
end;


procedure viewUpdate();
begin
    writeln('--------------------------------');
    writeln('Digite o elemento a ser alterado');
    writeln('--------------------------------');
end;

end.
