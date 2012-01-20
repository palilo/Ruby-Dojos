Fonte: http://dojopuzzles.com/problemas/exibe/nuvem-de-cinzas/

Um vulc�o acaba de entrar em erup��o, provocando uma nuvem de cinzas que se alastra impedindo a circula��o a�rea. O governo est� muito preocupado e deseja saber quando que a nuvem de cinzas ir� atingir todos os aeroportos do pa�s.
Est� dispon�vel um mapa detalhando a situa��o atual. O mapa � retangular, dividido em pequenos quadrados. Neste mapa existem tr�s tipos de quadrados: nuvem (indicando que esta regi�o do mapa j� est� coberto por nuvens), aeroportos (indicando a localiza��o de um aeroporto) e todas as outras (indicando locais onde a nuvem ainda n�o chegou).
A cada dia, a nuvem expande-se um quadrado na horizontal e um quadrado na vertical. Ou seja, ao fim de cada dia, todos os quadrados adjacentes (vertical ou horizontalmente) a uma nuvem, tamb�m passam a conter nuvens. Por exemplo:
. . * . . . * *      . * * * . * * *     * * * * * * * *
. * * . . . . .      * * * * . . * *     * * * * * * * *
* * * . A . . A      * * * * A . . A     * * * * * . * *
. * . . . . . .  ->  * * * . . . . .  -> * * * * . . . .
. * . . . . A .      * * * . . . A .     * * * * . . A .
. . . A . . . .      . * . A . . . .     * * * A . . . .
. . . . . . . .      . . . . . . . .     . * . . . . . .
     Dia 1                Dia 2               Dia 3
Para preparar os planos de conting�ncia, o governo necessita saber: quantos dias demorar� para ao menos um aeroporto ficar coberto pelas nuvens e daqui quantos dias todos os aeroportos estar�o cobertos pelas nuvens.
Dados um quadriculado com L linhas e C colunas, al�m da indica��o inicial das nuvens e dos aeroportos, desenvolva uma programa que informe o n�mero de dias at� um primeiro aeroporto ficar debaixo da nuvem de cinzas e o n�mero de dias at� que todos os aeroportos ficarem cobertos pelas cinzas.