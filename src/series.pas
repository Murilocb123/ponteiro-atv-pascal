unit series;
interface
uses crt, lista_ponteiro;
type 
tSerie = record
         nome:string;
         lista:tListaTimes;
         listaFim:tListaTimes;
         qtd:integer;
        end;

type serieArray = array[1..2] of tSerie;  

procedure initSerie(var series:serieArray);

implementation

procedure initSerie(var series:serieArray);
var serieA, serieB: tSerie;
begin
    inicializarListaPonteiro(serieA.lista);
    inicializarListaPonteiro(serieA.listaFim);
    inicializarListaPonteiro(serieB.lista);
    inicializarListaPonteiro(serieB.listaFim);
    serieA.qtd:=0;
    serieB.qtd:=0;
    serieA.nome:='A';
    serieB.nome:='B';
    series[1]:=serieA;
    series[2]:=serieB;
end;


end.