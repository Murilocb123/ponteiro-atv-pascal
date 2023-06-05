unit views;
interface

procedure viewMenu();
procedure viewInsert();
procedure viewRemove();

implementation
procedure viewMenu();
begin
        writeln('-------------------------');
        writeln('  Escolha uma opcao: ');
        writeln('    1 - Inserir');
        writeln('    2 - Remover');
        writeln('    3 - Imprimir');
        writeln('    4 - Imprimir de tras pra frente');
        writeln('    5 - Alterar');
        writeln('    6 - Sair');
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

end.
