---
created: 2026-06-23 00:31
last_reviewed: 2026-06-23
state: "In Progress"
---

# GDD - Pianissimo {#gdd}

%%TODO : Açò aniria en una portada d'alguna manera%%

Títol: Pianissimo (fins que trobe un altre)
*Tag line*: piano piano piano (?)
Fet per Gemma Sellés Lloret aka solsolet
Última revisió agost 2026.

## Historial de versions

| Versió | Data       | Descripció dels canvis          |
| :----- | :--------- | :------------------------------ |
| v0.1.0 | 2026-06-23 | Creació inicial del document    |
| v0.2.0 | 2026-08-15 | Mig afegides funcionalitats It2 |
| v0.3.0 | 2026-08-30 | Afegir secció crèdits           |
| v0.4.0 | 2026-09-14 | Versió final per a l'entrega    |

***

## Introducció

Aquest document especifica el disseny per al joc amb el nom provisional de "Pianissimo". Està basat en les idees reflectides en el One-Sheet i el Ten-Pager del mateix joc. La idea es remunta al 14 de gener de l'any 2026 a les mans de Gemma Sellés Lloret per a l'elaboració del seu TFM.

### Destinataris
Aquest document té la intenció de ser llegit per tota aquella persona que estiguen involucrades en el disseny, implementació o proves del videojoc, com poden ser programadors, artistes... O per aquells que tinguen la curiositat de veure com s'ha fet i desenvolupat aquest projecte.

### Estil

El text d'aquest document s'escriurà en 3a persona. En casos de diàlegs de la trama o que es necessite un altre estil es canviarà segons la situació.

Es farà ús de la *cursiva* quan es nomene un anglicisme o es posen exemples.

S'usarà la **negreta** per a emfatitzar alguna paraula clau per a facilitar la lectura.

Totes les imatges, són d’elaboració pròpia.

## Màquina objectiu

"Pianissimo" és un videojoc per a dispositius mòbils per tant ha de funcionar per a aquests, això inclou tauletes i telèfons mòbils. Estarà disponible per a dispositius Android i iOS.

## No sé sota quin paraigua posar-ho

### Modes

#### Idle

ús de game

#### Assaig

Ús de *FocusManager*. Afegim dades a `player_save_data` relacionades amb el mode per a poder guardar la sessió.

TODO : posar més coses.

### *Autoloads*

Els *autoloads* s'han utilitzat per als *managers* que necessitava el joc com a *Singleton*. Per a fer-ho s'ha creat una carpeta `autoloads` on se situen tots i per a carregar-los com a tal en el projecte es fa: `Project > Globals > Autoload`.

Es poden ordenar segons la prioritat. En el cas de Pianissimo és de vital importància que primer carreguen les dades tant de la Configuració com del jugador, ja que depenen d'elles altres managers. Les dependències fan que l'ordre dels *Autoloads* importe, si no donaria un error.

![[Pianissimo_Autoloads_It2.png]]

Evitar posar en els scripts `class_name`, car que dona error també, entra en conflicte amb la naturalesa dels *Autoloads* de tenir una única instància.

### Internacionalització {#gdd-internacionalitzacio}

Una bona pràctica per a fer que el joc arribe a més gent és tenir-lo disponible en diversos idiomes. En Godot es pot aconseguir de manera senzilla amb un CSV.

En aquest fitxer s'ha de declarar en la primera fila les llengües que tindrà, en aquest cas català, espanyol i anglés i si en un futur se'n volguera afegir més seria possible.

> El terme **i18n** correspon a *internacionalization* on la `i` i la `n` són la primera i última lletra de la paraula i `18` el nombre de caràcters que hi ha entre elles. És un numerònim per descriure el procés de dissenyar i preparar una aplicació de programari perquè suporte diferents idiomes.

Pel que fa al d'aquest projecte el document es troba en `assets\i18n\translations.csv` i té aquest aspecte:

```csv
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

### Piano

El piano té 4 parts mòbils:

1. **`NOTE_SEQUENCE`.** Quina nota és el carril N": `["C", "C#", "D", "D#", "E", ...]`. `_is_black_key(i)` comprova quina `NOTE_SEQUENCE[i]` acaba en `#` per decidir el color de la tecla.
2. **`_build_keys()` reconstrueix cada botó de 0.** Llig `current_lane_count()` (que és `StatManager.get_level("keyboard") + 3`, màxim 12), i itera creant `Button.new()` per carril, aplicant l'estil de tecla negra si `_is_black_key()` ho diu i  `button.pressed.connect(handle_key_input.bind(i))`. `bind(i)` Encapsula específicament un carril en un botó en concret, p. ex. el botó 4 qcridaràsempre a  `handle_key_input(4)` independentment si després es creen més tecles.
3. **`_layout_keys()` geometria.** Separa les tecles en "blanques" (dividides a parts iguals segons l'amplària) i "negres" (la meitat d'amples i col·locades entre dues blanques quan corresponga, `move_to_front()`per a dibuixar-se al davant). Es fa separat de  `_build_keys()` a postes: el *layout* necessita tornar a executar-se quan la pantalla es canvia de mida (`key_row.resized.connect(_layout_keys)`), però reconstruir els nodes dels botons només necessita que ocórrega quan canvia el nombre de carrils.
4. **Disparador.** `StatManager.stat_purchased` és un *signal*; `piano.gd` l'escolta i crida a  `_build_keys()` només quan compra l'ID `"keyboard"`. La resta (*spawning*, detecció de tap, puntuació) ni coneix ni li importa que canvie el nombre de tecles, només mira pel nombre de botons en `key_buttons`.

## UI/UX

### Tema personalitzat

L'estètica de Pianissimo vol imitar als colors vius i alegres de *Rhythm Paradise* de la DS com també el seu estil *cartoon* 2D, de contorns gruixuts i foscos. Els personatges i objectes son poc seriosos i tenen un aspecte divertit. Aquesta serà la mentalitat per dissenyar.

![Paleta de colors de Pianissimo](Memoria/Assets/Pianissimo/pianissimo_paleta.png){height=3cm}

Tots els gràfics s'han fet amb *Affinity*, la majoria amb l'espai de treball de *Vectors*. Resulta més còmode a l'hora de fer formats que puguen variar de mida encara que té el desavantatge que els faig més lentament.

No estic tan acostumada a la ferramenta ploma d'aquest programa com d'altres, com puga ser *Photoshop*, però com no disposava d'ell en el Mac s'ha optat per usar un programa gratuït i multiplataforma com *Affinity*.

#### Tipografia

S'ha usat dues tipografies per al projecte:

- [**Sebastian**](https://github.com/fkretlow/sebastian): per a la `P` de la icona de l'aplicació i del logo. Només la *p*. Aquesta tipografia té només caràcters musicals, per tant, com ja tenia la *p* de la dinàmica pianissimo era perfecta.
- [**Note Serif**](https://github.com/notofonts/notofonts.github.io/tree/main/fonts/NotoSerif/googlefonts): per a la resta d'aplicació i “ianissimo” del logo.

Totes dues s'han escollit a més per ser de codi obert i lliure ús.

TODO : explicar el tema com s'ha fet i pensat, l'arxiu i com posar-lo global, variacions personalitzades ...

Upgrades de HBoxContainer a Card

## So

### Disseny sonor

El joc en tenir un component pianístic es necessitaran sons adients a aquesta estètica. Tots els àudios que s'han utilitzat estan sota la llicència CC0, trets de *Freesound* o *Musopen*. Per tal d'organitzar-los tots junts s'han disposat en forma de taula:

| Nom         | Descripció                                                                      | Àudio                          |
| ----------- | ------------------------------------------------------------------------------- | ------------------------------ |
| Clic        | Menys les tecles, la resta faran aquest so en polsar-los                        | clic.wav                       |
| Notes piano | Cada tecla del piano fa el corresponent so, el nom de la pista és el de la nota | C4.wav, C#4.wav, [...], B4.wav |
: Efectes de so de Pianissimo

| Nom             | Descripció                        | Compositor | Àudio                                                                                                                                                                     |
| --------------- | --------------------------------- | ---------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Menú            | Música que sona de fons en *home* |            | https://freesound.org/s/621130/                                                                                                                                           |
| Barroc1         | Preludi en Dm                     | J. S. Bach | [MusOpen - TWK prelude Cm](https://musopen.org/music/43466-the-well-tempered-clavier-book-i-bwv-846-869/)                                                                 |
| Barroc2         | Fuga en Do m                      | J. S. Bach | [MusOpen - TWK fugue Cm](https://musopen.org/music/43466-the-well-tempered-clavier-book-i-bwv-846-869/)                                                                   |
| Classicisme1    | Sonanta no.1 Fm, Op.2 no. 1 I     | Beethoven  | [MusOpen - Piano Sonana No.1 in Fm Op.1 I](https://musopen.org/music/26-piano-sonata-no-1-in-f-minor-op-2-no-1/)                                                          |
| Classicisme2    | Sonanta no.1 Fm, Op.2 no. 1 III   | Beethoven  | [MusOpen - Piano Sonata No.1 in Fm Op.1 III](https://musopen.org/music/26-piano-sonata-no-1-in-f-minor-op-2-no-1/)                                                        |
| Romanticisme1   | Etude Op.10, no.9 Fm              | Chopin     | [MusOpen - Étude Op.10](https://musopen.org/music/610-etudes-op-10/)                                                                                                      |
| Romaticisme2    | Barcarolle No. 1 Am, Op.26 I      | Fauré      | [MusOpen - Barcarolle No.1 Op.26](https://musopen.org/music/485-barcarolle-no-1-op-26/)                                                                                   |
| Impressionisme1 | La fille aux chaveux de lin       | Debussy    | [IMSPL - La fille aux cheveux de lin](https://imslp.eu/files/imglnks/euimg/7/73/IMSLP704772-PMLP2394-No.8._La_fille_aux_cheveux_de_lin_(A_moça_dos_cabelos_de_linho).mp3) |
| Impressionisme2 |                                   |            |                                                                                                                                                                           |
: Música de Pianissimo

El fet d'usar música clàssica, a banda de l'estètica, rau en el fet que les obres de piano pensades no tenen copyright, encara que les gravacions sí. Per tant, trobar interpretacions de lliure accés no és molt complicat i en cas de no trobar-ne amb qualsevol editor de partitures pots exportar l'àudio d'una en concret.

A excepció de la cançó del menú la resta les he tocades totes durant la meua etapa al conservatori. Moltes obres són la mateixa, però diferents moviments, com és el cas de la fuga i preludi i de la sonata.

#### Audios prova

Credits audio de prova:

- Pack: https://freesound.org/p/43099/
- click1: https://freesound.org/s/751232/
- click2: https://freesound.org/s/250552/
- pop: https://freesound.org/s/665183/

## Integració segons SO

Com el joc està pensat per a iOS i Android hi ha funcionalitats que s'han d'adaptar segons el SO i la seua botiga d'aplicacions.

### Assoliments

Fem una façana per a usar per sobre d'Android o iOS i després per cada SO un back-end específic. 

S'ha usat els connectors oficials de Godot de `google-play-services` i `gamecenter` 

TODO : posar enllaços ací o en la iteració o en els dos llocs.

Els assoliments en el projecte es troben com a recursos personalitzats `.tres` definits per `achievementDefinition` on inclouen diferents variables per a cadascun.

| ID                       | Títol           | Descripció                        | ID Android             | ID iOS                 |
| ------------------------ | --------------- | --------------------------------- | ---------------------- | ---------------------- |
| `first_focus_session`    | First Steps     | Complete your first focus session | CgkInrHOzokbEAIQAQ     | first_focus_session    |
| `notes_1000`             | Getting Started | Earn 1,000 notes in total         | <br>CgkInrHOzokbEAIQAg | notes_1000             |
| `first_upgrade_purchase` | Investor        | Buy your first upgrade            | CgkInrHOzokbEAIQAw     | first_upgrade_purchase |
| `first_stat_purchase`    | Growth Mindset  | Buy your first stat               | <br>CgkInrHOzokbEAIQBA | first_stat_purchase    |
| `upgrade_level_10`       | Dedicated       | Reach level 10 on any upgrade     | <br>CgkInrHOzokbEAIQBQ | upgrade_level_10       |
| `stat_level_10`          | Disciplined     | Reach level 10 on any stat        | CgkInrHOzokbEAIQBg     | stat_level_10          |
: Assoliments implementats en Pianissimo

S'ha creat una imatge diferent per a cada assoliment no per decisió pròpia si no per què la Play Store ho exigeix i, ja que estava li dona una miqueta més de personalitat. Com s'ha fet a faena l'App Store també es beneficia de la diversitat de caràtules.

### Notificacions

Si s'implementen posar com s'ha fet.

## Recursos

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