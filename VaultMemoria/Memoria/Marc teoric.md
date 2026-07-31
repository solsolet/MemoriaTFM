%%es farà esment als elements conceptuals que serveixen de base per a la investigació, estudis previs relacionats amb el problema plantejat, etc%%

# Marc teòric
En aquesta part de la memòria s'explicarà tot el necessari per a comprendre tot el que es conta en aquest treball. El lector trobarà elements conceptuals bàsics, estudis previs i la seua anàlisi per plantejar de quin punt de partida naix aquest projecte. Llegir aquesta secció facilitarà la lectura de les següents i es contestarà els "per què" d'algunes decisions.
Qualsevol qüestió que es considere susceptible d'ampliar, i continue sent rellevant per al treball, per tal de no fer pesada la lectura, estarà com a material de consulta a l'annex.

## Context
Aquest apartat donarà les nocions necessàries al lector per a saber en quin context es troba aquest projecte. Veurem conceptes que s'han de tenir presents durant la lectura.

### Videojocs

#### Gèneres

Els jocs tenen dos tipus de gèneres: el de la història i el del joc. Ens centrarem en el segon per a aquest apartat. El *gènere d'un joc* descriu el tipus de **jugabilitat** [@levelUp, p. 49], no és el mateix un *shooter* que un de simulació. És important reconéixer el gènere on s'emmarca un videojoc, ja que veurem uns trets característics comuns que ens ajudaran a l'hora del disseny d'un videojoc per a tenir certes consideracions.

Una altra cosa que cal destacar és que molts jocs poden tenir més d'un tipus de gènere, de manera que es veuran alguns dels trets d'aquests en el joc resultant.

Per exemple, *Crypt of the NecroDancer* és un videojoc roguelike de ritme.

##### Idle

Els jocs *idle* poden progressar amb la mínima o cap interacció del jugador durant llargs períodes de temps. Aquesta interacció pot incloure fer *clic* o *tap* repetidament per a acumular recursos o tenir l'habilitat d'automatitzar el joc [@playingToWait, p. 2].

Aquest gènere també el trobar anomenat com: *background games*, *ambiental games*, jocs incrementals i ZPG (*Zero Player Games*). Aquest últim podríem considerar-lo un subtipus dels *idles*, ja que no cal l'input del jugador, el joc progressa soles.

**Característiques**:

- Interacció mitjançant *tap* o *clic* que permet guanyar punts.
- A cert nombre de punts pots muntar de nivell o adquirir una millora per a clicar, com per exemple l'automatització.
- Cada muntada o millora costa més.
- L'espera és part de la jugabilitat, pel fet que mentre s'espera augmenta la puntuació.
- Infinits o amb molts nivells de millora.
- Constant interacció i retroalimentació.
- Sentiment d'assoliment immediat sense esforç.
- No hi ha Game Over.

**Exemples**: *Cookie clicker*, *Magic Archery*, *Progress Quest* o *Push The Square*.

##### Musical

Els videojocs musicals són un gènere de videojoc completament orientat a la interacció de les accions del jugador sincronitzades amb la música que sona. Aquestes accions solen estar dins del pols i al ritme de la música [@Building-a-music-rhythm-video-game, p. 1].

**Característiques**:

- Ritme: sol aparéixer visualment com un element interactuable si li dones en el moment exacte
- Límit de temps: de vegades es té només el temps que dura l'obra musical de fons (el nivell).
- Ús dels BPM (*Bits per minute*): el ritme s'executa seguint els BPM de la música que sona.
- Nivells de dificultat / puntuacions: se't pot avaluar la teua execució de l'obra al final amb un veredicte o a cada encert recompensar-te puntuant.
- Indicació de precisió (perfecte, mal, regular...): segons l'execució si has encertat el ritme de manera més precisa on rebràs millor o pitjor puntuació.
- Sinestèsia: el ritme, a banda de sonorament, el podràs veure visualment en diferents formes, colors...
- Cançons noves/desbloquejables: una motivació per a obtenir millor puntuació i continuar explorant el joc.
- Barra de vida o penalització per errada: en cas de no encertar perdre una vida o punts.

**Exemples**: *Rythm Heaven*, *Just Dance*, *Geometry Dash* o *Guitar Hero*.

La forma que tenen els videojocs de ritme de rebre l’input del jugador pot ser variada, des de perifèrics, com guitarres, o amb els peus ballant fins a usar els botons físics d'una consola o virtuals.

##### Productivitat

%%TODO : Contar què son%%

### Mercat de videojocs mòbils

Els videojocs no tenen ni un segle d'història, és per això que sorprén com han crescut en l'àmbit tècnic i econòmic de forma abrupta. Cosa que encara es veu més accentuada en el mercat mòbil dels videojocs que encara és molt més recent i ha sobrepassat els seus antecessors: les consoles i el PC.

#### Història dels videojocs mòbils

Per tindre una idea d'on partim, els primers jocs per a mòbils van més enllà de la tecnologia dels telèfons mòbils, sinó que de les consoles portàtils ja hi havia traces del que estava per vindre. Tenim, per exemple, consoles com la *Game & Watch* de Nintendo o els precursors dels mòbils, les PDA (*Personal Digital Assistants*). Aquestes últimes, a banda d'incloure funcionalitats d'agenda, llibreta per a prendre notes, calculadora, etc., podien vindre amb jocs inclosos, com era el cas de la *Sharp Wizard* que tenia jocs com Tetris, escacs o backgammon.

En aquestes primeres instàncies els jocs venien inclosos en els dispositius, no calia fer un esforç per a tindre'ls, com era el cas del *Snake* de Nokia, en 1997 que va estar en 350 milions de dispositius [@exploringMobileGameInteractions].
Van ser plataformes com *i-mode* al Japó que permetien la descàrrega i es començava a conrear un interés per part de companyies desenvolupadores per aquest mercat, com Konami, Nintendo o Bandai entre altres [@edge1999mobiles].

Si ens situem als 2000, per molt que l'interés existís, hi havia una gran limitació per diverses bandes del creixement d'aquest mercat:

- L'accés a internet dels dispositius mòbils.
- Molta diversitat de programari: cada casa feia el seu i no hi havia un estàndard per als desenvolupadors que els facilitara la portabilitat dels jocs.
- La limitació de les tendes d'aplicacions del moment en les interfícies altament textuals que  dificultaven l'exploració fora dels primers títols a aparéixer.
- Inferior qualitat d'experiències de videojocs respecte a les consoles portàtils.

Continuant cronològicament l'impacte més gros en el programari mòbil i l'ecosistema dels jocs, trobem l'any 2007 i 2008 el llançament del primer iPhone i de l'App Store respectivament [@mayra2015mobilegames]. No va ajudar directament a aquest mercat, sinó que va pal·liar totes les limitacions anteriors de manera que:

- L'oferta de jocs es va multiplicar i l'App Store va facilitar la seua distribució.
- Va entrar una onada de nous consumidors.
- Millor programari per a poder executar jocs més complexos.
- Es va tornar en un dels estàndards en proliferar, per tant, molts desenvolupadors van apostar per aquesta tecnologia i plataforma.
- Ecosistema compatible amb tots els productes d'Apple [@AppleReinventsPhone].
- Nou disseny d'interfícies que abandonaven els controls físics i els canviaven per tàctils.

En resumits comptes, va propulsar el sector mòbil en tots els seus aspectes. Va ser tal el seu triomf que va fer abandonar a una gran quantitat de la competència a excepció d'Android i altres menys rellevants.

Amb aquest context, jocs com *Angry Birds*, llançat en 2009, va arribar a l'App Store per un preu assequible per al consumidor que el va fer arribar al podi de les aplicacions de pagament als principis dels 2010. Prompte es va llançar la versió del joc per a Android de forma gratuïta, però amb anuncis a menys que es pagara.

Molts altres grans títols es van llançar en aquesta dècada i van aplicar diverses tècniques de monetització que hui han servit de precedent per a hui en dia, ja que encara s'usen assíduament. S'ampliarà la informació en l'apartat de [monetització](#monetització).

D'altres jocs rellevants també van aportar al consolidament d'aquest mercat i a l'atracció de públic com va ser el cas de:

- *Candy Crush* amb el seu model *freemium* i la combinació amb xarxes socials.
- *Clash of Clans* amb el seu aspecte multijugador.
- *Crossy Road* i similars per portar el gènere hipercasual a la palestra.
- *Pokémon Go* en els seus trencadors rècords de jugadors aconseguint tenir 100 milions de descàrregues en un mes de vida per la seua modalitat RA geolocalitzada addictiva.
- *Fortnite* iniciant l'era dels jocs multiplataforma perquè arribara a dispositius mòbils.
- *Among Us* pel seu auge durant la pandèmia i el seu component social.

Com a últim esdeveniment important que va donar un gran impuls al mercat, ens situem en la pandèmia en 2020 que com a resultat del confinament, la gent es va abocar a jugar a videojocs. Al sector mòbil açò va repercutir en un increment del 40% [@impactCOVID19Mobile2020].

#### Tendències

#### Monetització

Els usuaris de dispositius mòbils es poden separar segons el SO que usen. Si mirem enrere fins hui dia, per exemple situant-nos l'any 2020 fins al 2026 (any en què es redacta aquest treball), la seua majoria usen Android (quasi un 70%) i la resta iOS (quasi el 30%) i la resta de SO no resulten significatius.

Globalment, ho podem veure a la figura \ref{fig:os-mundial}. També podem analitzar les dades a escala europea (vegeu la Figura \ref{fig:os-europa}) i finalment en l'àmbit nacional a la Figura \ref{fig:os-espanya}.

![Mobile OS Worldwide 2020-2026. StatCounter \label{fig:os-mundial}](Memoria/Assets/MobileOS-Worldwide-2020-2026-StatCounter.png)

![MobileOS-Europe-2020-2026-StatCounter \label{fig:os-europa}](Memoria/Assets/MobileOS-Europe-2020-2026-StatCounter.png)

![Mobile OS Spain 2020-2026. StatCounter \label{fig:os-espanya}](Memoria/Assets/MobileOS-Spain-2020-2026-StatCounter.png)

En aquests últims mesos es comença a veure un canvi en la tònica predominant que, encara que no es produïra, resulta interessant desenvolupar per als dos mercats. I no només cal prestar-li atenció al mercat d'iOS pel seu creixement, sinó també a pesar de ser molt menor té majors vendes dins de les seues aplicacions.

%%TODO : justificar açò últim, pot ser en monetització%%

#### Públic

%%Estudi mercat, mòbil:

- Investigació del mercat de videojocs mòbils
- Anàlisi de tendències actuals
- Estudi de models de monetització
- Identificació del públic objectiu%%

### Godot

%% TODO : explicar com funciona godot. puc comparar amb altres motors comercials, per que ra està en auge %%

## Estat de l'art {#sec-estat-art}

A continuació es comentaran els treballs que han servit de punt de partida per al desenvolupament d'aquest TFM. Per a saber més sobre el mètode d'anàlisi dels videojocs escollits, es pot consultar en la [metodologia](#sec-analisi-videojocs).

Tots els videojocs analitzats compten en una qualificació per edat per a tots els públics.

%% TODO : vore si filar tan prim %%

%%ESRB: Everyone, tothom
PEGI: 3, apte per a tots els públics
CERO: A, all ages, totes les edats
USK: 0, sense restriccions d’edat %%

%%Benchmarking:

- Selecció de jocs de referència
- Anàlisi de mecàniques
- Anàlisi d'interfícies (paper de Playing to wait llegir "Implementing Games Across the Interactivity Spectrum")
- Anàlisi de progressió
- Anàlisi d'experiència d'usuari%%

### Magic Archery

### [Cookie Clicker](https://cookieclicker.com)

Cookie Clicker és un joc indie desenvolupat per [Orteil](https://orteil.dashnet.org) i [DashNet](https://dashnet.org) llançat en 2013 fet amb Javascript.

Es pot jugar en la versió web gratuïta o en plataformes com Steam, PlayStation, Xbox, Switch i Android. En aquesta última trobem la versió gratuïta amb anuncis i la de pagament sense, entre les dues versions té més de 5 milions de baixades a la Play Store.

Sent un dels jocs més importants del gènere idle, resulta interessant analitzar com ha estat implementat. La versió mòbil és una adaptació de la versió web.

%% TODO : Webs que em poden resultar útils: %% 
%%
https://cookieclickers.io 
https://es.wikipedia.org/wiki/Cookie_Clicker
%%

#### Mecàniques

El joc tracta d'anar guanyant galetes. Es poden gastar en:

- **Edificis**: ajudants que et proporcionen una quantitat de galetes per segon. De cada tipus d'edifici pots tenir moltes unitats.
- **Millores**: increments de la producció de galetes o de les estadístiques d'un tipus d'edifici.

Les galetes es poden guanyar fent **clic** a la galeta gegant o a través dels teus Edificis. A mesura que s'avança en el joc, es desbloquejaran assoliments.

%% TODO : mencionar terrons de sucre i legado %%
#### UI/UX

En les figures \ref{fig:cookie-pc} i \ref{fig:cookie-pc-esquema} es poden veure unes imatges de la interfície per a ordinador.

![Interfície d'usuari en ordinador. Font: Cookie Clicker \label{fig:cookie-pc}](Memoria/Assets/AltresJocs/Cookie/CookieClicker-UI-PC.png) 
![Esquema interfície d'usuari en ordinador de Cookie Clicker \label{fig:cookie-pc-esquema}](Memoria/Assets/AltresJocs/Cookie/CookieClicker-UI-PC-Esquema.png) 
Es pot veure l'adaptació de la interfície en mòbil en les figures \ref{fig:cookie-mobil} i \ref{fig:cookie-mobil-esquema}.

![Interfície d'usuari en mòbil, per ordre d'aparició: Cookie, Tenda (d'edificis i de millores), Especial, Estadístiques, Miscelània i detall dels Assoliments i de les Millores. Font: Cookie Clicker \label{fig:cookie-mobil}](Memoria/Assets/AltresJocs/Cookie/CookieClicker-UI-Mobile.png)

![Interfície d'usuari en mòbil \label{fig:cookie-mobil-esquema}](Memoria/Assets/AltresJocs/Cookie/CookieClicker-UI-Mobile-Esquema.png)

La interfície és senzilla tant visualment com d'usar-la. Es pot veure ben diferenciades cada part d'aquesta:

| Zona         | Funcionalitat                                                                              | Navegador                                                                              | Mòbil                                                                     |
| ------------ | ------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------- | ------------------------------------------------------------------------- |
| **Cookie**   | Mostra el marcador i és la zona interacutable per a guanyar galetes                        | Fer clic                                                                               | Fer tap                                                                   |
| **Menú**     | Menú variat amb els botos per a veure: opcions, estadístiques, informació del joc i llegat | Tots en els botons en un mateix lloc                                                   | Desplega ten diferents apartats entre la pestanya de "`Stats`" i "`Misc`" |
| **Recursos** | Disposició gràfica dels Edificis comprats                                                  | Quan hi ha més files que espai disponible en la pantalla es pot desplaçar verticalment | No apareix                                                                |
| **Tenda**    | Mostra els articles que es poden comprar amb un clic d'Edificis i millores.                | Les millores al situar el ratolí es desplegar per a verue'n totes les disponibles      | Es separa en dues pantalles que per met desplaçar-te per la llista        |
| **Anuncis**  | Anunci tipus *banner*                                                                      | No hi ha                                                                               | Hi ha en la versió gratuïta                                               |
| **Especial** | Events estacionals                                                                         | No hi ha                                                                               | S'activa quan hi ha                                                       |
: Comparativa interfície entre la versió de navegador de Cookie Clicker i la de mòbil

#### Progressió

Per a progressar en el joc s'ha d'anar comprant Edificis o Millores. Aquestes es poden comprar mitjançant galetes que es poden aconseguir clicant la galeta o bé passivament per les que generen els Edificis.

%% TODO : consultar la Wikia  per a posar valors de coses. Mencionar notificacions ingame %%

S'ha provat el joc en la versió de navegador i de mòbil i es pot apreciar una progressió més elevada amb la mòbil, ja que sempre que tornes a l'aplicació, aquesta independentment estiga en *backgroud* o no, en tornar et diu moltes galetes has guanyat en la teua absència, mentre que al tancar el navegador i tornar, no passa.

#### Música i so

El joc en la seua versió mòbil està carent de música de cap mena i de sons només hi ha de dues classes:

- El clik sobre la galeta
- Els cliks a botons de la interfície. No tots els botons sonen igual

### [Push The Square](https://asdehielo.itch.io/push-the-square)

Joc indie desenvolupat per [Raúl Moreno Tamayo](https://asdehielo.itch.io) publicat a itch.io en 2021. Tracta que un misteriós quadrat ha aparegut en ta casa i no fa res a banda de girar en el sentit de els agulles del rellotge. Gastaràs tots els teus estalvis assegurante que gire [@PushSquare].

És un joc curt que es pot passar en menys de 10 minuts.

%% TODO : posar més coses %%

#### UI/UX

El joc té un estil píxel art senzill.

![Pantalla del joc. Font: Push the Square](Memoria/Assets/AltresJocs/PushTheSquare/PushSquare-2.png)

![Estadístiques. Font: *Push The Square*](Memoria/Assets/AltresJocs/PushTheSquare/PushSquare-1.png)

![Pantalla final. Font: Push The Square](Memoria/Assets/AltresJocs/PushTheSquare/PushSquare-Credits.png)

### Rythym Paradise

*Rhythm Paradise* és un videojoc musical, de ritme a l’estil Wario Ware, és a dir, com una sèrie de minijocs. Aquests videojocs posen a prova el sentit del ritme del jugador i normalment va lligat amb la memòria. D’aquest tipus, Nintendo compta amb predecessors com la sèrie *Guitar Hero*, *In the Groove* o *Rock Band*. I de la casa trobem *Donkey Konga*, *Elite Beats Agents* o *ElectroPlankton* entre altres.

El videojoc va ser llançat al Japó el 31 de juliol de l’any 2008 amb el nom de *Rhythm Tengoku Gold*, que vol dir *Rhythm Heaven Gold*. A la resta del món va ser comercialitzat en altres dates. A l’Amèrica del Nord el 5 d’abril del 2009, a Austràlia el 4 de juny amb el nom de *Rhythm Heaven*,  i a Europa l’1 de maig del mateix any amb el nom de *Rhythm Paradise*, que és com s'anomenarà en aquest cas.

Molts d’aquests videojocs van de bracet amb una trama íntegrament musical o lligada a un instrument, cosa que *Rhythm Paradise* no. Incorpora la música com un acompanyant de l’acció del minijoc, com puga ser jugar al ping-pong o collir fruita.

El videojoc va ser llançat per a la Nintendo DS. El seu predecessor, *Rhythm Tengoku*, per a la Game Boy Advance i altres títols de la sèrie han sigut per a Wii o Wii U com la continuació *Rhythm Heaven Fever*. La presència del joc en diferents consoles que evolucionen amb el temps, és un indicatiu que les mecàniques es poden replicar en diferents contextos tecnològics.

Va tindre una gran rebuda, de totes les pàgines que puguem consultar de rànkings de videojocs, veurem que la seua nota sempre és un notable. Com ara a *Metacritic*, que té un 83 sobre 100, en *Famitsu* un 34/40 o 9 de 10 estrelles en *Wired*.

#### Mecàniques

L’objectiu principal és passar-se tots els minijocs; compta amb 50. A banda es poden desbloquejar lectures, cançons, jocs sense fi o lliçons de guitarra segons s'obtinguen bones marques en els minijocs.

Quan es polsa per a jugar a un minijoc, abans hi ha l’opció de practicar-lo perquè s'ensenye quina mecànica usa i t’hi habitues abans de jugar de debò.

Una vegada acabes un minijoc, al final et donarà una puntuació de com ho has fet; hi ha 4 possibilitats:

- **Una altra vegada**, suspés i s'ha de tornar a intentar-ho (nota <= 4).
- **Bé**, prova passada i desbloqueig de la següent (5 - 6).
- **Bastant bé**, ha faltat a 2 errades d’haver pogut aconseguir un Genial (7 - 8).
- **Genial**, s'obté una medalla i un **marc d’or** (9 - 10).

Segons les medalles que tinga el jugador pot desbloquejar unes coses o altres.

Una vegada s'obtinga un Genial es pot optar a un **Perfecte**. Per aconseguir-lo, el joc, aleatòriament entre els minijocs que tingues, un Genial t’avisarà que pots intentar-ho. Es disposa de 3 intents per a no cometre cap errada i després torna a la normalitat. Si s'aconsegueix es desbloquejarà una lectura o cançó del minijoc i el marc passarà d’or a *perfecte*.

Per a jugar al *Rhythm Paradise* no fa falta res més que girar la Nintendo verticalment i usar el seu *stylus* en la pantalla tàctil. El videojoc permet canviar l'orientació segons es jugue amb la mà esquerra o dreta.

Amb aquest hi ha 4 **gestos** que es poden fer: tocar, soltar, lliscar i tirar. Es poden practicar a la cafeteria.

A cada minijoc seràs un personatge que es mourà al ritme que se li marque. Els botons no s’utilitzen a excepció del minijoc dels Rockers 2, que es gasten L o R (segons es siga esquerrà o dret) juntament amb l’stylus.

És una mecànica molt senzilla, però efectiva, no cal tindre molta destresa.

#### UI/UX

El videojoc planteja diferents espais, majorment bidimensionals, a excepció dels minijocs A Escala, Peloteo Rítmico i Aerosurf, que estan en 3D.

Fora de desplaçar-nos pel menú i les accions amb l’stylus que fan que el personatge del minijoc interactue no podem moure’ns. En aquest sentit, és un videojoc bastant estàtic.

Pel menú (una vegada ens passem els 15 primers minijocs) es pot lliscar cap avall i mostrarà 15 minijocs més per a jugar, i en superar-los es permetrà anar cap a l’esquerra o la dreta, on hi haurà 20 més en total.

![Vista de les dues pantalles de Rhythm Paradise. Font: Rhythm Paradise, GameCash, s. d., ](Memoria/Assets/AltresJocs/RhythmParadise/RhythmParadise-Vista.jpg)

Font: https://www.gamecash.be/rhythm-paradise-e2129.html

El jugador pot sentir-se absorbit pel joc, trobar-lo amé, divertir-se, ballar i taral·lejar amb les apegaloses melodies, però també pot arribar-se a frustrar si s’encalla amb un minijoc o no aconsegueix la puntuació màxima.

Segons passen els diferents nivells, seguir el ritme es complica una mica perquè s'hi introdueixen nous patrons de ritme i es juga amb la velocitat.

Perquè un jugador diga que s'ha “passat el joc”, a banda d’haver superat els 50 minijocs, es pot continuar perfeccionant puntuacions fins a tenir un **Genial** en cadascun i, per què no anar més lluny, un **Perfecte** en tots. Després ja no quedarà massa cosa per fer.

##### Menú

El menú del joc va estretament lligat amb el nostre progrés, segons avancem es modificarà. Apareixerà al centre un botó que ens permetrà moure’ns.

![Esquema menú del Rhythm Paradise](Memoria/Assets/AltresJocs/RhythmParadise/RhythmParadise-Menu.png)

1. La part verda té 15 minijocs, 5 per columna i n’hi ha 3. Anem del centre cap a dalt on el 5é minijoc de cada columna és un remix dels 4 anteriors.
2. Una vegada se supere l’anterior, es pot moure segons indiquen les fletxes blaves, es pot anar a la part blava. Passa com dalt, però al revés.
3. Superats els següents 15, es pot jugar el minijoc especial Aerosurf mentre apareixen els crèdits amb tots els personatges del joc. A continuació, es desbloqueja l’opció de moure’s com les fletxes taronja i s'afigen 20 minijocs que són les continuacions d’alguns dels jugats anteriorment (situats en la part groga, començant pel de l’esquerra i després el de la dreta).
4. Passats els 10 dels 20 que ens queden passem a jugar als minijocs de la part vermella.

#### Història

Al món de Rhythm Paradise no es pot situar en un lloc concret. Hi ha una gran quantitat d’escenaris i un gran nombre de personatges. A cada minijoc es crea el seu propi microclima.

Hi ha minijocs que sí que es poden situar, com ara *Duduá Moái*. Suposem, pel fet que són dos moais i l’ambientació càlida, que es troben a l’illa de Pasqua. O en *A escala* o *Robotellines* es poden situar en una fàbrica, ja que després parla el capatàs al jugador.

Aquest videojoc no es caracteritza per tindre cap trama. Cada minijoc són històries independents i no tenen per què estar relacionades entre si. És cert que els personatges que hi apareixen es fan cameos i pots veure’ls de fons o en els *Remix* apareixen seqüencialment els previs quatre minijocs, però d’història transversal a tots, no n’hi ha.

Alguns dels minijocs tenen segones parts (més difícils de superar), com pot ser *Robotellines*, *Club de fans* o *Aves marciales*.

De la resta podem dir que són situacions com un assaig de cor (*El coro*), una carrera de cotxes (Foto final) o fer natació sincronitzada (*El Chapuzón*) que, una vegada acabes el minijoc, segons com de bé ho hages fet, podem veure el desenllaç després que ens diguen la puntuació.

Una vegada obris el joc i fas una nova partida, una granoteta donarà la benvinguda i farà un petit tutorial al jugador de com tirar amb l’stylus on s'ha de tombar una granota i un cotxe de joguet. Després ja es juga lliurement pels minijocs que tingues disponibles, es pot anar a la cafeteria o al medaller.

#### Música i so

Tractant-se d'un joc de ritme, la música té un paper fonamental. Les peces, repartides entre els minijocs, han de ser d'una longitud similar, atractives a l'oïda i tenir alguna dificultat rítmica que les faça un repte. Sense deixar de costat que han de ser diferents i originals per a no tenir la sensació d'estar jugant tota l'estona la mateixa música.

Hi ha minijocs on hi ha una cançó amb lletra i d'altres que no. Segons el que s'estiga percutint el disseny sonor s'adapta, per exemple en *Peloteo Rítmico*, la pilota de ping-pong sona com una de veritat quan la veus rebotar o la colpeges.

Com analitzar-les totes és molt extens, només en destacaré dues: *Aves Marciales* i *Remix 3*. La particularitat dels *Remix*, com el seu nom indica, són un nivell on trobem els motius rítmics i música dels minijocs de la seua columna d'una manera que tenen una instrumentació i estètica diferent i uniforme.

##### Aves Marciales

La cançó d’aquest minijoc és un **tango**. Com a tal, es poden identificar alguns instruments que sonen, com un acordió, violins, una caixa, postisses i un contrabaix (o bé podria ser un baix elèctric), entre altres.

Està en **Re m**. Té una estructura A-B-A'-coda més una petita introducció (taronja). Cada secció està dividida en dues frases (rosa) i estan unides per un pont (verd). En vermell estan els graus d’alguns dels acords. En la secció B modula de tonalitat veïna Sol m, però després torna.

Té un ritme molt marcat i moltes síncopes, pròpies del tango.

S'ha fet una petita anàlisi en seria la següent:

%% TODO : Com citar la font? L'anàlisi és meu, la música és de Nintendo, la partitura és d'un lloc web de partitures %%
![Anàlisi propi de la partitura de *Aves Marciales*. Font: Musescore.com, ](Memoria/Assets/AltresJocs/RhythmParadise/RhythmParadise-Partitura-Aves.jpeg)

Font: https://musescore.com/user/36512366/scores/6794705?share=copy_link

##### Remix 3

La presentació de la pantalla d’inici dels *Remix* està fet a l’estil 8 bit. La cançó en si és una **barreja d’estils** com puga ser tango, jazz, copla o folk.

Se Senten trompetes, un saxo, una carraca, un cencerro, plats, piano, flautes… el que podria ser una mena de big band.

La cançó està en subdivisió ternària. Es tracta d’un 6 per 8 i està en **La m**.

Es senten dues parts separades d’un pont. Una possible estructura seria A-B-pont-B'-A.

En la primera part escoltem la trompeta acompanyada del que podria ser la big band, després dona pas al solo de saxo mentre el jugador fa tresillos.

A continuació hi ha un pont on sonen els vents fusta que ens tornen a dur al la part de saxo. Acaba en el tema principal i la tornada de la trompeta.

O podriem interpretar-ho com a A-B-A' i on abans havia distingit en A i B fer que siguen frases diferents.

De tota manera tant la part de trompeta  o de saxo estan en La m, al canvi al vent fusta es produeix una modulació a la dominant, Mi m. Després torna a la tònica i acaba.