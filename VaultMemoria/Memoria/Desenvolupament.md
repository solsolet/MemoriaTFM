%%_Cos del treball_: inclourà els resultats de la investigació o treball, així com l'anàlisi i la discussió d'aquests. %%

# Desenvolupament

## Disseny

El disseny del projecte s'arreplega en els documents situats en l'annex: [One-Sheet](One-Sheet), [Ten-Pager](Ten-Pager) i [GDD](GDD).

## Projecte

### Changelog

%% TODO : vore si dir-ho així o posar un nom adaptat %%
%% TODO : vore si fer-ho amb títols o a mode taula %%
%% TODO : organitzar Mode taula al final %%

#### v0.1.0

- Planificació inicial Gantt Project.
- Investigació Marc Teòric.
- Jugar i analitzar jocs per a l'estat de l'art.
- Memòria redactada inicialment.
- Versió inicial One-Sheet i Ten-Pager.
- Exportador de memòria.
- Projecte Godot creat.
- Prova en Android/iOS físics.
- Exportació Android i iOS configurada.
- Fitxes d'aplicació creades en Play Store i App Store.
- Build muntada en Play Store i App Store.
- Baixada com a testers de l'aplicació en les tendes d'aplicacions.

#### v0.2.0

- Core creat

## Iteracions

### Interacció 0

Es podria considerar l'inici del TFM la primera reunió amb el tutor on es va parlar de quin tipus de videojoc es podria fer, jocs per a jugar i investigar i el motor que usaríem, Godot. 

Després em vaig centrar a aprendre una miqueta de Godot seguint alguns tutorials i llegint documentació. El resultat va ser provar com seria fer un videojoc usant el motor, exportar-lo i poder-lo jugar a més d'una mica de coneixement i familiaritat en l'entorn.

Aquest escalfament es va fer sense tenir encara una idea del joc. No va ser fins a la segona reunió amb el tutor que no es va tindre un idea més concisa: un joc mòbil *idle*, senzill, que explorara alguna característica pròpia dels dispositius mòbils, per exemple les notificacions. Se'm va ocórrer que fora de temàtica musical, ja que tinc afinitat pel tema al ser pianista. *POV: eres un pianista que ha d'assatjar per als seus exàmens* va ser la premissa amb la que ho construiria tot.

El temps d'assaig seria la mecànica *idle*, on pots manualment tocar tecles i de fer-ho bé guanyes puntuació, experiència... com es vulga dir. A poc a poc podries anar guanyant millores que automatitzarien eixe procés per a poder continuar guanyant més.

La idea i el projecte es van quedar de costat durant el curs, ja que sempre li donava prioritat a les pràctiques de les assignatures i li'ls dedicava més temps que res per a fer-les el millor possible.

Una cosa bona del segon quadrimestre és que durant l'assignatura de PODM i Videojocs vaig continuar treballant en Godot, en una en equip i en l'altra en solitari i aquest temps em va servir per continuar familiaritzant-me tant en el motor com en fer 2 jocs mòbils d'aquesta índole.

Després d'un temps usant-lo el trobe còmode d'usar i m'alegre d'haver pres la decisió d'elegir Godot perquè, en el context d'un projecte real on tens una motivació per a desenvolupar-lo, et veus forçat aprendre al ritme que marca el projecte i no tu sense cap restricció.

### Iteració 1

En aquesta iteració s'han fet les preparacions inicials per a tot el que conforma el projecte de Godot com per a la memòria.

#### Planificació

Es va elaborar una planificació amb GanttProject per a tot el projecte, pensada fins a l'entrega en setembre. Es va intentar esbossar, sense filar molt prim encara, algunes fites i tasques que s'haurien de fer, dividides segons una categoria i amb algunes normes temporals.

![Planificació inicial Iteració 1 \label{fig:Plan-iIt1-Inicial}](Memoria/Assets/GanttProject/Plan-It1-Inicial.png)

Durant la realització d'algunes tasques ja he anat experimentant que les he subestimades, fent que una darrere l'altra s'endarrerisquen i la planificació quede obsoleta. El resultat ha sigut que jo em pensava que en poc temps podria tenir moltes coses fetes i definides. Per uns imprevistos o altres no ha sigut així.

%% TODO : Posar imatge de solució GanttProject realista %%

Una altra cosa a tenir en compte és l'ús de Git. S'ha decidit usar **etiquetes** per a ordenar millor el repositori i tenir un control de versions que es puga seguir més fàcilment, de manera que només mirant a quina etiqueta correspon una *build* en una tenda d'aplicacions, sabem quin codi es tenia en aquell moment. Resultarà útil per a controlar les dues tendes. Podem veure les etiquetes en l'apartat de [changelog](#changelog).

He donat per conclosa aquesta primera iteració quan he tingut les primeres peces d'aquest projecte i memòria per tal de no fer-la més llarga i així passar a un nou començament amb les idees més clares per a la següent.

#### Exportador de memòria

Pel que fa a la memòria, com s'ha explicat en la metodologia, en Obsidian s'han usat diferents extensions i ferramentes per a facilitar la recopilació de bibliografia i exportació de la memòria en un format PDF, però no era suficient, ja que el format no es podia controlar a mesura i calia fer molts canvis manualment.

Donada aquesta problemàtica, vaig optar per fer un sistema d'exportació de la memòria, redactada en Obsidian com a Markdown, que amb un simple `./build.sh` m'exportara la memòria en un format llest per a entregar. Aquest format inclou:

- Estil personalitzat.
- Portada.
- Numeració automàtica de figures i taules.
- Índex i bibliografia actualitzats automàticament.
- Bibliografia sincronitzada amb Zotero.
- Versió de la memòria tipus `.docx` per si de cas.
- Ordre de la memòria segons es tinga establit en el fitxer `manifest.txt`.
- Títols generats automàticament en l'idioma indicat.
- Enllaços funcionals tant externs com interns.

El format es va fer amb una combinació de Python i el contingut de la carpeta `config`, ja que es necessiten alguns fitxers per a poder exportar la memòria correctament a PDF, com l'ordre de les notes d'Obsidian a `manifest.txt`, la portada segons la plantilla, el format APA desitjat, les metadades que controlen manualment algunes variables de Pandoc i la bibliografia que es guarda automàticament de Zotero. 

Van sorgir alguns problemes durant aquesta iteració.
Un va ser que la versió de Pandoc instal·lada era l'actual en el moment d'instal·lació, però durant el desenvolupament va eixir una nova que venia amb moltes més llibreries amb funcions que s'han programat a mà que hagueren fet més senzill el sistema d'exportació.

Un altre va ser que es va subestimar el temps que es tardaria a aconseguir aquest sistema. En principi pensava que amb el connector de *Pandoc* o *Enhancing Export* disponibles a Obsidian serien suficients, però mancaven dels detalls que fan que la memòria siga mantenible en el temps, com l'índex i bibliografia automàtics.

Crec que la inversió de temps ha valgut la pena perquè una vegada s'acabe la redacció de la memòria o vulga anar enviant-li versions al tutor, amb una simple ordre en la terminal ja la tindré llesta per a entregar, sense haver-me de preocupar de res més que del contingut.

#### Projecte Godot

S'ha creat un projecte en la versió de Godot 4.5.1. L'objectiu principal en aquesta iteració havia de ser aconseguir configurar l'exportació del joc tant per a iOS com per a Android, així deixant aquest tema aclarit, no caldrà enfrontar la incertesa quan ja s'haja d'entregar el treball. A més s'ha creat i configurat les fitxes de l'aplicació en les corresponents tendes d'aplicacions.

Es pot veure com aquesta plantilla senzilla s'ha pogut provar en dispositius Android i iOS reals.

![Exportació del projecte de Godot a Android i iOS respectivament](Memoria/Assets/Pianissimo/Pianissimo-It1.png){height=6cm}

En veure que funciona en dispositius reals, s'ha preparat correctament la configuració d'exportació. En el cas d'Android s'ha fet les següents tasques:

- S'ha creat una *keystore* i s'ha afegit les dades necessàries a l'exportador.
- S'ha generat una App Bundle correctament.
- S'ha muntat a la Play Store com una prova interna.
- S'ha activat el Google Play App Signing.

Pel que fa a iOS, Godot no et dona un arxiu que muntar a la tenda d'aplicacions tan fàcilment, sinó que et genera el projecte per a poder compilar-lo amb Xcode.

Em vaig posar en contacte amb Miguel Ángel perquè em fes una fitxa en l'App Store i em convidara en l'equip del compte del màster. Aquesta invitació m'ha atorgat rols d'*App Manager*, que per a fer proves en un dispositiu físic va bé, però per a muntar a la tenda no tenia els permisos necessaris.
Com les proves es poden fer en el dispositiu sense problema, quan necessite muntar una versió li la puc passar a ell perquè la compile i munte sense problema.

Finalment, amb la *build* muntada vaig poder provar l'aplicació amb *TestFlight*.

#### Memòria

S'ha redactat una versió inicial dels apartats d'introducció, justificació i objectius, llegenda, marc teòric, metodologia, objectius i els annexos de *One-Sheet*, *Ten-Pager* i *GDD*. Aquests tres últims s'han intentat abordar d'una manera general per a aquesta fase del projecte i començar a definir els conceptes del videojoc, a mesura que avance el projecte i noves idees i necessitats necessiten ser reflectides, s'aniran afegint i corregint.

Del material usat per al treball s'ha anat guardant en Zotero de manera que en citar una font aparega automàticament en la bibliografia.

L'ús del connector d'Obsidian *TODOseq* ha sigut d'ajuda en aquesta fase per a marcar i recopilar en una vista de llista totes les anotacions i recordatoris sobre el text necessaris.

#### Investigació

De la mà de la memòria la investigació ha sigut un eix central d'aquesta iteració. S'ha consultat diferents informes, pàgines web, revistes i articles per a fer el marc teòric.

Pel que fa a l'estat de l'art una part més agraïda ha sigut haver de jugar a molts jocs per a poder analitzar-los. Mai havia jugat a jocs incrementals per tant de temps i els he trobat molt entretinguts i m'he enganxat una mica. He caigut en totes les tècniques que he d'aconseguir replicar per al meu.

Un inconvenient que em vaig trobar va ser a principi de juliol per a accedir a certs portals d'articles amb les credencials de la UA perquè se'm va caducar la contrasenya durant la caiguda dels servidors d'UACloud i durant aquells dies no vaig consultar fonts per eixa via sinó per altres.

No només s'ha investigat per a aquest apartat de la memòria, també s'ha hagut de fer recerca per al desenvolupament en Godot.

### Iteració 2

#### Diagrames i mockups

TODO : Posar bé

Botó reset del progrés amb dialeg de confirmació. Es crear un nou Savenoseque i giardarlo pel que tenim. com a tal nmo borra només guardes un buit.

Canvi del creixement del cost de les millores i estadístiques. Abans era lineal amb `return def.base_cost + get_level(id) * def.cost_growth` en la funció de `get_cost`dels managers de Update i Stat i ara és `return int(round(def.base_cost * pow(def.cost_multiplier, get_level(id))))`.

Aquest canvi s'aproxima més a com fa *idle* el cookie clicker, que el seu creisement es de 1.15 i nosaltres el farem de 1.12, el podrem anar variant. Aquest creixement vol dir que cada nova compra costa un 12% més cada vegada.

Afegir botons de mute yass

TODO : millorar margin d'esquerra a dreta que ix tot molt ample

Tecles blanques piano fallen perquè el tema se sobreescriu. Canvis en el codi per a fer-ho a mà. S'ha canviat de posició la hitline en lloc de bai a dalt, perquè si l'altura de la tecla pot canviar les notes si passen per darrere del teclat perdem la percepció de quan fer tap a temps. Com en el codi s'usa la posició absoluta no hi ha cap problema. De fet tambe quan encertes la nota s'allibera. S'ha arreglat amb checkar Clipiing en l'inspector de `NotesLayer` de `piano.tscn`.

Separació de Piano en 3: piano sap de la lògica, piano_keyboard s'encarrega de la construcció del teclat i note_fiel sap tot lo de les notes.

Upgrades tipo card sí

Stats en procés, piano convertible fet!

Millorar bugs, centrlaitzar path, botons en estil, settigns entrables dins del joc.

Millorar diferencia safe area, no esta mostrantse correctmaent per que els pixels físics no corresponene en en els lógics:
I ara també per a saber com funciona el piano:

lol

Refactorització per a previndre que el prototip grayboxed tinga tota la logica en game, per a provar pot estar bé, pero comença a ser inentendible.

Introducció de singletons per als managers que ho necessiten. Es creen buits. Es posen com a Autoload.

- SaveManager: controla el que es guarda/carrega en PlayerSaveData.
- Economy: controla les notes que s'afigen o es gasten quan es compren o s'obtenen. Depén de SaveManager. Actua com una API que controla la quantitat de notes.
- UpgradeManager: controla tot lo relacionat amb les upgrades, de manera que té tots els mètodes per a obtindre dades i comprar upgrades. Va tot amb el seu ID.

Les dependències fan que l'ordre dels Autoloads importe, si no donaria un error.
`game.gd` se li ha llevat tot lo de guardar que tenia i ara es cridra a `SaveManager.save_data` de moment.

Més abstracció per a les Upgrades, s'ha separat tot el que hi havia l'escena de Game per una panell per a les Upgrades que es una escena de per si i cada Upgrade té el seu propi HBoxContainer.

DONE : passar les millores d'horitzontal a vertical i parametritzar posar icona
TODO : internacionalitzar cadenes de text dels botos i millores

Millorar escen Note de manera cada nota es resposnable del seu moviment, no ho ha de fer game frame a frame. Si algu necessita totes les notes pot fer `notes_layer.get_children()`

Credits audio de prova:
- C4: https://freesound.org/s/794435/
- C#4: https://freesound.org/s/794434/
- D4: https://freesound.org/s/794458/
- Pack: https://freesound.org/p/43099/
- click1: https://freesound.org/s/751232/
- click2: https://freesound.org/s/250552/
- pop: https://freesound.org/s/665183/
- ding: https://freesound.org/s/204648/
- bach: https://musopen.org/music/43466-the-well-tempered-clavier-book-i-bwv-846-869/

