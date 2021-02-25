# aplicacion de gastos sencilla



## idea
yo soy freddy huaylla y necesito alguna aplicacion para almacenar gastos futuros y actuales que deseo hacer para mi mismo.

quiero tener un listado de "elementos" que deseo comprar y puedan verse facilmente y editarse 
todos deben un nivel de prioridad para concentrarme en comprar lo que si es importante

quiero que se almacenen gastos o deseos a futuro estableciendole un precio


quieor que mi aplicacion de gastos calcule cuanto e gastado o gastare en el mes automaticamente.


quiero que mi aplicacion de gastos permita crear categorias para mis gastos.


quiero que sea un PWA que pueda usar sin internet pero al tener internet se suban sus datos a la nube.



## algunos requerimientos
[x]Listado de gastos [crud]
[x]Gastos del presente , futuro , pasados.    


[x]Listado de gastos [nivel de prioridades = proridad+fecha de creacion][fecha]

[x]Listado de gastos [calculo total] [calculo mensual x canculo anual]
[x]Listado de gastos [emial a fin de mes con mis gastos]

[]Listado de gastos permite crear categorias extras


## obteniendo entidades

"notas" tienen una "categoria"
"notas" podrian tener una "prioridad" y toda "prioridad" tiene un "nivel"
"notas" perteneceran a algun "usuario"
"una nota" pueden estar en varias "fechas" y la "fecha" podria tener varias "notas"
"nota" tendran algun "formato" de pago como subscripcion o pago unico

## requeriminetos funcionales del sistema ,segun mis entidades

usuario puede crear nota con su categoria obligatoria x
las notas del usuario tendra especificada su tipo de prioridad
usuario o sistema asignara la fecha relacionada a la nota
el sistema preguntara si la nota necesita ser duplicara en caso de que su formato sea subscripcion
el usuario podra ver todas sus notas
las notas se filtran por gastos 'Proximos'
las notas se filtran por gastos 'Pasados'
las notas calcula el monto final de las notas por anio o por mes.
a fin de mes se manda al correo un resumen de las notas del mes terminado.
al usuario se le permite crear nuevas categorias.




























