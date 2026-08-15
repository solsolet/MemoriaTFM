---
created: 2026-06-23 00:31
last_reviewed: 2026-06-23
state: "In Progress"
---

# GDD - Pianissimo

%%TODO : Açò aniria en una portada d'alguna manera%%

Títol: Pianissimo (fins que trobe un altre)
*Tag line*: piano piano piano (?)
Fet per Gemma Sellés Lloret aka solsolet
Última revisió agost 2026.

## Historial de versions

| Versió | Data       | Descripció dels canvis       |
| :----- | :--------- | :--------------------------- |
| v1.0.0 | 2026-06-23 | Creació inicial del document |
|        |            |                              |
|        |            |                              |

***

## Introducció

Aquest document especifica el disseny per al joc amb el nom provisional de "Pianissimo". Està basat en les idees reflectides en el One-Sheet i el Ten-Pager del mateix joc. La idea es remunta al 14 de gener de l'any 2026 a les mans de Gemma Sellés Lloret per a l'elaboració del seu TFM.

### Destinataris
Aquest document té la intenció de ser llegit per tota aquella persona que estiguen involucrades en el disseny, implementació o proves del videojoc, com poden ser programadors, artistes... O per aquells que tinguen la curiositat de veure com s'ha fet i desenvolupat aquest projecte.

### Estil

El text d'aquest document s'escriurà en 3a persona. En casos de diàlegs de la trama o que es necessite un altre estil es canviarà segons la situació.

Es farà ús de la *cursiva* quan es nomene un anglicisme o es posen exemples.

S'usarà la **negreta** per a emfatitzar alguna paraula clau per a facilitar la lectura.

Totes les imatges, si no s’indica el contrari, son d’elaboració pròpia.

%%TODO : si al final no hi ha cap externa, llevar aquesta línia%%

## Màquina objectiu

"Pianissimo" és un videojoc per a dispositius mòbils per tant ha de funcionar per a aquests, això inclou tauletes i telèfons mòbils. Estarà disponible per a dispositius Android i iOS.

## No sé sota quin paraigua posar-ho

### *Autoloads*

Els *autoloads* s'han utilitzat per als *managers* que necessitava el joc com a *Singleton*. Per a fer-ho s'ha creat una carpeta `autoloads` on se situen tots i per a carregar-los com a tal en el projecte es fa: `Project > Globals > Autoload`.

Es poden ordenar segons la prioritat. En el cas de Pianissimo és de vital importància que primer carreguen les dades tant de la Configuració com del jugador, ja que depenen d'elles altres managers. Les dependències fan que l'ordre dels *Autoloads* importe, si no donaria un error.

![[Pianissimo_Autoloads_It2.png]]

Evitar posar en els scripts `class_name`, car que dona error també, entra en conflicte amb la naturalesa dels *Autoloads* de tenir una única instància.

### Internacionalització {#gdd-internacionalitzacio}

Una bona pràctica per a fer que el joc arribe a més gent és tenir-lo disponible en diversos idiomes. En Godot es pot aconseguir de manera senzilla amb un CSV.

En aquest fitxer s'ha de declarar en la primera fila les llengües que tindrà, en aquest cas català, espanyol i anglés i si en un futur se'n volguera afegir més seria possible.


> [!NOTE] i18n
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

### Persistència

Settings:  Botó delete progress: Es crear un nou Savenoseque i giardarlo pel que tenim. com a tal nmo borra només guardes un buit.

### Piano

El piano té 4 parts mòbils:

1. **`NOTE_SEQUENCE`.** Quina nota és el carril N": `["C", "C#", "D", "D#", "E", ...]`. `_is_black_key(i)` comprova quina `NOTE_SEQUENCE[i]` acaba en `#` per decidir el color de la tecla.
2. **`_build_keys()` reconstrueix cada botó de 0.** Llig `current_lane_count()` (que és `StatManager.get_level("keyboard") + 3`, màxim 12), i itera creant `Button.new()` per carril, aplicant l'estil de tecla negra si `_is_black_key()` ho diu i  `button.pressed.connect(handle_key_input.bind(i))`. `bind(i)` Encapsula específicament un carril en un botó en concret, p. ex. el botó 4 qcridaràsempre a  `handle_key_input(4)` independentment si després es creen més tecles.
3. **`_layout_keys()` geometria.** Separa les tecles en "blanques" (dividides a parts iguals segons l'amplària) i "negres" (la meitat d'amples i col·locades entre dues blanques quan corresponga, `move_to_front()`per a dibuixar-se al davant). Es fa separat de  `_build_keys()` a postes: el *layout* necessita tornar a executar-se quan la pantalla es canvia de mida (`key_row.resized.connect(_layout_keys)`), però reconstruir els nodes dels botons només necessita que ocórrega quan canvia el nombre de carrils.
4. **Disparador.** `StatManager.stat_purchased` és un *signal*; `piano.gd` l'escolta i crida a  `_build_keys()` només quan compra l'ID `"keyboard"`. La resta (*spawning*, detecció de tap, puntuació) ni coneix ni li importa que canvie el nombre de tecles, només mira pel nombre de botons en `key_buttons`.

## UI/UX

### Tema personalitzat

TODO : explicar el tema com s'ha fet i pensat, l'arxiu i com posar-lo global, variacions ppersonalitzades paleta, estètica...

Upgrades de HBoxContainer a Card

## So

### Disseny sonor

#### Audios prova

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
