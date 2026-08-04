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

L'èxit d'un joc *idle* radica en un bon disseny de la retenció en tractar-se de partides molt llargues, i per a aconseguir-ho s'ha de tindre una progressió balancejada.

Un recurs molt utilitzat és el **creixement exponencial**, ja que provoca una sensació de progrés molt ràpid al principi.

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

%%TODO : Contar què son, quan tinga algo del mode concentració implementat%%

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

Molts altres grans títols es van llançar en aquesta dècada i van aplicar diverses tècniques de monetització que hui han servit de precedent per a hui en dia, ja que encara s'usen assíduament.

D'altres jocs rellevants també van aportar al consolidament d'aquest mercat i a l'atracció de públic com va ser el cas de:

- *Candy Crush* amb el seu model *freemium* i la combinació amb xarxes socials.
- *Clash of Clans* amb el seu aspecte multijugador.
- *Crossy Road* i similars per portar el gènere hipercasual a la palestra.
- *Pokémon Go* en els seus trencadors rècords de jugadors aconseguint tenir 100 milions de descàrregues en un mes de vida per la seua modalitat RA geolocalitzada addictiva.
- *Fortnite* iniciant l'era dels jocs multiplataforma perquè arribara a dispositius mòbils.
- *Among Us* pel seu auge durant la pandèmia i el seu component social.

Com a últim esdeveniment important que va donar un gran impuls al mercat, ens situem en la pandèmia en 2020 que com a resultat del confinament, la gent es va abocar a jugar a videojocs. Al sector mòbil açò va repercutir en un increment del 40% [@impactCOVID19Mobile2020].

#### Públic

Els usuaris de dispositius mòbils es poden separar segons el SO que usen. Si es mira enrere fins hui dia, per exemple situant-se l'any 2020 fins al 2026 (any en què es redacta aquest treball), la seua majoria usen Android (quasi un 70%) i la resta iOS (quasi el 30%) i la resta de SO no resulten significatius.

Globalment, es pot veure a la figura \ref{fig:os-mundial}. També es poden analitzar les dades a escala europea (vegeu la Figura \ref{fig:os-europa}) i finalment en l'àmbit nacional a la Figura \ref{fig:os-espanya}.

![Mobile OS Worldwide 2020-2026. StatCounter \label{fig:os-mundial}](Memoria/Assets/MobileOS-Worldwide-2020-2026-StatCounter.png){height=6cm}

![MobileOS-Europe-2020-2026-StatCounter \label{fig:os-europa}](Memoria/Assets/MobileOS-Europe-2020-2026-StatCounter.png){height=6cm}

![Mobile OS Spain 2020-2026. StatCounter \label{fig:os-espanya}](Memoria/Assets/MobileOS-Spain-2020-2026-StatCounter.png){height=6cm}

En aquests últims mesos es comença a veure un canvi en la tònica predominant que, encara que no es produïra, resulta interessant desenvolupar per als dos mercats. I no només cal prestar-li atenció al mercat d'iOS pel seu creixement, sinó també a pesar de ser molt menor té majors vendes dins de les seues aplicacions.

Pel que fa al públic dels jocs *idle*, es veu que els usuaris d'aquest tipus de joc són:

|             | Valoració mercat | Quota de mercat |
| ----------- | ---------------- | --------------- |
| **Adults**      | $7.18 bilions    | 54.4%           |
| **Adolescents** | $3.7 bilions     | 28%             |
| **Xiquets**     | $2.32 bilions    | 16.6%           |
: Segments demogràfics i el seu valor de mercat dels jocs *idle

El públic adult és el que encapçala el mercat dels jocs *idles*. Aquest públic, a causa de la seua independència econòmica i voluntat d'invertir a millorar l'experiència de joc, demostren els ingressos mitjans més alts per usuari entre els 32 $ - 45 $ anuals [@inteloIdleGamesMarket2025].

### Godot

Com s'ha explicat a la [metodologia](#sec-godot-451), Godot és un motor de videojocs 2D-3D de codi obert multiplataforma. Serà la ferramenta principal per a desenvolupar el videojoc, ja que ens permetrà exportar-lo tant a iOS com Android amb els ajustos que es determinen. A més es poden afegir connectors que facilitaran el control de funcions de les tendes d'aplicacions.

No només resulta atractiu com a motor per cobrir les necessitats bàsiques del projecte, també ho resulta per ser de **codi obert** sota una llicència MIT [@GODOT_faq], que vol dir:

- És de descàrrega gratuïta i es pot usar el motor per a qualsevol finalitat tan personal, sense ànim de lucre, comercial o altres.
- L'usuari és lliure de modificar, distribuir, redistribuir i mesclar Godot com vulga, per qualsevol raó, siga comercial o no.

A diferència dels altres motors comercials que predominen el mercat dels videojocs, com puguen ser Unreal o Unity, que poden ser idonis per a projectes més complexos i grans, per al cas d'un videojoc indie senzill de mòbil podrien considerar-se excessius a més de fer els projectes més grossos i difícils d'utilitzar.

Godot a més, després de la polèmica de Unity l'any 2023 de les tarifes per instal·lació i canvis en els termes i condicions, va créixer en popularitat. Per a fer memòria, el que va passar va ser que segons la llicència i vendes del desenvolupador i els canvis retroactius van posar a la comunitat en la seua contra i es plantejara buscar noves alternatives.

Unity és un motor de programari privatiu, per tant, no és mai del desenvolupador; aquests només tenen una llicència d'ús. Es troba en mans d'una corporació que mira pel seu interés propi, encara que això signifique degradar el servei, les condicions i perdre la confiança dels seus usuaris.

I per afegir més motius: mesos abans de la polèmica, Godot va llançar la seua versió 4.0 on s'afig i es millora suport gràfic 3D com també altres funcionalitats i arreglar algunes errades. Aquest Godot va traent versions i a dia de la redacció d'aquesta memòria hi ha fins a la 4.7 llançada en juny de 2026.

![Jocs fets amb Godot llançats en steam cada any. Font: steamdb.info](Memoria/Assets/Godot-Steam-Releases.png){height=5cm}

La comunitat va creixent, tenint més presència a xarxes, cada vegada es llancen més jocs fets amb Godot i també s'organitzen més *Game Jams* que impulsen l'ús del motor [@engineGodotUsageEngine].

## Estat de l'art {#sec-estat-art}

A continuació es comentaran els treballs que han servit de punt de partida per al desenvolupament d'aquest TFM. Per a saber més sobre el mètode d'anàlisi dels videojocs escollits, es pot consultar en la [metodologia](#sec-analisi-videojocs).

Tots els videojocs analitzats compten en una qualificació per edat per a tots els públics.

%%Benchmarking:
- Anàlisi d'interfícies (paper de Playing to wait llegir "Implementing Games Across the Interactivity Spectrum")%%

### [Magic Archery](https://barribob.itch.io/magic-archery)

Videojoc *idle* desenvolupat per [Barribob](https://barribob.itch.io) l'any 2024 de forma gratuita a itch.io i a Steam. Es pot jugar al navegador o descarregar-lo per a Windows. Has d'entrenar a un arquer per a ser el millor de tots els temps.

Les versions en cada tenda són diferents.

#### Mecàniques i progressió

Es pot passar en una vesprada tranquil·lament. L'arquer llança fletxes a les dianes sense que el jugador haja de fer, el que sí que pot decidir és quines estadístiques se centra o quines millores adquireix.

En la pestanya de **Pràctica** trobem les estadístiques de l'arquer, que són:

- **Concentració**: augmenta la velocitat.
- **Força**: augmenta el dany.
- **Fletxes**: hi ha de diversos tipus i cadascuna té particularitats i un dany associat. Els tipus de fletxes son: *Mana*, *Crítiques*, *Foc*, *Gel*, *Qi*, *Destral*, *Espectrals* i *Portal*.

Després hi ha la pestanya de **millores** que es poden comprar. Es divideix en 4 grups:

- **Equipació**: millores que afecten les estadístiques muntant el seu percentatge. El seu preu es duplica en cada compra.
- **Noves habilitats**: La seua compra desbloqueja un tipus diferent de fletxa. Preu únic.
- **Talents**: Millora alguna característica especial d'alguns tipus de fletxes. El seu preu es quadruplica en cada compra.
- **Mag**: millores que afecten la diana. Es pot augmentar el nombre de dianes, fer-les més fortes i armar-les perquè donen més diners. El preu es multiplica per 10 en cada compra.

#### UI/UX

El joc té un estil pixel art on el personatge del jugador, l'arquer és molt petit i tota l'atenció de la pantalla la tenen la trajectòria de les fletxes i les dianes.

Es pot accedir als menú clicant els botons per a mostrar-los i ocultar-los.

Una vegada es desbloquegen les fletxes s'obri un menú que mostra el dany de cada tipus de fletxa i conforme en compres s'incorporen.

Els menús resulten una mica molestos perquè tapen la pantalla del joc i no s'acaben de veure les fletxes, que son l'únic atractiu visual fora del fons de bosc. Els joc idle, com es vorà a continuació, solen tenir una interfície on la tenda de millores es troba a la dreta sense interrompre en l'escena del joc.

![Captura de pantalla de Magic Archery. Font: itch.io](Memoria/Assets/AltresJocs/MagicArchery/MagicArchery-Joc.png){height=7cm}

Les fletxes quan impacten en la diana els apareix el dany que li han inflingit amb el color del tipus de fletxa.

La música és relaxant i promou l'amosfera màgica de bosc. Els efectes sonors el principi quan hi ha poques fletxes és agradable, però conforme es tenen moltes resulta molt molest. Cada fletxa sona diferent

### [Cookie Clicker](https://cookieclicker.com)

*Cookie Clicker* és un joc indie desenvolupat per [Orteil](https://orteil.dashnet.org) i [DashNet](https://dashnet.org) llançat en 2013 fet amb Javascript.

Es pot jugar en la versió web gratuïta o en plataformes com Steam, PlayStation, Xbox, Switch i Android. En aquesta última trobem la versió gratuïta amb anuncis i la de pagament sense, entre les dues versions té més de 5 milions de baixades a la Play Store.

Sent un dels jocs més importants del gènere *idle*, resulta interessant analitzar com ha estat implementat. La versió mòbil és una adaptació de la versió web.

#### Mecàniques i progressió

El joc tracta d'anar guanyant galetes. Es poden gastar en:

- **Edificis**: ajudants que et proporcionen una quantitat de galetes per segon. De cada tipus d'edifici pots tenir moltes unitats. Hi ha fins a 20 tipus diferents.
- **Millores**: increments de la producció de galetes o de les estadístiques d'un tipus d'edifici. Hi ha fins a 716 diferents.

Les galetes es poden guanyar fent **clic** a la galeta gegant o a les *galetes daurades*, a través dels teus *Edificis* o per la quantitat de *Llet*. A mesura que s'avança en el joc, es desbloquejaran **assoliments**.

Una altra mecànica que hi ha és el **llegat**. Quan es guanya certa quantitat de galetes es pot **ascendir**, que vol dir perdre el progrés, però es guanya en *fitxes celestials* i *nivells de prestigi* que porta a tenir millores permanents en la resta de partides.

La versió de navegador compta amb altres mecàniques que tenen alguns dels seus edificis com: invertir en borsa amb els bancs, cultivar llavors amb la granja...  També té *terrossos de sucre* on pots guanyar-ne un diàriament.
Aquestes mecàniques ajuden a guanyar més galetes i millorar la teua progressió. Fa també el joc més interessant. Després d'estar un temps jugant les dues versions, es podria considerar que la versió de navegador és més entretinguda i motiva a entrar diàriament, cosa que la versió mòbil no propícia.

Per a progressar en el joc s'ha d'anar comprant *Edificis* o *Millores*.

Cada *Edifici* té:

- Un preu base per al 1r *edifici* i per cada nova compra augmenta el preu un 15%.
- Un *Cookies per Second*, **CpS**, base que augmenta amb *millores*, *Llet* o *prestigi*.
- Un tipus de *Iaia* associat que augmenta els CpS segons la quantitat de iaies que es tinga.
- Millores de diversos tipus: que dupliquen la producció, de *sinergia*, de *fortuna* i *celestials*.

La progressió és més ràpida amb la versió mòbil, ja que sempre que tornes a l'aplicació, aquesta independentment estiga en *backgroud* o no, en tornar et diu moltes galetes has guanyat en la teua absència, mentre que al tancar el navegador i tornar, no passa.

#### UI/UX

L'estil visual del joc és ximple. Els edificis, millores i icones tenen un estil píxel-art molt detallat.

La interfície està molt ben compartimentada en totes les seues versions, la distribució això sí es veu afectada segons en quina.

En les figures \ref{fig:cookie-pc} i \ref{fig:cookie-pc-esquema} es poden veure unes imatges de la interfície per a ordinador.


![Interfície d'usuari en ordinador. Font: Cookie Clicker](Memoria/Assets/AltresJocs/Cookie/CookieClicker-UI-PC.png){#fig:cookie-pc height=7cm}


![Esquema interfície d'usuari en ordinador de Cookie Clicker](Memoria/Assets/AltresJocs/Cookie/CookieClicker-UI-PC-Esquema.png){#fig:cookie-pc-esquema height=7cm}

En un monitor gran podem veure totes les seccions juntes. El detall en posar el ratolí damunt d'una millora o edifici es veu bé i la informació s'entén bé. Per altra banda, en un telèfon mòbil les seccions estan separades, el detall costa fer 1 clic i no et posa el percentatge de la producció com ho fa el navegador.

Es pot veure l'adaptació de la interfície en mòbil en les figures \ref{fig:cookie-mobil} i \ref{fig:cookie-mobil-esquema}.

![Interfície d'usuari en mòbil. Font: Cookie Clicker \label{fig:cookie-mobil}](Memoria/Assets/AltresJocs/Cookie/CookieClicker-UI-Mobile.png){height=8cm}


![Interfície d'usuari en mòbil \label{fig:cookie-mobil-esquema}](Memoria/Assets/AltresJocs/Cookie/CookieClicker-UI-Mobile-Esquema.png){height=8cm}

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

#### Música i so

El joc en la seua versió mòbil està carent de música de cap mena i de sons només hi ha de dues classes:

- El clic sobre la galeta.
- Els clics a botons de la interfície. No tots els botons sonen igual.

### [Push The Square](https://asdehielo.itch.io/push-the-square)

Joc indie desenvolupat per [Raúl Moreno Tamayo](https://asdehielo.itch.io) publicat a itch.io en 2021. Tracta que un misteriós quadrat ha aparegut en ta casa i no fa res a banda de girar en el sentit de els agulles del rellotge. Gastaràs tots els teus estalvis assegurant-te que gire [@PushSquare].

#### Mecàniques i progressió

Es juga donant clic als botons de la part inferior:

- **Work**: Guanyes diners que pots usar per a comprar millores.
- **Push**: espentes el quadrat. Quan completes una rotació muntarà el seu comptador corresponent.

Les **millores** que es poden adquirir ajuden a generar més diners, tant per clic com passivament, redueix la fricció en girar el quadrat, per tat anirà més de pressa, o s'afigen elements decoratius a la pantalla.

És un joc curt que es pot passar en menys de 10 minuts, no hi ha moltes millores i eventualment es generen diners i voltes molt ràpides sense esforç, ja que es pot deixar polsat el botó. El fet que siga curt no li lleva la gràcia, les millores són absurdes i es veu com la pantalla va omplint-se de ninots que fan una festa mentre es gira el quadrat. És un exemple absurdament condensat del gènere idle i funciona perfectament, fan ganes de jugar per a veure fins on arriba.

#### UI/UX

El joc té un estil píxel art senzill, com també una interfície simple amb la tenda a la dreta com *Cookie clicker*. En les millores que pots comprar hi ha una descripció del que fan.

No té versió mòbill com a tal, encara que es pot jugar en el navegador a itch.io amb el disposiu apaïsat.

![Pantalla del joc. Font: Push the Square](Memoria/Assets/AltresJocs/PushTheSquare/PushSquare-2.png){height=6cm}

Al clicar un botó, comprar una millora o guanyar diners sentirem un efecte sonor de l'acció. Quan es compra la millora de festa es pot sentir música dels altaveus que apareixen en l'escenari.

![Estadístiques. Font: *Push The Square*](Memoria/Assets/AltresJocs/PushTheSquare/PushSquare-1.png){height=6cm}

![Pantalla final. Font: Push The Square](Memoria/Assets/AltresJocs/PushTheSquare/PushSquare-Credits.png){height=6cm}

Al final el terra es trenca i es veu el quadrat flotar en l'espai en 3D mentre apareix el temps que s'ha tardat en passar-se el joc.

### Rythym Paradise

*Rhythm Paradise* és un videojoc musical, de ritme a l’estil Wario Ware, és a dir, com una sèrie de minijocs. Aquests videojocs posen a prova el sentit del ritme del jugador i normalment va lligat amb la memòria. D’aquest tipus, Nintendo compta amb predecessors com la sèrie *Guitar Hero*, *In the Groove* o *Rock Band*. I de la casa trobem *Donkey Konga*, *Elite Beats Agents* o *ElectroPlankton* entre altres.

El videojoc va ser llançat al Japó el 31 de juliol de l’any 2008 amb el nom de *Rhythm Tengoku Gold*, que vol dir *Rhythm Heaven Gold*. A la resta del món va ser comercialitzat en altres dates. A l’Amèrica del Nord el 5 d’abril del 2009, a Austràlia el 4 de juny amb el nom de *Rhythm Heaven*, i a Europa l’1 de maig del mateix any amb el nom de *Rhythm Paradise*, que és com s'anomenarà en aquest cas.

Molts d’aquests videojocs van de bracet amb una trama íntegrament musical o lligada a un instrument, cosa que *Rhythm Paradise* no. Incorpora la música com un acompanyant de l’acció del minijoc, com puga ser jugar al ping-pong o collir fruita.

El videojoc va ser llançat per a la Nintendo DS. El seu predecessor, *Rhythm Tengoku*, per a la Game Boy Advance i altres títols de la sèrie han sigut per a Wii o Wii U com la continuació *Rhythm Heaven Fever*. La presència del joc en diferents consoles que evolucionen amb el temps, és un indicatiu que les mecàniques es poden replicar en diferents contextos tecnològics.

Va tindre una gran rebuda, de totes les pàgines que puguem consultar de rànquings de videojocs, veurem que la seua nota sempre és un notable. Com ara a *Metacritic*, que té un 83 sobre 100, en *Famitsu* un 34/40 o 9 de 10 estrelles en *Wired*.

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

El videojoc planteja diferents espais, majorment bidimensionals, a excepció dels minijocs *A Escala*, *Peloteo Rítmico* i *Aerosurf*, que estan en 3D.

Fora de desplaçar-nos pel menú i les accions amb l’stylus que fan que el personatge del minijoc interactue no podem moure’ns. En aquest sentit, és un videojoc bastant estàtic.

Pel menú (una vegada ens passem els 15 primers minijocs) es pot lliscar cap avall i mostrarà 15 minijocs més per a jugar, i en superar-los es permetrà anar cap a l’esquerra o la dreta, on hi haurà 20 més en total.

![Vista de les dues pantalles de Rhythm Paradise. Font: Rhythm Paradise, GameCash.be @RPGameCash](Memoria/Assets/AltresJocs/RhythmParadise/RhythmParadise-Vista.jpg){height=5cm}

El jugador pot sentir-se absorbit pel joc, trobar-lo amé, divertir-se, ballar i taral·lejar amb les apegaloses melodies, però també pot arribar-se a frustrar si s’encalla amb un minijoc o no aconsegueix la puntuació màxima.

Segons passen els diferents nivells, seguir el ritme es complica una mica perquè s'hi introdueixen nous patrons de ritme i es juga amb la velocitat.

Perquè un jugador diga que s'ha “passat el joc”, a banda d’haver superat els 50 minijocs, es pot continuar perfeccionant puntuacions fins a tenir un **Genial** en cadascun i, per què no anar més lluny, un **Perfecte** en tots. Després ja no quedarà massa cosa per fer.

##### Menú

El menú del joc va estretament lligat amb el nostre progrés, segons avancem es modificarà. Apareixerà al centre un botó que ens permetrà moure’ns.

![Esquema menú del Rhythm Paradise](Memoria/Assets/AltresJocs/RhythmParadise/RhythmParadise-Menu.png){height=5cm}

1. La part verda té 15 minijocs, 5 per columna i n’hi ha 3. Anem del centre cap a dalt on el 5é minijoc de cada columna és un remix dels 4 anteriors.
2. Una vegada se supere l’anterior, es pot moure segons indiquen les fletxes blaves, es pot anar a la part blava. Passa com dalt, però al revés.
3. Superats els següents 15, es pot jugar el minijoc especial *Aerosurf* mentre apareixen els crèdits amb tots els personatges del joc. A continuació, es desbloqueja l’opció de moure’s com les fletxes taronja i s'afigen 20 minijocs que són les continuacions d’alguns dels jugats anteriorment (situats en la part groga, començant pel de l’esquerra i després el de la dreta).
4. Passats els 10 dels 20 que ens queden passem a jugar als minijocs de la part vermella.

A la barra central del menú veiem opcions com: la *Cafetería*, el *Medallero*, l'*Aerosurf* i la *Batalla de Bandes*.

##### Estètica visual

És un joc 2D (menys per alguns minijocs) on trobem dos estils: el de les portades i el dels propis minijocs.

Les **portades** tenen un estil més lliure, pot ser més geomètric, tenir diferents composicions, usar degradats... Mentre que els **jocs** tenen un *sprites* *cartoon* ximples, on el personatges i escenaris tenen unes línies i figures ben definides, acolorits segons la paleta del nivell.

Visualment és molt consistent, a pesar de tenir molts minijocs i cadascun anar de coses diferents, cadascun és fidel a la seua temàtica i encaixa en el conjunt.

S'exemplificarà a través de dos minijocs: *Aves Marciales* i *Remix 3*.

|                      | Aves Marciales                                                                     | Remix 3                                                                     |
| -------------------- | ---------------------------------------------------------------------------------- | --------------------------------------------------------------------------- |
| **Icona**            | ![](Memoria/Assets/AltresJocs/RhythmParadise/AvesMarciales-Icon.png)               | ![](Memoria/Assets/AltresJocs/RhythmParadise/Remix3-Icon.png)               |
| **Pantalla Inicial** | ![](Memoria/Assets/AltresJocs/RhythmParadise/AvesMarciales-Inici.png){height=4cm}  | ![](Memoria/Assets/AltresJocs/RhythmParadise/Remix3-Inici.png){height=4cm}  |
| **Paleta de colors** | ![](Memoria/Assets/AltresJocs/RhythmParadise/AvesMarciales-Paleta.png){height=3cm} | ![](Memoria/Assets/AltresJocs/RhythmParadise/Remix3-Paleta.png){height=3cm} |
| **Joc**              | ![](Memoria/Assets/AltresJocs/RhythmParadise/AvesMarciales-Joc.png){height=4cm}    | ![](Memoria/Assets/AltresJocs/RhythmParadise/Remix3-Joc.png){height=4cm}    |
: Comparació visual entre un minijoc normal i un remix en Rhythm Paradise. Font de les imatges: Rhythm Paradise

Pel que fa a les paletes, son de colors vius i funcionen bé en l'estètica del nivell, en aquestos casos verds per a simular l'entrenament militar de les aus i morats seductors dues execucions pensades per al mateix estil: un tango.

Els *Remix* com tornem a veure les escenes dels minijocs que en formen part i escoltem les seues músiques, l'estil de cada aparició s'integra en l'estètica comuna. En el cas d'aquest 3r, tenen una estètica tradicional japonesa on veurem personatges amb kimono i flors de cirerer, mentre els personatges es mouen al ritme de la música tenyits dels colors morats i grocs.

Cal destacar també que com el joc és per a la Nintendo, l'acció es veu en la pantalla superior de la consola i el jugador interacciona en la inferior, la tàctil. En aquesta última només veurem un punter redó al tocar la pantalla amb l'stylus amb els colors de la paleta del nivell.

#### Música i so

Tractant-se d'un joc de ritme, la música té un paper fonamental. Les peces, repartides entre els minijocs, han de ser d'una longitud similar, atractives a l'oïda i tenir alguna dificultat rítmica que les faça un repte. Sense deixar de costat que han de ser diferents i originals per a no tenir la sensació d'estar jugant tota l'estona la mateixa música.

Hi ha minijocs on hi ha una cançó amb lletra i d'altres que no. Segons el que s'estiga percutint el disseny sonor s'adapta, per exemple en *Peloteo Rítmico*, la pilota de ping-pong sona com una de veritat quan la veus rebotar o la colpeges.

Com analitzar-les totes és molt extens, només destacaré el minijocs analitzats anteriorment: *Aves Marciales* i *Remix 3*. La particularitat dels *Remix*, com el seu nom indica, són un nivell on trobem els motius rítmics i música dels minijocs de la seua columna d'una manera que tenen una instrumentació i estètica diferent i uniforme.

##### Aves Marciales

La cançó d’aquest minijoc és un **tango**. Com a tal, es poden identificar alguns instruments que sonen, com un acordió, violins, una caixa, postisses i un contrabaix (o bé podria ser un baix elèctric), entre altres.

Està en **Re m**. Té una estructura A-B-A'-coda més una petita introducció (taronja). Cada secció està dividida en dues frases (rosa) i estan unides per un pont (verd). En vermell estan els graus d’alguns dels acords. En la secció B modula de tonalitat veïna Sol m, però després torna.

Té un ritme molt marcat i moltes síncopes, pròpies del tango.

S'ha fet una petita anàlisi sobre una partitura:

![Anàlisi propi de la partitura de *Aves Marciales*. Font: Musescore.com, @musescoreBlueBirdsRhythm](Memoria/Assets/AltresJocs/RhythmParadise/RhythmParadise-Partitura-Aves.jpeg){height=8cm}

##### Remix 3

La presentació de la pantalla d’inici dels *Remix* està fet a l’estil 8 bit. La cançó en si és una **barreja d’estils** com puga ser tango, jazz, copla o folk.

Se Senten trompetes, un saxo, una carraca, un cencerro, plats, piano, flautes… el que podria ser una mena de big band.

La cançó està en subdivisió ternària. Es tracta d’un 6 per 8 i està en **La m**.

Es senten dues parts separades d’un pont. Una possible estructura seria A-B-pont-B'-A.

En la primera part escoltem la trompeta acompanyada del que podria ser la big band, després dona pas al solo de saxo mentre el jugador fa tresillos.

A continuació hi ha un pont on sonen els vents fusta que ens tornen a dur al la part de saxo. Acaba en el tema principal i la tornada de la trompeta.

O podriem interpretar-ho com a A-B-A' i on abans havia distingit en A i B fer que siguen frases diferents.

De tota manera tant la part de trompeta  o de saxo estan en La m, al canvi al vent fusta es produeix una modulació a la dominant, Mi m. Després torna a la tònica i acaba.