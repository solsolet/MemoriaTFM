%%_Cos del treball_: inclourà els resultats de la investigació o treball, així com l'anàlisi i la discussió d'aquests. %%

# Desenvolupament

## Disseny

El disseny del projecte s'arreplega en els documents situats en l'annex: [One-Sheet](#one-sheet), [Ten-Pager](#ten-pager) i [GDD](#gdd).

## Projecte

### Changelog

#### v0.1.0 – juny/juliol 2026

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

#### v0.2.0 – 5/14 agost 2026

- Pantalles **home**, **game**, **settings**.
- Sistema de piano amb notes que cauen.
- Millores i estadístiques personalitzables que es poden comprar.
- UI personalitzada.
- Sistema de guardar partida i configuració.
- Sistema d'àudio.
- Internacionalització.

#### v0.3.0 – 15/17 agost 2026

- Pantalles mode **focus** (configuració, historial, sessió i resultat d'assajos) i **àlbum** de cartes.
- Sistema d'assajos.
- Recompensa de guanyar cartes i desbloquejar-les en l'àlbum per assaig completat.
- Solució error `can_process`.

#### v0.4.0 – 18/21 agost 2026

- Implementació dels connectors específics de cada botiga d'aplicacions al projecte de Godot.
- Investigació de les especificacions dels connectors `godot-play-services` i `gamecenter` de Godot.
- Façana comuna i *back-end* específic per a assoliments tant d'Android com d'iOS.
- Implementació d'assoliments en la Play Store i App Store.
- Implementació dels assoliments com a recurs en el projecte de Godot.
- Autenticació de l'usuari a Play Game Services i en Game Center.
- Visualització de la UI d'assoliments de cada SO amb `show_achivements_ui`.
- Proves en dispositius de cada SO per a validar que es poden desbloquejar assoliments.
- Muntada del joc a les tendes d'aplicacions per a poder descarregar-lo.

#### v0.5.0 – 22/27 agost 2026

- Afegir sons per a les tecles bé.
- Noves funcionalitats del mode assaig:
	- Botó de cancel·lar sessió.
	- Tags.
	- Total setmanal i diari en `journal`.
	- Música disponible en `focus_session`.
	- Poder esborrar entrades en `journal`.
	- Assajos permissius: no hi ha penalització per abandonar l'aplicació mentre estiga viva.
- Canvis a la UI:
	- `home` tipus piano.
	- Fons personalitzat amb escalat adequat per a tota mena de pantalles.
	- Botons personalitzats amb variacions per a les tecles blanques i negres i botó de cancel·lació. Alguns disposen d'icones.
	- Notes personalitzades.
	- Cartes ara de color lila.
	- Camps de focus personalitzats i entrades de les sessions amb tema personalitzat.
	- Game, nova *good-perfect* àrea visual per a saber on polsar quan la nota s'apropa al teclat.
- Nous assoliments: *velocity_maxed*, *precision_maxed*, *technique_maxed*, *keyboard_maxed*, *all_stats_maxed*, *first_strict_session*, *session_10min*, *hour_in_a_day*, *ten_hours_in_a_week*, *focus_streak_3*, *focus_streak_10*, *hundred_sessions*, *ten_cards*, *all_cards*.
- 3 noves millores: `metronome`, `note_torrent`, `golden_notes`.
- Correccions de les traduccions del text posat directament al codi amb `tr()`.
- *Toast* de benvinguda quan s'entra a `game`, informa de les notes guanyades.
- Sistema per a mostrar tutorials.

#### v0.6.0 – 28/31 agost 2026

- Icona de l'aplicació corregida perquè es veja bé en Android.
- Incorporació del connector de Notificacions.
- Notificacions funcionals en iOS i Android.
- S'ha afegit a `settings` ajustos per a controlar el temps que tarden les notificacions.
- Afegir so de "clic" per a tots els botons.
- Afegir *pop-up* de numerets quan s'encerta una nota per a donar retroalimentació visual.
- Detall de les Estadístiques per a saber com funcionen.
- Muntar els preus i el cost per a fer la progressió més lenta.
- Arreglar *scroll* en Millores.
- Correccions dels botons de tutorial.

#### v0.7.0 – 1/15 de setembre 2026

- Acabar la redacció dels següents apartats de la memòria: iteracions pendents, resums, metodologia, marc teòric i GDD.
- Correcció d'alguns títols perquè es puguen navegar a l'índex.
- Ajust de volums dels àudios del joc.
- Noves millores i assoliments.
- Afegir pantalla de crèdits.
- Compartir el joc per a fer proves amb usuaris i rebre retroalimentació.
- Acabar dibuixos historieta inicial en `home`.
- Fer logo per a `home`.
- Nova pantalla *Perfil* per a mostrar totes les estadístiques de l'usuari.

## Iteracions

### Interacció 0

Es podria considerar l'inici del TFM la primera reunió amb el tutor on es va parlar de quin tipus de videojoc es podria fer, jocs per a jugar i investigar i el motor que usaríem, Godot. Va ocòrrer a principi d'any.

Després em vaig centrar a aprendre una miqueta de Godot seguint alguns tutorials i llegint documentació. El resultat va ser provar com seria fer un videojoc usant el motor, exportar-lo i poder-lo jugar a més d'una mica de coneixement i familiaritat en l'entorn.

Aquest escalfament es va fer sense tenir encara una idea del joc. No va ser fins a la segona reunió amb el tutor que no es va tindre un idea més concisa: un joc mòbil *idle*, senzill, que explorara alguna característica pròpia dels dispositius mòbils, per exemple les notificacions. Se'm va ocórrer que fora de temàtica musical, ja que tinc afinitat pel tema al ser pianista. *POV: eres un pianista que ha d'assatjar per als seus exàmens* va ser la premissa amb la que ho construiria tot.

El temps d'assaig seria la mecànica *idle*, on pots manualment tocar tecles i de fer-ho bé guanyes puntuació, experiència... com es vulga dir. A poc a poc podries anar guanyant millores que automatitzarien eixe procés per a poder continuar guanyant més.

La idea i el projecte es van quedar de costat durant el curs, ja que sempre li donava prioritat a les pràctiques de les assignatures i li'ls dedicava més temps que res per a fer-les el millor possible.

Una cosa bona del segon quadrimestre és que durant l'assignatura de PODM i Videojocs vaig continuar treballant en Godot, en una en equip i en l'altra en solitari i aquest temps em va servir per continuar familiaritzant-me tant en el motor com en fer 2 jocs mòbils d'aquesta índole.

Després d'un temps usant-lo el trobe còmode i m'alegre d'haver pres la decisió d'elegir Godot perquè, en el context d'un projecte real on tens una motivació per a desenvolupar-lo, et veus forçat aprendre al ritme que marca el projecte i no tu sense cap restricció.

### Iteració 1

En aquesta iteració s'han fet les preparacions inicials per a tot el que conforma el projecte de Godot com per a la memòria. Va començar a mitjan juny de 2026, just en acabar les entregues de la resta d'assignatures del màster.

#### Planificació

Es va elaborar una planificació amb GanttProject per a tot el projecte, pensada fins a l'entrega en setembre. Es va intentar esbossar, sense filar molt prim encara, algunes fites i tasques que s'haurien de fer, dividides segons una categoria i amb algunes normes temporals.

![Planificació inicial Iteració 1 \label{fig:Plan-iIt1-Inicial}](Memoria/Assets/GanttProject/Plan-It1-Inicial.png)

Durant la realització d'algunes tasques ja he anat experimentant que les he subestimades, fent que una darrere l'altra s'endarrerisquen i la planificació quede obsoleta. El resultat ha sigut que jo em pensava que en poc temps podria tenir moltes coses fetes i definides. Per uns imprevistos o altres no ha sigut així.

%% TODO : Posar imatge de solució GanttProject realista %%

Una altra cosa a tenir en compte és l'ús de Git. S'ha decidit usar **etiquetes** per a ordenar millor el repositori i tenir un control de versions que es puga seguir més fàcilment, de manera que només mirant a quina etiqueta correspon una *build* en una botiga d'aplicacions, sabem quin codi es tenia en aquell moment. Resultarà útil per a controlar les dues tendes. Podem veure les etiquetes en l'apartat de [changelog](#changelog).

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

Van sorgir alguns problemes durant aquesta iteració. Un va ser que la versió de Pandoc instal·lada era l'actual en el moment d'instal·lació, però durant el desenvolupament va eixir una nova que venia amb moltes més llibreries amb funcions que s'han programat a mà que hagueren fet més senzill el sistema d'exportació.

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

Pel que fa a iOS, Godot no et dona un arxiu que muntar a la botiga d'aplicacions tan fàcilment, sinó que et genera el projecte per a poder compilar-lo amb Xcode.

Em vaig posar en contacte amb Miguel Ángel Lozano perquè em fes una fitxa en l'App Store i em convidara en l'equip del compte del màster. Aquesta invitació m'ha atorgat rols d'*App Manager*, que per a fer proves en un dispositiu físic va bé, però per a muntar a la botiga no tenia els permisos necessaris.
Com les proves es poden fer en el dispositiu sense problema, quan calga muntar una versió li la puc passar a ell perquè la compile i munte sense problema.

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

![Diagrames inicials en brut. Per ordre de esquerra-dreta dalt-baix: esquema de singletons, idees UI 2-5, idees UI 1, pas de prototip *grayboxed* a v0.2.0](Memoria/Assets/Pianissimo/Diagrames/diagrames_bruts.png)

Pel que fa a la interfície el mode *idle* del joc tenia clar l'estructura d'un piano on les notes cauen i en algun costat tenir les millores. Per a la pantalla inicial hi havia més dubtes, moltes aplicacions tenen una estructura similar l'esborrany 3. En aquesta sol haver-hi una filera de botons per costat que porten a la tenda, a reptes diaris, a ofertes especials, a ruletes o coses d'atzar que donen premis... Personalment, no m'agrada, és molt genèrica i en principi el joc no tindrà tantes coses per a repartir-les en tants apartats.

L'esquema dels *managers* es va fer pensant en els apartats que necessitarien ser Singleton per estar funcionant durant tota l'aplicació o evitar duplicitats. No era molt concret, es plantejava quines necessitats es podria tenir en el projecte i eventualment a mesura que s'anaren implementant s'aniria especificant.

![Diagrama singletons inical](Memoria/Assets/Pianissimo/Diagrames/Diagrama_Singleton.png){height=6cm}

Finalment, l'esquema de l'evolució tractava d'intentar posar ordre de com estava el projecte funcional en el codi mal fet a com podríem anant encaminant-lo. Podem veure un diagrama senzill en les pantalles que teníem clares a la figura \ref{fig:mockup_senzill}.

![Diagrama inicial de navegació \label{fig:mockup_senzill}](Memoria/Assets/Pianissimo/Diagrames/Pianissimo_Mockup1.png){height=6cm}

#### Projecte Godot

Després de pensar quin aspecte tindria el joc i quins sistemes hauria de tindre, es va començar amb la creació de les escenes **home** i **game**.

Per a mantindre-ho simple *home* només tindria botons que es portaren a les parts de l'aplicació necessàries i *game* tota la lògica del joc *idle*.

Entre els botons de *home* es troben:

- **Idle**: porta a *game*.
- **Focus**: portarà al mode Assaig. S'ha quedat en aquest nom temporal, però segurament canvie a assaig per a mantenir l'estètica musical.
- **Configuració**: porta a *settings*.
- **Assoliments**: portarà als assoliments, segons si és per a iOS o Android canviarà segons es connecte amb la botiga d'aplicacions.

A *game* trobem el piano, les millores i estadístiques, el camp de notes i el marcador de notes junt els botons d'anar a *home* o *settings*. Per a veure el detall de com s'ha implementat es pot consultar el [GDD](#gdd) a l'annex.

En eixe moment es va decidir una estructura de carpetes inicial, on es podia veure *scenes*, *assets*, *scripts*, *ui* i *autoloads*. Després es mostrarà l'estat final de les carpetes en aquesta iteració, ja que segons les necessitats del moment es van anar creant més.

![Estructra de carpetes final de la iteració 2](Memoria/Assets/Pianissimo/It2/Pianissimo-folders-It2.png){height=3cm}

Continuant amb la implementació, una vegada estaven les escenes, alguns elements de la interfície (botons, etiquetes...) es va preparar la **[internacionalització](#gdd-internacionalitzacio)**, perquè era una tasca senzilla i es podria provar el seu funcionament amb el poc text que es tenia de moment.

Ja clavant-nos en el desenvolupament com a tal, les mecàniques bàsiques inicials que volia aconseguir eren:

- Un teclat (servia en poques notes) que en polsar sonara una nota.
- Un sistema que generara notes a l'estil *Magik Piano* que en polsar-les quan estiguen a prop del teclat es guanyen punts, **notes**.
- Un sistema econòmic per intercanviar notes per millores del tipus:
	- **Millores** que permetera guanyar més notes. Cada millora tindria un cost de notes associat. De moment s'havia pensat en una de fer *tap automàticament* (i així tenir la mecànica *idle*) i una de *multiplicador* de notes per nota ben polsada.
	- **Estadístiques** del jugador que permetera facilitar l'obtenció de notes. Com les millores, però semànticament diferent. De les planejades en el [Ten-Pager](#ten-pager), primer s'implementarien la del teclat, velocitat i precisió.
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

*Cookie Clicker* té un creixement del 15% a cada compra de *Millores*, nosaltres el farem d'un 12% més cada vegada de moment.

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

#### Investigació

Es va consultar molta documentació per a veure en quin format es podria emmagatzemar les dades de l'usuari. Pel que vaig llegir per al meu cas em convindria un **recurs propi** en el cas de les dades del joc i un **CofigFile** per als ajustos que tinga el jugador en *settings*, a pesar que ene la primera versió *espagueti* vaig usar un JSON.

Els millors tipus de recursos durant el desenvolupament que es poden usar són els `.tres`, ja que són fàcils de llegir, encara que seria interessant en un futur quan tinga els valors de cada recurs tancat, passar-los a `.res`, a binari, per a la distribució a usuaris que són molt més ràpids i xicotets [@GodotImplementingLoad2025]. 

### Iteració 3

Aquesta iteració comprén del 15 al 17 d'agost de 2026. Ha durat menys del previst (5 o 6 dies), ja que ha resultat una implementació senzilla.

El mode *focus*, o millor dit, d'**assaig**, naix de la idea que l'aplicació pot ser un punt d'encontre entre jugadors casuals de la part *idle* i de gent que vulga una aplicació per a fer un seguiment de tasques per temps. Al ser de temàtica musical, els músics poden ser públic objectiu.

Si bé és cert que d'aplicacions de concentració n'hi ha moltes, aquesta vol apostar per combinar el gènere *idle* en unes sessions de *productivitat gamificada* amb una estètica musical. A més té molt de sentit, els jocs *idle* són jocs d'esperar i depenent del tipus, tens una xicoteta part de controlar els recursos al teu abast. Per què no aprofitar l'espera i fer alguna cosa de profit mentrestant i, a canvi, reps una recompensa per la part *idle*?

Aquesta lògica s'ha inspirat en l'aplicació Forest, que es pot consultar al seu corresponent apartat en el [marc teòric](#sec-marc-teoric-forest). Forest fa molt bé donar-li importància a la teua concentració i accions: quan comences una tasca tens un arbre que creix durant el temps que s'ha determinat. En cas d'eixir de l'aplicació, “distreure't”, la planta morirà i hauràs “fracassat”, en canvi, si la compleixes la tindràs al teu jardí.

És molt bona aplicació i realment encara que s'imités al 100% ningú tindria prou raons per apostar pel meu joc en lloc de l'original. Per això necessita la part *idle* per a donar-li sentit i pes, i l'estètica musical pot ser interessant per a músics que vulguen fer seguiment dels seus assajos.

*Pianissimo* podria ser un joc *idle* a seques, però no una aplicació de control de tasques a soles. Sobretot al nivell ximple que tindrà de moment l'apartat d'assajos.

Per a donar-li encara més de pes a la part musical, i que algun músic tinga l'interés d'usar-la per als seus assajos, a més d'una recompensa en la part *idle*, hi haurà unes cartes col·leccionables amb píndoles de curiositats musicals. Es pot aprendre cultura musical metre s'assaja.

Aquest disseny *piano-musical* també escau en el fet que he estudiat música per molts anys, i he tingut el bon costum, a mesura que passaven els cursos i gràcies a la meua mestra, d'anar intentant optimitzar i controlar els meus assajos.

Sempre he hagut de dedicar-li més hores que ningú per a tenir resultats normals i, així i tot, no sempre l'esforç s'ha vist recompensat. Anotar el que assajava, apuntar notes sobre el meu progrés, quines seccions d'una obra em costaven més, què estava fent per a treballar-les... va suposar un punt d'inflexió en la meua destresa com a pianista.

#### Projecte Godot

Primer es van crear les pantalles, començant per la de la configuració de la sessió d'assaig. Per ara, només s'han posat camps bàsics com el títol de la sessió, el temps en minuts de durada i, opcionalment, una descripció de la tasca. En el futur es podrien afegir més camps com etiquetes o el tipus de restricció que volem.

Per a guardar les dades s'afigen com a variables en `player_save_data.gd` i es controlaran amb `focus_manager.gd` que és un *autoload*. El codi compta amb 3 *senyals* per a avisar entre les diferents pantalles si la sessió ha començat quan es completa i si ha fallat. A més té el funcionament de guardar les dades de l'assaig amb `SaveManager`.

Una vegada amb aquesta base feta es van continuar implementant la resta de les pantalles:

- `focus_journal`: mostra els assajos en mode llista, es creen per files.
- `focus_session`: L'assaig en si, veient com passa el comptador i s'emplena el progrés.
- `focus_summary`: El resultat de l'assaig, si s'ha completat a més es posa la recompensa.

Una vegada comprovat que funcionaven es va implementar el sistema de cartes desbloquejables com a recompensa, això va comportar crear:

- Una nova escena per a l'àlbum, `card_album.tscn`.
- L'element carta, `card_tile.tscn` i la seua definició, `card_definition`, per a poder crear recursos tipus "carta", guardats en la carpeta `/data/cards`.
- Un `card_manager` com a *autoload* per a emmagatzemar totes les cartes disponibles.

Per a les cartes s'ha definit que siguen d'un tipus en concret per a donar-li un sentit, en un futur es podria veure quantes cartes de cada tipus es té o organitzar l'àlbum. El detall es troba en l'apartat de [cartes](#gdd-album-cartes) al GDD.

La interfície és molt lletja de moment, només hi ha els elements bàsics sense tocar el tema per defecte pràcticament com es pot veure en la figura \ref{fig:screenshots-it3}. En futures iteracions se li donarà una rentada de cara.

![Mode Assaig en la iteració 3 de Pianissimo \label{fig:screenshots-it3}](Memoria/Assets/Pianissimo/It3/Pianissimo_FocusMode.png){height=6cm}

S'ha quedat una errada surant que aprofitant, ja que la resta ha sigut ràpid d'implementar, s'ha preferit continuar i continuar implementant característiques més rellevants del joc que continuar aprofundint perquè la solució segurament portaria cert temps.

### Iteració 4

Aquesta iteració comprén del 18 al 21 d'agost de 2026. També ha sigut relativament ràpida encara que ha sigut la més costosa i desesperant de realitzar fins al moment.

S'han implementat els assoliments del joc, en aquest moment només uns 6. Per a fer-ho s'ha tingut en compte que s'han d'implementar al joc, crear-los a les tendes d'aplicacions i connectar l'aplicació, segons el SO, a la botiga corresponent perquè es puga sincronitzar i tenir accés a les funcionalitats específiques de cadascuna.

La iteració ha servit per a poder configurar bé el sistema d'assoliments en totes les seues facetes. Com s'ha pogut realitzar correctament, ara afegir-ne de nous és molt senzill i es farà en pròximes iteracions.

#### Projecte Godot

Per la diferència segons el SO, s'ha optat per fer una façana comuna d'assoliments que tinga tots els mètodes necessaris i per baix hi haja una espècie de *back-end* específic tant per a Android com per a iOS. Aquest *back-end* específic fa ús de les funcions pròpies de cada connector que s'ha incorporat al joc: *GoodlePlayServices* i *gamecenter*, cadascun en la seua corresponent carpeta.

![Captures de Pianissimo en un iPhone amb Game Center habilitat en iOS](Memoria/Assets/Pianissimo/It4/Pianissimo_GameCenter_Config.png){height=6cm}

Per fer la façana es va fer un `achievements_manager.gd` que a pesar que el nom indique assoliments, per a aconseguir-los primer s'ha d'autenticar l'usuari. La façana controlaria totes les funcions necessàries i segons el SO del dispositiu cridaria a la corresponent del connector a través dels fitxers específics `android_backend.gd` i `ios_backend.gd`. En cas de no detectar cap SO (com pot ser per a les proves en l'ordinador), hi ha un `null_backend.gd` per si de cas, que mostraria a la terminal què està al passant al joc amb els assoliments.

Amb Android no vaig tenir molts problemes, ja que en l'assignatura de videojocs, com vaig usar també Godot i el meu projecte era en Android, *Floc*, ja m'havia barallat amb el connector. Es pot veure l'autenticació i els assoliments funcionals a la figura \ref{fig:pianissimo-achievements-backend1}. El que més va costar va ser la configuració en el núvol amb els SHA-1.

Em van resultar molt útils un parell de vídeos de YouTube de *Piledrivegames Studio*, el canal té una [llista de reproducció](https://youtube.com/playlist?list=PLxucBh1Tbzzfz_kId18RgNViYCpAL5KqZ&si=tLrV3lwXmMMnjuSn) dedicada a fer un joc Android amb Godot. Em vaig fixar només als 3 que té d'habilitar els *Google Play Services* i com fer el *sign-in* i posar assoliments. A més, el que vaig trobar molt útil és que eren relativament recents, els havia muntat a principi d'any, per tant, si fa i no fa les interfícies eren quasi clavades i eren molt fàcils de seguir.

![Captures de Pianissimo en un Android amb els Google Play Services habilitats \label{fig:pianissimo-achievements-backend1}](Memoria/Assets/Pianissimo/It4/Pianissimo_GPS_Config.png){height=6cm}

De fet, per al codi específic del *back-end* en Android vaig consultar el que vaig fer per a *Floc* i el vaig adaptar a l'estructura de Pianissimo refactoritzant-lo.

En el cas d'iOS vaig tenir uns quants problemes com es relatarà a continuació. Una vegada superats, vaig adaptar el codi d'Android a les funcions d'iOS. Part de la dificultat d'instal·lar correctament el connector, com també saber fer-lo funcionar, trobe que és culpa de la documentació del mateix connector a GitHub, on només diu quines funcions hi ha i poca cosa més.

Una vegada implementats els dos codis i comprovar que l'autenticació funcionava vaig passar a la implementació dels assoliments. Seguint la manera d'implementar de les millores, es va fer en la carpeta `data` una nova per als assoliments `achievements` i a `resources` una nova definició.

Els assoliments han de tenir un **ID** de cada plataforma perquè el joc els puga identificar i llançar el seu desbloqueig. Per traure l'ID s'ha de crear l'assoliment en la plataforma en qüestió:

- **PlayStore**: demana títol i descripció, i si el guardes ja es genera un ID que comença per `CgkInr...`. Per a publicar-lo farà falta una imatge de 512x512 px justos i a més es poden configurar altres camps addicionals.
- **App Store**: demana un títol, descripció i ID, el pots elegir. A més pots posar una imatge (sense restriccions) i has d'emplenar altres camps. Per a publicar-los s'ha de publicar amb una *build* que tinga *Game Center* habilitat com es pot veure a la figura \ref{fig:AppStore-AchievementWarning}.

![Errada per a muntar assoliments a l'App Store \label{fig:AppStore-AchievementWarning}](Memoria/Assets/Pianissimo/It4/AppStore_AchievementWarning.png){height=5cm}

Encara que no es publiquen els assoliments, per als usuaris de prova seran visibles. En aquesta iteració només s'han publicat els d'Android perquè era més senzill.

A *Floc*, com només tenia un únic codi, els assoliments només eren constants amb l'ID de la Play Store. Per a tenir una mica de consens i pensant en el futur, per si em faria falta en la definició es van afegir variables per al nom i la descripció, totes amb claus per a la internacionalització. Si en lloc de voler dependre dels serveis de Google Play o de Game Center volguera mostrar els assoliments llistats en alguna banda de la meua aplicació, podria aprofitar aquestes característiques.

Per a fer proves havia d'usar els dispositius físics, en l'emulador no s'autentica. I a més passa el següent, si uses un Android connectat per USB sí que pot detectar que hi ha els Play Services, però mai arriba a autenticar. Ix el seleccionador de compte de Google Play però no funciona. S'ha de muntar el joc a la botiga i quan el descarregues per eixa via sí que funcionen.

Primer es va provar amb Android per facilitat i una vegada resolts els problemes d'iOS, també amb l'iPhone.

##### Problemes

Com es comentava abans aquesta iteració ha sigut a més problemàtica.

Primer es va solucionar el problema que s'anava arrossegant en la terminal de `can_process` que ocorria quan canviava d'escena, però no apuntava a cap lloc concret, sinó a una mena de node intern dels subprocessos de Godot, per tant, era molt difícil fer una traça.

Per trobar la solució vaig fer ús tant de Claude com de ChatGPT, ja que per internet i fòrums de Godot no trobava una resposta que em servira. El primer després de moltes proves em deia que si on m'afectava al joc ho podia posposar i el segon en un parell de preguntes em va trobar què fallava.

Resulta que quan canviava d'escena amb `change_scene_to_file()` es quedaven nodes orfes que seguien en l'arbre de l'escena mentre es posava l'altra i, per tant, emetia eixa errada perquè no havien acabat el que estaven fent. Perquè no passe s'ha d'ajornar amb `call_deferred()` i aquesta modificació s'ha d'aplicar en tots els canvis d'escena.

```gd
	# Error can_process
	get_tree().change_scene_to_file(ScenePaths.CARD_ALBUM)
	# solució
	get_tree().call_deferred("change_scene_to_file",ScenePaths.CARD_ALBUM)

```

Després entrant a les errades per les noves implementacions. Amb Android encara que havia sigut relativament senzill fallava alguna cosa que impedia poder autenticar correctament l'aplicació. Els passos per a fer que funcionara van ser:

- Instal·lar correctament el connector i activar-lo, com també posar l'ID del projecte.
- fer el codi de la façana amb el *back-end*.
- Configurar la clau de desenvolupament i la de Cloud Console.
- Muntar el *bundle* perquè se signe en el núvol.

Els vaig repassar tots amb el vídeo per veure que estiguera tot correctament, podia firmar el joc amb la meua clau, tenia la resta en Cloud Console... Vaig recórrer de nou a internet i a falta de respostes a la IA, que en una allau d'originalitat, em demana que tornés a fer les comprovacions que ja havia fet. Així vaig estar molt de temps fins que en algun moment vaig provar diferents comandos amb *logcat* a la terminal i vaig poder traure el següent (s'ha acurtat les dades confidencials per privacitat):

```logcat
**** APP NOT CORRECTLY CONFIGURED TO USE GOOGLE PLAY GAME SERVICES
**** DEVELOPER_ERROR
**** This is usually caused by one of these reasons:
**** (1) Your package name and certificate fingerprint do not match
****     the client ID you registered in Developer Console.
**** (2) Your App ID was incorrectly entered.
**** (3) Your game settings have not been published and you are 
****     trying to log in with an account that is not listed as
****     a test account.
**** (4) A server auth code was requested, but an incorrect client
****     id was provided. The client id for server auth codes should
****     be the client id for the game server (not the android app).
****
**** To help you debug, here is the information about this app
**** Package name         : es.ua.eps.pianissimo
**** Cert SHA1 fingerprint: A7:42:B2:...:3E:15:0E
**** App ID from manifest : 93...50
****
**** Check that the above information matches your setup in 
**** Developer Console. Also, check that you're logging in with the
**** right account (it should be listed in the Testers section if
**** your project is not yet published).
****
**** For more information, refer to the troubleshooting guide:
****   http://developers.google.com/...
```

Les raons que donava era el que la IA i internet no paraven de repetir (informació de la documentació d'Android Studio), però en l'ajuda per a *debuggejar* el SHA-1 resulta no ser-me familiar, cap de les claus que tinc tenia eixe aspecte, com era possible?

L'única explicació que li puc donar és que quan vaig muntar l'aplicació en la iteració 1 es va signar al núvol i eixa clau no la vaig configurar a la Cloud Console, però per algun motiu en els passos de configuració no feia falta. Això o en alguna distracció vaig fer una clau de més o a saber si vaig signar dues vegades en algun moment i alguna clau no me la vaig guardar. Tant se valia, vaig afegir la clau a Cloud Console i com per art de màgia ja anava a la perfecció.

Si amb aquesta errada vaig tenir aquest esglai, en iOS em faltava estar a la vora de tirar la tovallola i quedar-me només amb Android.

Resulta que els connectors per a iOS en Godot s'han de posar a una carpeta `res://ios/plugin` cosa que desconeixia perquè estava posant el de Game Center dins d'`addons` com feia amb Android i clar, no ho veia enlloc per a habilitar-lo. 

Fins que no vaig saber la ruta correcta em vaig trobar de nou buscant ajuda inútilment per què no estava trobant la resposta que era la solució i a més alguns suggeriments de la meua errada ni tan sols apareixien a Godot. Per exemple, trobava respostes com: *marca a "Plugins" la casella de "game center" dins de la configuració d'exportació d'iOS*, i era impossible trobar-ho perquè no m'eixiria fins que no tinguera ben col·locat el connector.

Aquesta va ser la primera d'iOS, la segons va ser que em vaig descarregar la versió que hi havia disponible al repositori dels connectors i, com comentava per la poca claredat de la documentació, em vaig descarregar una versió que per a la meua versió de projecte no servia. Tenia la 4.7 i el meu projecte necessitava una per a la 4.5 o si hi havia, 4.5.1. Resulta que sí que existia aquesta versió concreta, el que passava era que descarregant-la i col·locant-la al seu lloc encara no funcionava, començava a ser desesperant.

Es veu que havia de compilar-la jo mateixa perquè no es trobava en cap lloc compilada, així que amb la terminal em vaig descarregar diverses llibreries que m'ajudarien a obtenir els `.xcframework` que requeria el connector. Va tardar bastant més temps del que pensava, però un cop tenia ja el connector en aquest format i a la ubicació correcta ja va funcionar sense problema. Tota aquesta *faenata* s'haguera pogut estalviar si a la documentació especificara que s'ha d'usar la versió adequada i que estiguera ja compilada, però això és un altre tema.

### Iteració 5

Aquesta iteració comprén del 22 fins al 27 d'agost de 2026. M'haguera agradat que durara un dia o dos menys per tal d'anar tancant coses, però no ha sigut possible.

Durant aquest temps s'ha millorat la UI i s'han afegit algunes funcionalitats per a deixar una versió bastant definitiva per a poder fer proves a usuaris en la següent iteració.

No cal nomenar què feia falta millorar de la interfície si mirem les captures de les anteriors iteracions. S'ha canviat to en major o menor mesura. Es pot veure el detall al GDD.

La mentalitat aquests dies ha sigut d'anar solucionant pantalla a pantalla fins deixar-la en estat òptim, i sobre la marxa si feia falta afegir alguna millora o corregir alguna errada s'anotava al Kanban.

El Kanban durant el projecte s'ha usat molt poc, però aquesta iteració ha sigut clau per a mantenir tot ordenat i organitzat. Les tasques eren descriptives i amb el detall suficient per a saber del que estava parlant en el moment d'anotar-les. No s'ha tardat molt en implementar-se, principalment s'anotaven amb etiquetes denotant la seua importància i de quina temàtica eren.

Les que més s'han anotat eren `nice-to-have`, ja que una vegada s'acomplia en el previst als esbossos sorgien els "*i si pose açò?*" o els "*pot ser es veuria millor d'aquesta manera*". Els colors han anat variant, la manera de distribuir l'espai també, s'han ajustat mil vegades els marges i els contenidors... El resultat que s'ha buscat ha sigut consistent, colorit i a poder ser divertit.

![Aspecte d'algunes de les pantalles de Pianissimo després dels canvis en la Iteració 5](Memoria/Assets/Pianissimo/It5/Pianissimo_UI_It5.jpg){height=8cm}

#### Projecte Godot

Amb la premisa de la diversió va sorgir la idea que la pantalla de `home` tinguera l'aspecte d'un **teclat**. Com el mecanisme de teclat ja el tenia implementat a `game` i no calia que fora dinàmic va ser més senzill: es van col·locar els botons que farien de tecles blanques i negres en el seu corresponent contenidor, assignant un tema per a cada tecla i com distribuir-les ja es va aconseguir el resultat buscat.

El tema de la interfície, `main_theme` ha canviat molt per les coses que s'han afegit i les que s'han arreglat.

Una correcció va ser posar un tema a la variant `focus` dels botons, ja que al polsar un per defecte es quedava un fi requadre gris que quedava malament.

També s'ha arreglat l'aspecte de les Notes, un canvi de *ColorRect* a *Panel* per a donar-li l'estil del borde que ja tenen altres elements. Aquest canvi va suposar el desconfigurament de la mida, però era perquè el codi el tenia vinculat al Node *ColorRect*, quan es va llevar la dependència s'havia arreglat.

El **mode assaig** també va patir un canvi radical: va passar de gris fosc a un colorit fons i elements amb estil aplicat. No només la millora va ser visual sinó que es va afegir un camp per a posar etiquetes siga personalitza o predeterminada. Aquestes etiquetes en cas d'usar una predeterminada s'hi pot veure el color de l'activitat a l'historial d'assajos. A més configurant l'assaig s'ha afegit el mode *permissiu*.

Fins a aquest moment es tenia un mode "restrictiu" que en cas d'eixir-se'n de l'aplicació donava l'assaig com a fallit. Això inclou també tancar el mòbil. Godot manca de mecanismes per a detectar si el dispositiu està encés o apagat així que aquest mode no era molt pràctic.

Altres aplicacions, com *Forest*, tenen aquest mode i resulta molt atractiu, evitant que l'usuari puga caure en la temptació d'entrar en altres aplicacions. Al no poder implementar-ho amb la tecnologia al meu abast i estar quedant-se sense temps, s'ha optat per una solució menys rígida, que inclús queda millor a l'aplicació, ja que com s'ha mencionat en altres moments, el seguiment de tasques és un complement del joc *idle*. Com estava implementat el mode restrictiu només s'ha afegit el permissiu de manera que amb un *CheckButton* es puga controlar quin es vol usar en l'assaig.

Com encara volia donar-li més voltes, es va afegir l'opció en poder eliminar assajos registrats a l'historial amb un botó paperera, un botó per a poder cancel·lar una sessió abans de passar 10 segons sense tenir penalització (l'usuari es pot penedir o donar-li sense voler), estil a les entrades de l'historial i un *CheckButton* per a activar música de fons mentre s'està en un assaig.

Poques coses faltaven més al joc així que volia atacar un problema que segur que anava a passar quan es feren proves en usuaris, el joc no té instruccions i potser jo no estiga present quan algú el prove. 

Un bon disseny hauria de ser aquell que no necessita explicació i que només mirant-lo l'usuari ja sàpiga com usar-lo. El meu disseny de moment no és prou bo i les persones que provaran el joc no estan acostumades a jugar en mòbil i molt menys a *idles* (i saber de què van). Encara més, crec que no els agradarà aquest gènere i no li veuran la gràcia, així que, ja que em faran el favor, per què no fer-los la vida més fàcil.

La meua solució temporal, i que segurament es quedarà, és un **sistema** per a posar **tutorials** que també pot servir per a contar una miqueta la història del joc.
De moment s'ha preparat per a posar tutorial per a `game` i `focus` quan entres per primer cop. Es poden tornar a veure en la pantalla de configuració polsant els botons corresponents.

Aquest sistema és molt ximple, es pot veure com se superposa a l'escena un `CanvasLayer` que mostra el contingut del tutorial, que en aquest cas és un *Array* dels *TextureRect* que s vulguen posar. Es pot passar al següent gràcies a les fletxes i també es pot saltar directament amb el botó que pertoca.

Una altra cosa implementada és una mena de `toast` com si fora una notificació dins del joc que t'avisa moltes Notes has guanyat en la teua absència. Era un detall que estava mostrant en la terminal, que jocs com *Cookie Clicker* mostra i crec que suma a l'experiència del jugador.

Per acabar, s'ha pensat a afegir més contingut de tots els recursos (Estadístiques, Millores, Cartes i Assoliments). 

Alguns canvis en les estadístiques ha portat a canviar paràmetres del codi com és el cas del *metrònom* que ara fa sinergia amb la *precisió*.

#### So
Una vegada l'aspecte de `home` va estar fet, podria ser més divertit si les notes sonaven la nota corresponent.

Els àudios que es tenia pel moment eren trets de Freesound per diferents autors i es notava la diferència. La solució més ràpida a la que es va arribar va ser generar-los pel meu compte sense dependre d'altres gravacions i es va fer amb MuseScore.

Sabia que quan s'escriu una partitura en aquesta aplicació la pots reproduir i escoltar com sona, així que pot ser es podria exportar a àudio, com va ser el cas. Es va escriure una escala cromàtica ascendent on havia una nota negra per compàs i de velocitat, per a tenir una aproximació del que sona en la vida real, BPM = 60.

![Contingut Audacity i MuseScore per obtenir el so de les tecles](Memoria/Assets/Pianissimo/It5/Pianissimo-AudioKeys.jpg){height=6cm}

A més també s'ha corregit `audio_manager` perquè s'han posat els sons de les tecles en `sfx/piano_keys` i s'ha afegit a `_play_sfx` el paràmetre *directory* per a especificar. Serà útil si en un futur comptarem en molts efectes de so i es volgueren situar en la seua corresponent subcarpeta.

Una altra correcció del *manager* va ser arreglar que durant `game`la música quan acaba es parava per tal de fer que sempre sonara. Segons està el codi ara la música en bucle tota aquella  dins de `[musica1, musica2, ...]`.

#### Affinity

Les **icones** que apareixen en alguns botons del joc en un principi es tenia previst usar algunes d'alguna web d'icones de lliure ús o amb algun tipus de llicència permissiva. Al veure que les icones que m'agradaven o bé tenien cadascuna una llicència diferent o no m'agradavne les disponibles vaig pensar que seria més ràpid fer-les jo amb un programa que em permetera exportar-les com a SVG. Amb aquest format garanteix que es veurà bé a qualsevol resolució i a més les icones seràn més lleugeres que amb un PNG.

### Iteració 6

Aquesta iteració comprén del 28 al 31 d'agost de 2026. S'ha aconseguit implementar les notificacions amb el connector `NotificationSchedulerPlugin`, descarregat directament de GitHub i posat a mà en la corresponent carpeta perquè cap dels altres mètodes d'instal·lació ha semblat funcionar.

Crear més contingut de millores i stats + test


#### Formulari proves usuaris

Per tenir un seguiment de com va el testing amb els usuaris que han volgut participar s'ha pensat a fer una enquesta que cobrisca molts dels aspectes del joc.

S'ha fet amb Google Forms Es poden veure els resultats al corresponent apartat en l'Annex.

#### Exportador memòria
S'ha reduït el pes del PDF resultant perquè a mesura que estava cada vegada pesava més i era més lent. El motiu era que les imatges es clavaven sense comprimir i en tot a la resolució i com jo no havia tingut cura hi havia de molt grans i pesades. S'ha fet una solució automatitzada que detecta les imatges que s'usen en la memòria i les substitueix per una versió JPG al 90% de qualitat. Ha passat de pesar 60MB en l'anterior iteració a pesar-ne 10MB.

Aquesta solució beneficiara que en cas d'afegir imatges no es perga temps editant-les per a ocupar menys i no haver d'usar un programari de tercers per a comprimir el PDF. Ens estalviarà un ensurt a l'hora d'entrega si per la mida la plataforma no deixava muntar-ho.

#### Projecte Godot

TODO : comentar configuració plugin

TODO : comentar modificacions setttings.

S'ha arreglat l'aspecte de la icona de l'aplicació en Android. Segons el disseny de la icona si no està en la mida correcta en alguns paràmetres pot causar que es veja "ampliat".

En un altre projecte que vaig fer eixe problema també passava, però com el disseny estava molt centrat i xicotet no quedava malament, per tant, mai havia pensat que era un problema.

Resultava estrany que a iOS es veiés bé i en Android no. Es veu que els dos sistemes operatius tracten les icones de manera distinta, en el cas d'Android, el que donava problemes, ho podia solucionar fent versions del logo en la mida adequada i posant-les en la configuració d'exportació d'Android.

Amb Affinity va ser tan fàcil com fer una versió de 192x192 px i després una versió *foreground* i *background* de 432x432 px.

![Comparació entre icones en Android abans sense tenir el tamany adequat amb quan sí](Memoria/Assets/Pianissimo/It6/Pianissimo_AndroidIcon_Comparison.jpg){height=3cm}

*Scroll Container* arreglat per a la botiga de millores, no lliscava bé a menys que es posares exactament en la zona on estava la barra horitzontal. Es veu que Godot superposava l'àrea del botó a la del scroll per tant no propagava el gest, canviar el `mouse = Pass` permet que el gest arribe correctament, per tant, tota la zona ja llisca bé.

S'ha afegit també una millora per a fer més visual quan encertes una nota que és un xicotet *pop-up* d'un número segons les notes que guanyes per nota correcta. El color depèn si la nota és *perfect* o *good*. S'ha fet usant `tween`

#### UI

En aquesta iteració també s'ha canviat la tipografia. Es buscava una tipus *serif* per què, a pesar que el joc vol tenir una estètica més aïna divertida, en música la immensa majoria de vegades s'usa aquest tipus de tipografia més seriosa i formal.

Conceptualment, el piano és un instrument que se'l pot considerar elegant, solemne, regi... abans el joc tenia la tipografia per defecte *sense serifa*, que estava bé, però tampoc acabava d'encaixar. Amb `Noto Serif` crec que compleix bé el seu paper.

S'havia provat abans amb `Playfair Display`, encaixava a la perfecció en el concepte i s'assemblava moltíssim a llibres de partitures que tinc. El problema: en un mòbil no es llegia molt còmodament. O almenys al meu criteri, perquè aquesta tipografia té alguns traços prou finets en algunes direccions i podia causar problemes de visibilitat. Si ja tenia eixe dubte mirant la primera pantalla, on el text blanc contrasta amb les tecles, no volia pensar en altres bandes. 

S'ha consultat la llicència i es pot usar sense cap problema. Si en el futur inclús volguera comercialitzar el joc tampoc tindria problema. L'única cosa que s'ha de tenir en compte amb el tipus de llicència, *SIL Open Font License*, és que si es distribueix la tipografia s'ha d'incloure la llicència. En el meu cas, en una *bundle* de l'aplicació sí que cau en eixe paraigua així que de moment s'ha pensat posar els crèdits corresponents al GDD. Dins de l'aplicació no cal posar el crèdit.

### Iteració 7

De l'1 fins al 7 de setembre del 2026. En aquesta penúltima iteració s'intentarà tancar el joc el màxim possible. S'afegiran detallets principalment, algunes millores que vinguen dels comentaris que encaixen en el temps que queda... El gruix del joc ja està fet. Només es pot millorar cosetes i afegir contingut.

S'ha fet gestions acadèmiques com demanar la defensa i emplenar documentació.

Pel que fa a la memòria s'ha acabat quasi sencera. A l'apartat de metodologia només li faria falta anar afegint més dispositius quan la gent acabe de fer l'enquesta.

#### Tendes d'aplicacions

Aquesta iteració ha tingut els últims retocs de cada botiga. 

Pel que fa a l'App Store m'he barallat per a poder enviar l'aplicació a revisió molta estona perquè emplenar tota la pàgina és llarg i tediós, en lloc de dir-te quins camps són obligatoris per a emplenar, només ho pots saber quan li dones el botó d'enviar a revisió.

On més temps he perdut és que demana captures tant sí com no d'iPhone de 6.5". El dispositiu que jo tinc per a fer proves és un iPhone 12 que té 6.3" i encara que deixa muntar-les és obligatori multar les de la mida que ells diuen. Supose que si pots provar l'aplicació en l'emulador de Xcode pot ser senzill, però els jocs de Godot tenen la particularitat que els projectes que esportes per a iOS no es poden provar a l'emulador, dona error.

Les he hagut de trampejar amb Affinity reescalant les que ja tenia a mà. I no només ha sigut exisit amb la mida, si no també amb el canal alfa.

Després de l'odissea d'intentar arribar a la mida que deixava després m'he topat amb què també havia de muntar captures en un iPad. Evidentment, la meua paciència no donava més de si i les imatges estan estirades horitzontalment.

![Captures estirades de Pianissimo per a iPad per tal que l'App Store permetera enviar l'aplicació a revisió](Memoria/Assets/Pianissimo/It7/Pianissimo_AppStore_iPad.png)

#### Proves amb usuaris

S'ha passat l'aplicació a diferents usuaris així com una enquesta preguntant per diversos aspectes del joc. S'ha donat de termini preferentment de dijous a diumenge d'aquesta setmana, per tal de fer la següent iteració final que durara l'última setmana i corregir totes les errades que puga.

Molts comentaris que veig els podia esperar, per tant, ja els tenia previstos d'anar arreglat els següents dies. No els vaig poder corregir abans per què en algun punt havia de compartir l'aplicació i quan més tardara menys temps tindria per poder corregir qualsevol comentari.

El tauler Kanban s'ha afegit una columna *Feedback Testing* per a posar dedicadament les tasques que he de fer associades a la retroalimentació.

Per a les proves he tingut un bon nombre d'usuaris d'Android per a poder provar l'aplicació, en canvi, per iOS no s'ha tingut massa sort, i damunt en els que s'ha provat fora del meu dispositiu de proves el so no anava. Aquesta errada no l'he entesa molt bé perquè per defecte el so està activat i com a mi sempre m'ha anat quan he fet les proves amb Xcode o quan l'he baixat de *test flight* em vaig quedar bloquejada.

No tot podia ser roí, s'ha provat *Pianissimo* en un iPad i es veu estupendament, wl disseny suporta dimensions grans, està ben fet doncs.

TODO : anotar algunes de les observacions.

#### Projecte Godot

S'ha implementat un sistema de nivells. 
TODO : posar error música

### Iteració 8

Aquesta iteació comprén del 8 al 15 de setembre de 2026.

S'ha afegit una escena de perfil del jugador.

TODO : posar quines coses estem implementant

TODO : explicar reunió breument

#### Projecte Godot

S'ha arreglat l'errada de la música quan es canviava de `home` a `idle`. S'ha posat una sèrie de *prints* per a trobar quina pista d'àudio s'estava reproduint i si existia, a veure si és que s'esborrava en el canvi de l'escena per la implementació dels nivells.

Resulta que quan tornàvem a `Home` després d'entrar a `Idle` per primera vegada, la variable `_playlist` estava buida perquè s'ha esborrat amb `cleanup()`, per tant, quan entrava de nou. a `Idle` es quedava en la música que estava sonant, la de *menú*.

L'errada era la típica que sol passar amb els *arrays*: Godot els **passa per referència** i, com a resultat, quan es buida per a tornar a `home` quan torna a `idle` com no se li assigne directament una peça continuarà amb el que hi havia. Abans no passava perquè només teníem una peça sonant en `idle` i l'assignàvem manualment. El problema no era la implementació del `LevelManager` sinó com estava fet `AudioManager`.

La solució ha estat duplicar l'*array* amb `duplicate()` per fer-ne una còpia.