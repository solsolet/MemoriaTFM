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

Aquest document especifica el disseny per al joc amb el nom provisional de "Pianissimo". Està basat en les idees reflexades en el One-Sheet i el Ten-Pager del mateix joc. La idea es remunta al 14 de gener de 
l'any 2026 a les mans de Gemma Sellés Lloret per a la elaboració del seu TFM.

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

### Internacionalització

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

## UI/UX

### Tema personalitzat

TODO : explicar el tema com s'ha fet i pensat, el arxiu i com posar-lo global, variacions persionalitzades, paleta, estètica...

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
