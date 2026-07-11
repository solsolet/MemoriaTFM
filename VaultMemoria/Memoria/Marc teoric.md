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

## Estat de l'art {#sec-estat-art}

A continuació es comentaran els treballs que han servit de punt de partida per al desenvolupament d'aquest TFM. Per a saber més sobre el mètode d'anàlisi dels videojocs escollits, es pot consultar en la [metodologia](#sec-analisi-videojocs).

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

#### Música i sons

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