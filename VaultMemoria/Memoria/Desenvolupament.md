%%_Cos del treball_: inclourà els resultats de la investigació o treball, així com l'anàlisi i la discussió d'aquests. %%

# Desenvolupament

## Disseny

El disseny del projecte s'arreplega en els documents situats en l'annex: [One-Sheet](One-Sheet), [Ten-Pager](Ten-Pager) i [GDD](GDD).

## Projecte

### Changelog

%% TODO : vore si fer-ho amb títols o a mode taula %%

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

- Pantalles **home**, **game**, **settings**.
- Sistema de piano amb notes que cauen.
- Millores i estadístiques personalitzables que es poden comprar.
- UI personalitzada.
- Sistema de guardar partida i configuració.
- Sistema d'àudio.
- Internacionalització.

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

![Exportació del projecte de Godot a Android i iOS respectivament](Memoria/Assets/Pianissimo/It1/Pianissimo-It1.png){height=6cm}

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

Aquesta iteració comprén des del 5 al 14 d'agost de 2026.
Aquesta iteració s'ha centrat a aconseguir una versió del joc bàsica, tipus *gray box*. De fer-ho així ha permés programar totes les mecàniques i sistemes que ha de tindre el joc i després facilita iterar per a millorar l'aspecte del joc i generar contingut.

#### Diagrames i mockups

Abans de començar a picar codi es va intentar agrupar a forma d'esquema alguns esbossos i arquitectura del que seria el joc:

%%TODO : explicar i passat a net%%

![[Diagrama_Singleton_Paper.jpg]]

![[Diagrama_SistemesGame_It2_Paper.jpg]]

![[Pianissimo_MockupUI_paper.jpg]]

![[Pianissimo_MockupUI_paper2.jpg]]

#### Projecte Godot

Després de pensar quin aspecte tindria el joc i quins sistemes hauria de tindre, es va començar amb la creació de les escenes **home** i **game**.

Per a mantindre-ho simple *home* només tindria botons que es portaren a les parts de l'aplicació necessàries i *game* tota la lògica del joc *idle*.

Entre els botons de *home* es troben:

- **Idle**: porta a *game*.
- **Focus**: portarà al mode Assaig. S'ha quedat en aquest nom temporal, però segurament canvie a assaig per a mantenir l'estètica musical.
- **Configuració**: porta a *settings*.
- **Assoliments**: portarà als assoliments, segons si és per a iOS o Android canviarà segons es connecte amb la tenda d'aplicacions.

A *game* trobem el piano, les millores i estadístiques, el camp de notes i el marcador de notes junt els botons d'anar a *home* o *settings*. Per a veure el detall de com s'ha implementat es pot consultar el [GDD](GDD) a l'annex.

En eixe moment es va decidir una estructura de carpetes inicial, on es podia veure *scenes*, *assets*, *scripts*, *ui* i *autoloads*. Després es mostrarà l'estat final de les carpetes en aquesta iteració, ja que segons les necessitats del moment es van anar creant més.

![Estructra de carpetes final de la iteració 2](Memoria/Assets/Pianissimo/It2/Pianissimo-folders-It2.png){height=5cm}

Continuant amb la implementació, una vegada estaven les escenes, alguns elements de la interfície (botons, etiquetes...) es va preparar la **[internacionalització](#gdd-internacionalitzacio)**, perquè era una tasca senzilla i es podria provar el seu funcionament amb el poc text que es tenia de moment.

Ja clavant-nos en el desenvolupament com a tal, les mecàniques bàsiques inicials que volia aconseguir eren:

- Un teclat (servia en poques notes) que en polsar sonara una nota
- Un sistema que generara notes a l'estil *Magik Piano* que en polsar-les quan estiguen a prop del teclat es guanyen punts, **notes**.
- Un sistema econòmic per intercanviar notes per millores del tipus:
	- **Millores** que permetera guanyar més notes. Cada millora tindria un cost de notes associat. De moment s'havia pensat en una de fer *tap automàticament* (i així tenir la mecànica *idle*) i una de *multiplicador* de notes per nota ben polsada.
	- **Estadístiques** del jugador que permetera facilitar l'obtenció de notes. Com les millores, però semànticament diferent. De les planejades en el [Ten-Pager](Ten-Pager), primer s'implementarien la del teclat, velocitat i precisió.
- Persistència de les dades en tancar i obrir el joc així com continuar guanyant notes quan no s'està en l'aplicació i continuar la mecànica *idle*.

Per a fer-ho, no es va elegir la manera més intel·ligent i calculada de programar, sinó que es va tirar per la força bruta per a veure si es podia i quedava bé el prototip, abans de perdre el temps dissenyant i implementant sistemes que potser no resultaren viables.

El codi resultant era espagueti, no respectava cap principi ACID era insostenible a llarg termini. Game tenia el fitxer de codi de tot i ja es pot intuir com devia ser de llarg. El seu propòsit va servir per a determinar que efectivament la idea era viable, atractiva inclús. De refactoritzar el codi correctament es podria deixar una base sòlida on anar afegint noves millores i estadístiques per fer de la part *idle* duradora.

![Captures de pantalla de la primer aversió del joc](Memoria/Assets/Pianissimo/It2/Pianissimo_Screenshots1_It2.png){height=6cm}

En aquest punt es contemplava que els **assoliments** haurien de tenir importància per a sincronitzar amb les millores així com ho fa *Cookie Clicker*, per exemple, quan compres una millora per primer cop aconsegueixes un assoliment nou. La dificultat d'implementar el sistema d'assoliments ara és que s'hauria de fer una façana per a delegar segons el SO en l'API de la *store* corresponent. Mentre que Android sí que es dominava millor gràcies a un anterior projecte, iOS era el gran desconegut i per a deixar-ho a mitges o tardar molt a incloure-ho en el prototip de *gray box*, millor deixar-ho per a una següent iteració.

Centrant-nos ara en la refactorització, primer es va plantejar fer uns **managers** que foren *autoloads*, així es diu en Godot als **Singleton**. Aquest patró de disseny per a un joc senzill com el meu és molt convenient per a la majoria dels sistemes, ja que tinc una única economia, un nombre de dades del jugador limitat per a guardar i carregar al llarg de la partida, un sistema d'àudio centralitzat i façanes per a adaptar el joc als diferents SO, com seria per al cas dels assoliments i notificacions.

Els fitxers es van crear buits primer i després es van posar com a *Autoloads*. Es va començar per aquests:

- **SaveManager**: controla el que es guarda/carrega en *PlayerSaveData*.
- **Economy**: controla les notes que s'afigen o es gasten quan es compren o s'obtenen. Depén de *SaveManager*. Actua com una API que controla la quantitat de notes.
- **UpgradeManager**: controla tot allò relacionat amb les millores, de manera que té tots els mètodes per a obtenir dades i comprar millores. Va tot amb el seu ID.

A `game.gd`, que abans era un monòlit, s'ha adaptat per a llevar-li la funcionalitat de guardar que tenia i s'ha traspassat a `SaveManager.save_data`. L'abstracció continua amb les millores, que s'han separat en una escena que actua com a panell i cada *Millora* va tenir el seu propi *HBoxContainer* i més tard una aparença més de *carta*.

Posteriorment, les *Estadístiques* copien l'estructura de les *Millores* i prenen la mateixa forma. Pel moment encara que siguen iguals a nivell de codi, la seua definició conceptual no és la mateixa, és per això que és una decisió de disseny mantenir-les per separat. Encara més, de les *estadístiques* que s'han pogut implementar podrien passar per *Millores*, però les que falten per implementar potser necessiten més especificitat en la seua declaració. Si en un futur no fos així es podria tornar a refactoritzar i afegir algun atribut que determine si és *millora* o *estadística*.

També s'ha refactoritzat l'escena *Note* de manera cada nota és responsable del seu moviment, no ho ha de fer `game.gd` fotograma a fotograma. Si algú necessita totes les notes pot fer `notes_layer.get_children()`

Es va crear l'escena de *settings* amb el seu codi associat. La idea en aquesta iteració és poder controlar el volum de l'àudio i esborrar les dades del jugador (ajudaria també en el testatge de l'aplicació). El botó de *reset* del progrés s'ha implementat amb diàleg de confirmació.

Un nou paradigma de l'evolució del joc va ser que en principi s'havia apostat per una evolució lineal, però en diverses proves es veia l'errada: un munt de notes que no pots ni gastar-te-les totes en *millores*. Va ser aleshores el moment de revisar el funcionament dels *idles*, el seu creixement sol ser exponencial, així que inspirant-nos de nou en el *Cookie Clicker*, es va fer el canvi. Abans el lineal feia `return def.base_cost + get_level(id) * def.cost_growth` en la funció de `get_cost`dels *managers* de *Update* i *Stat*, i el canvi va ser a `return int(round(def.base_cost * pow(def.cost_multiplier, get_level(id))))`.

*Cookie Clicker* té un creixement del 15% a cada compra de *Millores*, nosaltres el farem d'un 12% més cada vegada.

Finalment, la resta de la implementació es va centrar a millorar errades, centralitzar les rutes, millorar l'estil dels botons, i fer que es poguera accedir a les *settings* dins del joc.

##### Àudio

Pel que fa al control d'àudio es va fer un *manager* dedicat al seu control que, per una banda, tenia els efectes de so i per altra la música. En tractar-se d'una primera versió, els sons que s'han inclòs tenien la llicència CC0 i van ser:

- Per a les tecles del piano i clic per a la resta de botons, trets de [Freesound](https://freesound.org).
- Una fuga de Bach perquè sonara de fons treta de [Musopen](https://musopen.org/es/).

En la primera versió el control de l'àudio comptava en uns *HSliders* en la pantalla de *settings* que regulaven el volum i després vaig afegir un *CheckButtons* per a silenciar les pistes individualment. Vaig pensar que està bé deixar-li l'opció a l'usuari en lloc d'haver de baixar els *sliders* al mínim.

##### UI

Per a tenir un control més uniforme i centralitzat de l'aspecte del joc es va crear un tema propi, `main_theme.tres`. També es va respectar les *safe area* del mòbil, perquè no interferira amb els *action button* o el *notch* en cas de tenir i tenir un xicotet marge a l'esquerra i dreta.

Posteriorment, intentant millorar el codi de la *safe àrea*, em vaig adonar que no s'estava mostrant bé els píxels físics enfront dels lògics:

```gd
print("Safe area: ", safe_area, " | viewport: ", viewport_rect.size, "
| bottom margin: ", bottom)
```

Amb aquest *print* vaig veure que no es corresponien, per tant, tots els canvis de píxels no estaven actuant com estava planejat i a més, les proves que estava fent en el telèfon d'haver eixit bé, pot ser en un altre dispositiu en altres mesures hagueren fallat si no me n'adone.

A més es va ajustar el *Display* en les *settings* del projecte, ja que la diferència entre l'emulador de Godot i el telèfon era abismal, amb molta disparitat en les mides.

El resultat de la UI en aquesta fase es pot veure a la figura \ref{fig:screenshots2-it2}.

![Captures de pantalla de la primer aversió del joc \label{fig:screenshots2-it2}](Memoria/Assets/Pianissimo/It2/Pianissimo_Screenshots2_It2.png){height=6cm}

Les *Millores* es va decidir fer-les tipus "carta", l'estil de tot el text horitzontal no aprofitava bé la pantalla, ja que en tenir moltes millores s'hauria de lliscar verticalment en una zona molt estreta.

##### Piano

El piano és la peça central del joc, així que havia de funcionar a la perfecció. Les tecles són botons normals i corrents, i si les poses quan una nota està a prop de la *hit-line* obtindre punts. La *hit-line* no deixa de ser una línia que comprova la distància en l'eix Y per saber com de lluny està la nota que has polsat. Com més a prop, més perfecte, el que vol dir més punts guanyats.

Durant la implementació del piano vaig trobar alguns problemes com:

- Les tecles blanques del piano fallaven perquè el tema se sobreescrivia. La solució va ser fer canvis en el codi per a fer-ho manualment.
- Canvi de posició la *hit-line* per evitar no veure les notes que caien per darrere del teclat: es va passar de baix a dalt, per a millorar la percepció de quan fer *tap* a temps. Com al codi s'usava la posició absoluta no hi havia cap problema.
- Notes que es generaven per damunt de la *topBar*. S'ha arreglat marcant la variable *Clip Contents* en l'inspector de `NotesLayer`.
- Arxiu `piano.gd` massa gran. Refactoritzar va fer la separació de Piano en 3: `piano` sap de la lògica, `piano_keyboard` s'encarrega de la construcció del teclat (diferenciant entre tecles blanques i negres) i `note_field` sap tot el relacionat amb les notes.
- Estadística d'increment de notes al teclat. Una millora atractiva era poder tenir tecles fins a la nota `Si` i tenir una octava completa. Com tenia el recurs `keyboard.tres`, a l'inspector vaig canviar el  `max_level` de `5` a `9` (3 base + 9 nivells = 12 carrils = octava completa), sense necessitat d'afegir codi, s'aprofitava la generació de tecles blanques i negres existent.

Quan es va aconseguir solucionar-ho tot s'hi van afegir algunes funcions per a relacionar la perfecció de les notes tocades amb les estadístiques de velocitat i precisió. Fins que no es detecte altre problema o es necessite una nova funcionalitat, el piano es quedarà com està.

### Iteració 3

Aquesta iteració comprén del 15 al 20 d'agost de 2026.

#### Projecte Godot

Fer Focus mode