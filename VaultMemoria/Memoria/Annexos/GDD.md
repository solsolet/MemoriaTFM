---
created: 2026-06-23 00:31
last_reviewed: 2026-06-23
state: "In Progress"
---
# GDD: Pianissimo {#gdd}

## Historial de versions

| Versió | Data       | Descripció dels canvis          |
| :----- | :--------- | :------------------------------ |
| v0.1.0 | 2026-06-23 | Creació inicial del document    |
| v0.2.0 | 2026-08-15 | Mig afegides funcionalitats It2 |
| v0.3.0 | 2026-08-30 | Afegir secció crèdits           |
| v0.4.0 | 2026-09-14 | Versió final per a l'entrega    |

## Introducció

Aquest document especifica el disseny per al joc amb el nom provisional de “Pianissimo”. Està basat en les idees reflectides en el *One-Sheet* i el *Ten-Pager* del mateix joc. La idea es remunta al 14 de gener de l'any 2026 a les mans de Gemma Sellés Lloret per a l'elaboració del seu TFM.

### Destinataris
Aquest document té la intenció de ser llegit per tota aquella persona que estiguen involucrades en el disseny, implementació o proves del videojoc, com poden ser programadors, artistes... O per aquells que tinguen la curiositat de veure com s'ha fet i desenvolupat aquest projecte.

## Màquina objectiu

*Pianissimo* és un videojoc per a dispositius mòbils, per tant, ha de funcionar per a aquests, això inclou tauletes i telèfons mòbils. Es pot veure el llistat de dispositius on s'ha provat a la [metodologia](#sec-metodologia-dispositius).

### Plataformes

Estarà disponible per a dispositius Android i iOS. Es pot descarregar des de la mateixa botiga d'aplicacions o amb els enllaços de proves internes.

### Edat i públic objectiu

Per a totes les edats, orientat tant per a gent que li calga concentrar-se com per a matar el temps. Pel seu component musical també va orientat a tot aquell músic que el vulga fer servir en els seus assajos.

### Qualificació d'edat

Sense restricció d'edat, seria per a tots els públics, però tractaria que s'usara a partir d'una edat on puguen usar telèfon i relacionar-se amb la tecnologia amb seguretat i maduresa, pot ser a partir de dotze anys.

## Descripció del joc

### Resum de la història del joc

POV: eres un jove pianista estudiant del conservatori i t'has d'aplicar per als exàmens finals. Durant el curs has estat treballant prou, però has d'esforçar-te més si vols superar el *tribunal*. Pots elegir dues vies per a aconseguir-ho:

- Tenir un ritme de faena constant, treballar en sessions de treball controlades, mesurar el teu progrés... diguem que estaràs mode **concentració**. A canvi obtindràs millors resultats i recompenses.
- O bé apostar per la màgia i la fantasia i que el temps ho solucione tot amb el mode **idle**. Segons la teua sort i decisions aconseguiràs millores per a continuar avançant.

### Flux del joc

Pel joc es pot navegar entre les diferents escenes. Podem veure-ho en forma d'esquema a la figura \ref{fig:flux-pianissimo}.

![Flux de Pianissimo exemplificat amb les pantalles \label{fig:flux-pianissimo}](Memoria/Assets/Pianissimo/GDD/Flux-pianissimo.png)

#### Idle

- Jugues tocant tecles que apareixen amb la música.
- Guanyes punts.
- Pots consumir-los intercanviant-los per:
	- *Millores* que es poden fer guanyar punts més ràpidament.
	- Desbloquejar habilitats, *estadístiques*, que milloren la teua partida.
- Torna a començar.

#### Assaig (concentració)

- Configures una sessió d'assaig amb títol, descripció, temps dedicat, mode de l'assaig (restrictiu o permissiu) i etiquetes.
- Fas la sessió:
	- En cas de completar-la guanyes una recompensa, notes per al mode *idle* i una nova carta.
	- En cas de no completar-la, ja siga eixint de l'aplicació quan no toca o cancel·lar-la, no guanyes res i tampoc tens cap penalització.
- Pot veure els assajos en el *diari d'assajos*.

#### Altres

- **Configuració**: pots canviar els paràmetres per tal d'ajustar el so, reiniciar el joc, posar o llevar notificacions o veure els crèdits.
- **Perfil**: pots veure les estadístiques del jugador com també els assoliments.
- **Àlbum**: pots veure les cartes que vas guanyant durant el joc, per muntar de nivell o per completar un assaig.

### El personatge

Jove androgin amb els cabells punxeguts i magenta amb un aspecte 2D de dibuix animat. El teu paper com a jugador és encarnar-lo, no el controles tu. Només saps d'ell a través dels tutorials i històries.

#### Història de fons i relació amb el *gameplay*

Vols entrar al superior de piano i, per tant, s'ha d'esforçar en aquests últims anys de conservatori per a arribar preparat. Per aquests motius té tant d'interés i està una mica desesperat en intentar-ho tot per a poder aplicar-se i millorar les seues habilitats amb el seu instrument.

#### Habilitats

El jugador de base tindrà unes *estadístiques* que podrà a mesura que vaja jugant en un mode o altre millorar. Entre elles tindrem:

- **Velocitat**: com pots arribar de ràpid a tocar les notes.
- **Precisió**: quina certesa tens a l'hora de tocar bé les notes.
- **Tècnica**: com de bé pots interpretar una obra. No només es tracta de polsar notes sinó d'encertar també l'articulació i la sonoritat.
- **Teclat**: grandària màxima del teclat. Es comença en un nombre de tecles delimitat, per tants els punts que li pugues traure seran també limitats.

A banda de les estadístiques, el jugador tindrà un *nivell* on segons vages guanyant punts d'experiència anirà augmentant. Aquesta pujada implicarà poder desbloquejar noves habilitats, *millores*, peces que estudiar...

## *Gameplay*

### Gènere del joc

Pianissimo és una barreja entre els gèneres *Idle*, musical, casual i de productivitat.

### Capítols o fases de la història

Segons el nivell del jugador tindrem les següents fases, *èpoques*:

- Barroc
- Classicisme
- Romanticisme
- Impressionisme
- Segle XX

Es repartira el nombre de **nivells** totals entre aquesta quantitat d'èpoques. De moment es compta amb 10 nivells, per tant, 2 nivells per fase. Cada fase suposa un assoliment i cada nivell t'atorga una nova cançó de fons en el mode *idle*.

### Mecàniques

Totes les mecàniques són usant la pantalla tàctil del mòbil fent *tap*. És tan fàcil de controlar que es pot jugar amb una sola mà. Amb el *tap* podem:

- Tocar tecles per a guanyar notes.
- Comprar *millores* i *estadístiques*.
- Veure el detall d'una millora o estadística concreta.
- Assajar per tal de guanyar més notes.
- Veure cartes desbloquejades a l'àlbum.
- Esperar.

Les **notes** fan de moneda en el joc i es poden obtindre jugant, és la *moneda blana*.

Les **millores** i **estadístiques** es poden comprar amb notes. Cadascuna té un *preu* i un nivell associat. Quan en compren una el seu preu incrementa segons el *cost* que tinga establit, les millors de cada classe seran més cares i el seu preu muntarà més ràpidament a canvi d'un benefici major.

Aquesta progressió és pròpia dels *idles*, m'hi he fixat sobretot al *Cookie Clicker*. L'espera és clau, arriba un punt on comprar la millora d'*autotap* fa que les notes es guanyen soles i ja arriba on l'usuari només ha de gestionar què comprar.

Per motivar a l'usuari a assajar, o siga dedicar el seu temps a concentrar-se, s'ha pensat l'estratègia per ludificar de donar *recompenses* en complir un objectiu, de manera que l'usuari es veja motivat per a seguir.

Les recompenses donen notes segons una base establerta i se li suma una part variable en funció del temps que fa l'usuari. S'ha inspirat en *Forest*. I a més també es desbloquejarà una carta a l'*àlbum*, un element de col·leccionisme.

Les **cartes** només es poden desbloquejar fent assajos o muntant de nivell.

### Elements propis de la plataforma

Per tal d'aprofitar les característiques pròpies dels mòbils, i amb l'avantatge de tenir-lo sempre a mà, s'ha pensat a usar:

- Notificacions.
- Detecció del cicle de vida de l'aplicació (p. ex.: detecta si te n'ixes en el mode concentració).
- Disseny adaptable per a qualsevol telèfon o tauleta.
- Inici de sessió amb *GPS* o *game center* segons la plataforma, cosa que permet tenir un registre de la teua activitat en les botigues com també assoliments per a desbloquejar.

### Escena d'obertura

Com si es tractara d'una pàgina de còmic, apareixen vinyetes de l'estressant situació del jugador. Quan el jugador entra per primera vegada es troba una mena de **tutorial** informatiu de l'aplicació com es pot veure a la figura \ref{fig:TutoApp}.

![Tutorial que se li mostra a l'usuari només obrir Pianissimo \label{fig:TutoApp}](Memoria/Assets/Pianissimo/GDD/TutoApp.png){height=10cm}

L'escena es podria saltar mitjançant un botó que ho permetera que et portaria directament a la pantalla d'inici.

Per al mode *idle* i assaig també compte amb els seus respectius tutorials. Es poden veure a les figures \ref{fig:TutoGame} i \ref{fig:TutoFocus}.

![Tutorial de Game \label{fig:TutoGame}](Memoria/Assets/Pianissimo/GDD/TutoGame.png)

![Tutorial d'Assaig \label{fig:TutoFocus}](Memoria/Assets/Pianissimo/GDD/TutoFocus.png){height=7cm}

## Implementació Godot
### *Autoloads*

Els *autoloads* s'han utilitzat per als *managers* que necessitava el joc com a *Singleton*. Per a fer-ho s'ha creat una carpeta `autoloads` on se situen tots i per a carregar-los com a tal en el projecte es fa: `Project > Globals > Autoload`.

Es poden ordenar segons la prioritat. En el cas de Pianissimo és de vital importància que primer carreguen les dades tant de la Configuració com del jugador, ja que depenen d'elles altres *managers*. Les dependències fan que l'ordre dels *Autoloads* importe, si no donaria un error.

![Autoloads en el projecte de Godot](Memoria/Assets/Pianissimo/It2/Pianissimo_Autoloads_It2.png)

Evitar posar en els scripts `class_name`, car que dona error també, entra en conflicte amb la naturalesa dels *Autoloads* de tenir una única instància.

### Comunicació entre classes

Mentre els autoloads estan disponibles per a totes les classes en tot moment, hi ha d'altres que per a comunicar-se usen **signals**. Aquests senyals avisen d'esdeveniments com `notes_changed` i els altres *managers* estan pendents, l'emissor no sap qui està escoltant. Per exemple en diferents parts del codi veurem:

```gdscript
# En una classe declarem
signal notes_changed(new_value: int)
## Disparem el senyal quan passe alguna cosa
notes_changed.emit(SaveManager.data.notes)

# En una altra classe hi reaccionem
Economy.notes_changed.connect(_on_notes_changed)
```

L'avantatge una vegada més és el **desacoblament**. La idea darrere dels senyals m'ha resultat curiosa perquè no atén de classes públiques o privades, els és irrellevant, el que importa és el *node* que llança el senyal i si hi ha algú que l'escolta es farà alguna cosa.

### Internacionalització {#gdd-internacionalitzacio}

Una bona pràctica per a fer que el joc arribe a més gent és tenir-lo disponible en diversos idiomes. En Godot es pot aconseguir de manera senzilla amb un CSV.

En aquest fitxer s'ha de declarar en la primera fila les llengües que tindrà, en aquest cas català, espanyol i anglés i si en un futur se'n volguera afegir més, seria possible.

> El terme **i18n** correspon a *internacionalization* on la `i` i la `n` són la primera i última lletra de la paraula i `18` el nombre de caràcters que hi ha entre elles. És un numerònim per descriure el procés de dissenyar i preparar una aplicació de programari perquè suporte diferents idiomes.

Pel que fa al d'aquest projecte el document es troba en `assets\i18n\translations.csv` i té aquest aspecte:

```CSV
keys,ca,es,en
GAME_TITLE,Pianissimo,Pianissimo,Pianissimo
HOME_IDLE,Idle,Idle,Idle
HOME_FOCUS,Focus,Focus,Focus
```

Perquè funcione les traduccions en Godot has d'importar el CSV i després en `Project > Project Settings > Localization > Translations` el pots afegir i el detectarà com correspon. Es veurà com genera un document `.translation` per cada llengua del CSV. Una vegada fet aquest pas, qualsevol canvi en el CSV el reflectirà en els `.translation` i podràs usar les claus de cada cadena per a situar-ho en qualsevol camp de text, com etiquetes o botons.

Per a assegurar-se que no falla la traducció de la clau per la cadena en l'idioma corresponent, a l'Inspector de l'element en qüestió, s'ha de baixar fins a `Node > Auto translate > Mode` i posar-lo a *always*.

Hi ha moltes opcions d'internacionalització, però per a un projecte senzill no cal massa més coses. Es pot ampliar la informació consultant la documentació oficial de Godot en aquesta matèria: https://docs.godotengine.org/en/stable/tutorials/i18n/internationalizing_games.html

Per a les cadenes de text posades directament al codi s'ha usat `tr(cadena)` i Godot les substitueix correctament.

### Persistència

El joc necessita persistència per a dades que han de quedar entre partides. Aquestes necessiten ser recursos que es puguen llegir i escriure en la memòria del dispositiu. S'ha de guardar:

- El **progrés** del jugador, com a *recurs propi*, guardat en `user://player_save.tres`. Es controlarà amb `save_manager.gd`, i les dades a guardar les definirà `player_save_data.gd`.
- La **configuració**, com a *ConfigFile*, guardada en `user://settings.cfg`. Es controlarà amb `settings_manager.gd`.

En els dos casos trobem funcions públiques de guardar i carregar les dades, `save_data()` i `load_data()`, que usen els corresponents mètodes de cada tipus d'arxiu i fan comprovacions de la ruta. En el cas del progrés també es guarda el moment quan es va modificar l'arxiu per a poder calcular quantes notes s'han generat en l'absència del jugador.

Exemple del codi de `save_manager.gd`:

```gd
func load_data() -> void:
	if ResourceLoader.exists(SAVE_PATH):
		var loaded = ResourceLoader.load(SAVE_PATH, "", 
			ResourceLoader.CACHE_MODE_IGNORE)
		data = loaded if loaded is PlayerSaveData else PlayerSaveData.new()
	else:
		# Primera partida
		data = PlayerSaveData.new()
		data.last_save_time = int(Time.get_unix_time_from_system())

func save_data() -> void:
	data.last_save_time = int(Time.get_unix_time_from_system())
	var err := ResourceSaver.save(data, SAVE_PATH)
	if err != OK:
		push_warning("SaveManager: save failed (error %d)" % err)
```

El progrés també ha de ser capaç de reiniciar-se en cas que el jugador ho necessite sense desinstal·lar-se el joc. Per a fer-ho s'usa la funció `reset_data()` que crea un nou *PlayerSaveData* i guardar-lo en lloc de què teníem, com a tal no esborra res, sobreescriu.

Una altra característica de la persistència és que les dades que es guarden per l'**ID**, no per referències, si no ho férem així tindríem un grau alt d'acoblament als recursos.

### Piano

El piano té 4 parts mòbils:

1. **`NOTE_SEQUENCE`.** Quina nota és el carril N": `["C", "C#", "D", "D#", "E", ...]`. `_is_black_key(i)` comprova quina `NOTE_SEQUENCE[i]` acaba en `#` per decidir el color de la tecla.
2. **`_build_keys()` reconstrueix cada botó de 0.** Llig `current_lane_count()` (que és `StatManager.get_level("keyboard") + 3`, màxim 12), i itera creant `Button.new()` per carril, aplicant l'estil de tecla negra si `_is_black_key()` ho diu i  `button.pressed.connect(handle_key_input.bind(i))`. `bind(i)` Encapsula específicament un carril en un botó en concret, p. ex. el botó 4 qcridaràsempre a  `handle_key_input(4)` independentment si després es creen més tecles.
3. **`_layout_keys()` geometria.** Separa les tecles en "blanques" (dividides a parts iguals segons l'amplària) i "negres" (la meitat d'amples i col·locades entre dues blanques quan corresponga, `move_to_front()`per a dibuixar-se al davant). Es fa separat de  `_build_keys()` a postes: el *layout* necessita tornar a executar-se quan la pantalla es canvia de mida (`key_row.resized.connect(_layout_keys)`), però reconstruir els nodes dels botons només necessita que ocórrega quan canvia el nombre de carrils.
4. **Disparador.** `StatManager.stat_purchased` és un *signal*; `piano.gd` l'escolta i crida a  `_build_keys()` només quan compra l'ID `"keyboard"`. La resta (*spawning*, detecció de tap, puntuació) ni coneix ni li importa que canvie el nombre de tecles, només mira pel nombre de botons en `key_buttons`.

## UI/UX

### Tema personalitzat

L'estètica de Pianissimo vol imitar als colors vius i alegres de *Rhythm Paradise* de la DS com també el seu estil *cartoon* 2D, de contorns gruixuts i foscos. Els personatges i objectes son poc seriosos i tenen un aspecte divertit. Aquesta serà la mentalitat per dissenyar. Es pot veure l'aspecte general de l'aplicació a la figura \ref{fig:pianissimo-it7}

![Aspecte final de Pianissimo \label{fig:pianissimo-it7}](Memoria/Assets/Pianissimo/It7/pianissimo_it7.png)

El fet que el joc siga musical està relacionada en l'ambient de conservatori i l'època musical en què ens trobem segons el nivell.

![Paleta de colors de Pianissimo](Memoria/Assets/Pianissimo/pianissimo_paleta.png){height=3cm}

Tots els gràfics s'han fet amb *Affinity*, la majoria amb l'espai de treball de *Vectors*. Resulta més còmode a l'hora de fer formats que puguen variar de mida encara que té el desavantatge que els faig més lentament.

No estic tan acostumada a la ferramenta *ploma* d'aquest programa com d'altres, com puga ser *Photoshop*, però com no disposava d'ell en el Mac s'ha optat per usar un programa gratuït i multiplataforma com *Affinity*.

#### Tipografia

S'ha usat dues tipografies per al projecte:

- [**Sebastian**](https://github.com/fkretlow/sebastian): per a la `P` de la icona de l'aplicació i del logo. Només la *p*. Aquesta tipografia té només caràcters musicals, per tant, com ja tenia la *p* de la dinàmica pianissimo era perfecta.
- [**Note Serif**](https://github.com/notofonts/notofonts.github.io/tree/main/fonts/NotoSerif/googlefonts): per a la resta d'aplicació i “ianissimo” del logo.

Totes dues s'han escollit a més per ser de codi obert i lliure ús.

#### Implementació Godot

Per a implementar-lo a Godot en la carpeta `ui` es va crear un arxiu de tipus *Resource* del tipus *Theme*. Per a fer-lo global s'ha d'entrar a *Project Settings* i en `General > GUI > Theme > Custom` i posar el nostre arxiu. D'aquesta manera el joc agafarà tot l'estil que tinga l'arxiu i el col·locarà per defecte.

`main_theme.tres` és el nom del meu **tema** i he personalitzat tot el que es veu al joc: botons, etiquetes, *sliders*...

Quan un element genèric no és suficient i vols diferents tipus es poden fer **variacions del tema**. Per a *Pianissimo* on més subtemes he creat ha sigut per als botons, ja que per exemple, les tecles són botons en un tema i mides personalitzades.

Per a posar aquestes variacions, en l'Inspector hem d'anar a `Theme > Type variation` i si tens un tema alternatiu, et deixa seleccionar-lo d'una llista.

![Menú de tema de Godot](Memoria/Assets/Pianissimo/It7/godot-theme-edit.png)

A banda de la implementació en general, per a l'aspecte de *Pianissimo* i que fora coherent en diferents mides de pantalles, s'ha tingut cura de respectar les *safe area* del dispositiu i de guardar un marge respecte a les vores de la pantalla. Aquesta funcionalitat s'ha implementat als *MarginContainers* que tenen quasi totes les escenes associades al codi de `safe_area_container.gd`.

### Experiència del joc

La sensació a transmetre és de diversió, absurditat, ganes d'anar conquerint objectius. No té per què ser un joc addictiu, de fet els *idles* per molt que ho siguen ho són al principi i després es tornen una carrera de fons. Tampoc és la intenció que es torne addictiu, recordem que una de les mecàniques és **esperar** i és per això que s'ha pensat que combinar-ho amb una part de productivitat és aprofitar-la.

Per a gent casual, pot ser un bon joc durant un temps. Per als jugadors que els agrade passar-se tot el joc i obtenir tots els assoliments té molt contingut per a anar torbant-se. I per a la gent que busque la part de seguiment de tasques en una mica de ludificació també li farà paper.


## So

Per a Pianissimo era molt important que tinguera so en tenir una estètica musical. Per a implementar-lo s'ha fet un `AudioManager`, un *autoload* que controlava tots els esdeveniments sonors i que qualsevol classe del codi poguera cridar a les seues funcions, ja que totes, d'una manera o una altra, emetien so en algun moment.

Aquest *manager* comptava en una *pool* de 8 sons per als SFX i un reproductor per a la música on al codi es creaven *busos* per a poder-los reproduir.

Els sons es troben a `assets/sound/sfx` i `music` respectivament. 

### Disseny sonor

El joc en tenir un component pianístic es necessitaran sons adients a aquesta estètica. Tots els àudios que s'han utilitzat estan sota la llicència CC0 o són de domini públic, trets de *Freesound* o *MusOpen*. Per tal d'organitzar-los tots junts s'han disposat en forma de taula:

| Nom         | Descripció                                                                      | Àudio                                        |
| ----------- | ------------------------------------------------------------------------------- | -------------------------------------------- |
| Clic        | Menys les tecles, la resta faran aquest so en polsar-los                        | [clic1.wav](https://freesound.org/s/751232/) |
| Notes piano | Cada tecla del piano fa el corresponent so, el nom de la pista és el de la nota | C4.wav, C#4.wav, [...], B4.wav               |
: Efectes de so de Pianissimo

La música que sone de fons serà acorde a les èpoques desbloquejades en el nivell corresponent interpretades per un piano.

| Nom                                     | Descripció                                                                                                                                                        | Compositor                                               |
| --------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------- |
| [Menú](https://freesound.org/s/621130/) | Música que sona de fons en *home*                                                                                                                                 | [mikewhite12](https://freesound.org/people/mikewhite12/) |
| Barroc1                                 | [Preludi en Dm](https://musopen.org/music/43466-the-well-tempered-clavier-book-i-bwv-846-869/)                                                                    | J. S. Bach                                               |
| Barroc2                                 | [Fuga en Do m](https://musopen.org/music/43466-the-well-tempered-clavier-book-i-bwv-846-869/)                                                                     | J. S. Bach                                               |
| Classicisme1                            | [Sonanta no.1 Fm, Op.2 no. 1 I](https://musopen.org/music/26-piano-sonata-no-1-in-f-minor-op-2-no-1/)                                                             | Beethoven                                                |
| Classicisme2                            | [Sonanta no.1 Fm, Op.2 no. 1 III](https://musopen.org/music/26-piano-sonata-no-1-in-f-minor-op-2-no-1/)                                                           | Beethoven                                                |
| Romanticisme1                           | [Etude Op.10, no.9 Fm](https://musopen.org/music/610-etudes-op-10/)                                                                                               | Chopin                                                   |
| Romanticisme2                           | [Barcarolle No. 1 Am, Op.26 I](https://musopen.org/music/485-barcarolle-no-1-op-26/)                                                                              | Fauré                                                    |
| Impressionisme1                         | [Gymnopédie No. 1](https://musopen.org/music/8010-3-gymnopedies/)                                                                                                 | Satie                                                    |
| Impressionisme2                         | [La fille aux chaveux de lin](https://imslp.eu/files/imglnks/euimg/7/73/IMSLP704772-PMLP2394-No.8._La_fille_aux_cheveux_de_lin_(A_moça_dos_cabelos_de_linho).mp3) | Debussy                                                  |
: Música de Pianissimo

El fet d'usar música clàssica, a banda de l'estètica, rau en el fet que les obres de piano pensades no tenen copyright, encara que les gravacions sí. Per tant, trobar interpretacions de lliure accés no és molt complicat i en cas de no trobar-ne amb qualsevol editor de partitures pots exportar l'àudio d'una en concret.

A excepció de la cançó del menú la resta les he tocades totes durant la meua etapa al conservatori. Moltes obres són la mateixa, però diferents moviments, com és el cas de la fuga i preludi i de la sonata.

## Integració segons SO

Com el joc està pensat per a iOS i Android hi ha funcionalitats que s'han d'adaptar segons el SO i la seua botiga d'aplicacions.

### Assoliments

Fem una façana per a usar per sobre d'Android o iOS i després per cada SO un back-end específic. 

S'ha usat els connectors oficials de Godot de `google-play-services` i `gamecenter` 

Els assoliments en el projecte es troben com a recursos personalitzats `.tres` definits per `achievementDefinition` on inclouen diferents variables per a cadascun.

| ID                    | Títol           | Descripció                    | ID Android             | ID iOS              |
| --------------------- | --------------- | ----------------------------- | ---------------------- | ------------------- |
| `notes_1000`          | Getting Started | Earn 1,000 notes in total     | <br>CgkInrHOzokbEAIQAg | notes_1000          |
| `upgrade_level_10`    | Dedicated       | Reach level 10 on any upgrade | <br>CgkInrHOzokbEAIQBQ | upgrade_level_10    |
| `stat_level_10`       | Disciplined     | Reach level 10 on any stat    | CgkInrHOzokbEAIQBg     | stat_level_10       |
: Assoliments implementats en Pianissimo

S'ha creat una imatge diferent per a cada assoliment no per decisió pròpia si no per què la Play Store ho exigeix i, ja que estava li dona una miqueta més de personalitat. Com s'ha fet a faena l'App Store també es beneficia de la diversitat de caràtules.

Hi ha més assoliments implementats, en lloc de posar-los en la taula, per tal de no avorrir els podem classificar segons com s'obtenen:

- **Cartes**: all_cards, ten_cards.
- **Stats**: all_stats_maxed, first_stat_purchased, velocity_maxed, keyboard_maxed, precision_maxed, technique_maxed, stat_level_10.
- **Upgrades**: first_upgrade_purchased, upgrade_level_10.
- **Level**: baroque_master, classicism_master, romanticism_master, impressionism_master, xx_century_master.
- **Practise**: first_focus_session, first_strict_session, focus_streak_3, focus_streak_10, hour_in_a_day, hundred_sessions, session_10min, ten_hours_in_a_week.
- **Game**: notes_1000.

### Notificacions

Pianissimo compta amb notificacions gràcies al connector `Notification Scheduler Plugin`. Per incorporar-lo al projecte es va posar la part d'Android a la carpeta d'`addons` i la d'iOS a `iOS/plugins`. S'hi pot veure a l'aplicació en la figura \ref{fig:pianissimo-notification}.

Al joc el seu control el té *NotificationManager*, un *autoload*, que el codi és senzill:

1. S'inicialitza el *scheduler*, es comprova el permís de l'aplicació de les notificacions.
2. Una vegada inicialitzat es crea un canal de notificacions i l'establim.
3. S'estableix el recordatori: s'elegeix el canal, títol, descripció, icona i el temps que tarda.

## Recursos

El joc està molt orientat en les dades i els recursos. Les *millores*, *estadístiques*, *cartes*, *assoliments*, *nivells*, *tutorials* i les dades de la partida són un subtipus de **Resource** diferent que té la seua pròpia definició:

```gdscript
extends Resource
class_name nom_del_recurs
```

Aquests tenen les seues variables i els podem *instanciar* en arxius `.tres`. Els troben a la carpeta `data` i la seua definició a `resources`. Les instàncies s'han clavat a una escena *manager* referenciats amb `@export Array[tipus_recurs]`, per això hi ha autoloads que són escenes amb codi associat en lloc de ser només un *script*.

Tots els recursos compten amb un ID, pel que s'ha comentat abans en l'apartat de persistència.

### Àlbum de cartes {#gdd-album-cartes}

Quan es completa un assaig hi ha una recompensa en forma de carta que es poden visualitzar en l'escena d'**àlbum**. De moment hi ha 3 tipus de cartes:

- **COMPOSER**: on apareixeran compositors famosos de totes les èpoques.
- **INSTRUMENT**: instruments de la família dels teclats al llard de la història, es podria ampliar a altres tipus d'instruments.
- **FACT**: dades o curiositats musicals que tinguen a veure en les diferents èpoques, tècnica, obres en concret... És una categoria general.

| ID               | Nom                       | Categoria  | Descripció                                                                                           |
| ---------------- | ------------------------- | ---------- | ---------------------------------------------------------------------------------------------------- |
| bach             | J. S. Bach                | Compositor | Baroque composer and organist, famed for intricate counterpoint like The Well-Tempered Clavier.      |
| mozart           | W. A. Mozart              | Compositor | Classical-era prodigy who composed symphonies and operas from childhood.                             |
| chopin           | Frédéric Chopin           | Compositor | Romantic-era composer who wrote almost exclusively for solo piano.                                   |
| piano_instrument | The Piano                 | Instrument | Invented around 1700, it can play both loud and soft — hence its original name, "pianoforte".        |
| harpichord       | Harpsichord               | Instrument | A piano ancestor that plucks its strings rather than striking them, giving it a brighter tone.       |
| wtc_fact         | The Well-Tempered Clavier | Dada       | A landmark collection covering every major and minor key, still used to teach piano technique today. |
: Recursos tipus carta implementats a Pianissimo

Com s'ha fet en els assoliments, agruparé per tipus de carta i no fer la taula més llarga:

- **Compositor**: Beethoven, Hanon, Burgmuller, Czerny.
- **Intrument**: organ, celesta.
- **Dada**: barroc, classicisme, romanticisme, impressionisme, segle XX.

### Icones UI

Les icones que contenen alguns elements `Button` o `Label` contenen icones per a representar el seu significat. Totes les icones estaran en format SVG, ja que Godot pot importar i rasteritzar aquest format. Els dissenys en SVG garanteixen que sempre es veuran nítids sense importar la resolució i l'aplicació serà més lleugera.

| Nom         | Ús                                                   |
| ----------- | ---------------------------------------------------- |
| **left_arrow**  | Botó en `game` de tornar arrere                      |
| **right_arrow** | Botó en `game` d'anar cap endavant                   |
| **settings**    | Botó en `game` d'anar a la configuració              |
| **corchea**     | Label comptador de notes                             |
| **auriculars**  | Botó en `focus_session` per a activar música de fons |
| **cercle**      | *Tag* per a `focus_setup` que canvia de color        |
: Icones que s'han usat per a alguns elements de la UI de Pianissimo

Les icones són d'elaboració pròpia i s'han elaborat també amb Affinity.