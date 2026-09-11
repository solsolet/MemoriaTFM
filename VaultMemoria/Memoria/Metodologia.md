%% s'indicarà el tipus o tipus d'investigació, les tècniques i els procediments que seran utilitzats per a dur-la a terme; s'identificarà la població i la grandària de la mostra com també les tècniques i instruments de recol·lecció de dades.%%

# Metodologia

## Metodologia àgil

Durant el desenvolupament d'aquest treball se seguirà una metodologia àgil de manera que s'**itere** sobre el projecte, fent xicotetes versions funcionals que cada vegada integren més aspectes del producte per així provar-lo ràpidament i poder fer canvis sobre la marxa.
Per a implementar-la s'han planificat una sèrie de fites per a anar avançant durant el desenvolupament.

S'ha plasmat aquesta planificació inicial amb Gantt Project de manera que es visualitze com es van completant les tasques respecte a una línia del temps.

A més també s'ha usat un tauler Kanban per a controlar quines tasques hi ha pendents, quines s'estan executant i quines s'acaben en cada moment. D'aquesta manera serà molt més senzill detectar colls de botella que es puguen produir durant el desenvolupament.

Aquestes ferramentes ajuden a fer l'exercici de planificar les tasques, donar-les un pes, calcular quant tardaran a realitzar-se, quina prioritat donar-li... així tot queda organitzat visualment i qualsevol persona podria ubicar en quin punt es troba el projecte, què s'ha fet i quines tasques queden per acabar.

## Ferramentes

Per al desenvolupament d'aquest TFG m'he basat en les següents ferramentes i sistemes per a les diferents tasques que havia d'abordar:

### MacOS Tahoe

Sistema operatiu d'Apple. Compte en la versió Tahoe 26.0. S'ha usat com a SO predominant per a poder fer les exportacions del joc amb Xcode.

### Windows

Sistema operatiu de Microsoft. Compte amb la versió de Windows 11.

### GitHub

[GitHub](https://github.com) és un programari de sistema de control de versions per a mantenir el projecte en diversos dispositius i tenint constància de com avança el projecte. S'ha fet ús d'un mateix repositori per a la memòria i per al projecte de Godot.

S'ha usat una organització per branques:

- `main`: versions estables i acabades del projecte. Al principi tot estava en aqeusta branca, però en un punt vaig decidir reorganitzar el projecte per a diferenciar els diferents punts en què es trobava el joc. Quan s'acabe aquest treball contindrà la `v1.0.0`.
- `develop`: branca on s'ha desenvolupat la major part del projecte de Godot on fer *merge* de les branques de funcionalitat `feature/` i corregir errades que s'han detectat després de les versions. Conté totes les etiquetes de les versions.
- `feature/x`: branca per a les funcionalitats del joc. Cada versió inclou unes funcionalitats al voltant d'un aspecte concret del joc, p. ex. millorar la UI, quan s'acabava d'implementar tot el planejat o corregir les errades necessàries es feia *merge* i s'esborrava la branca.

I per a tenir un registre de les versions s'han fet les *Releases* corresponents. Al *CHANGELOG* del repositori està tota la informació de què conté cadascuna.

![Commits d'un dia a GitHub](Memoria/Assets/Metodologia/GitHub-commits.png){height=5cm}

### Clockify

[Clockify](https://clockify.me/es/) és un programa per al seguiment de temps per a les meues hores de treball en aquest projecte. Dins de l'aplicatiu, m'he creat el projecte ‘TFM’ i he anat creant diferents tasques com:

- **Memòria Obsidian**: per a tot el relacionat amb la memòria
- **Reunió/Correu *x***: per a tota classe de reunions i correus que s'han enviat al tutor.
- **Investigació *x***: per al temps dedicat documentant-me i informant-me en temes relacionats amb els videojocs, el mercat mòbil...
- **Organització *x*:** per al temps que s'ha dedicat organitzant algunes coses relacionades en algun aspecte del TFM ja siga el *Vault*, control de versions, revisar el seguiment...

Altres tasques no han tingut un nom transversal a tot el projecte, però sí un que correspon amb un *commit* o similar.

![Tasques a Clockify en un dia](Memoria/Assets/Metodologia/Clockify-dia.png){height=5cm}

### Obsidian

[Obsidian](https://obsidian.md) és un programa per a prendre notes, seleccionar i gestionar informació i idees. S'usarà per a redactar tota la memòria i organitzar tasques i idees.

Cada apartat d'aquesta memòria és un fitxer `.md` independent per tal de reduir la càrrega mental i facilitar l'organització. Les imatges de la memòria s'han guardat en una carpeta `Assets/` per tal de distingir i tenir més centralitzades les rutes.

Addicionalment, ha servit per al desenvolupament i organització d'aquest treball els següents connectors:

- *Citations*: inserta cites de Zotero.
- *Git*: detecta el repositori i permet control de versions.
- *Kanban*: permet crear taulers Kanban amb certa configuració, l'he usat per al control de tasques.
- *LanguageTool Integration*: marca errades ortogràfiques i gramaticals al text.
- *Style settings*: controla l'aspecte del tema d'Obsidian amb més paràmetres.
- *TODOseq*: permet posar `TODO` al text ressaltat i els agrupa en una finestra lateral.
- *Zotero Integration*: inserta, importa citacions, bibliografia... de Zotero.

![Aspecte d'Obsidian del tauler Kanban i el connector TODOseq](Memoria/Assets/Metodologia/Obsidian-aspect.png){height=7cm}

Els connectors que van amb **Zotero** s'han complementat amb l'extensió de Safari i l'aplicació d'escriptori. S'ha sincronitzat tot de manera que quan es guardara una referència al navegador, s'actualitzara la biblioteca automàticament i permetera usar-ho en Obsidian sense tornar a importar.

### Pandoc

[Pandoc](https://pandoc.org) és un convertidor universal de documents. S'usarà per a convertir els fitxers `.md` de la memòria elaborats amb Obsidian a un format compatible amb l'entrega del projecte (PDF). S'ha usat la versió 3.8.3 que és la que es va instal·lar al principi del projecte.

S'ha fet un exportador de la memòria a PDF amb uns scripts de Python que han permés que amb un simple `./build.sh` a la terminal en la carpeta del *Vault* traguera la memòria en el format adequat amb:
- Índexs autogenerats: general, de figures i taules.
- Numerada.
- Bibliografia actualitzada. Al text es cridava amb `[@index_cita]` i s'afegia amb format APA a l'apartat de la bibliografia amb `:::{#refs}:::`.
- Figures autonumerades.
- Enllaços interns entre diferents seccions.
- Aspecte desitjat: marges, interlineat, tipografia...
- Portada al principi del document. La portada es troba al projecte com a PDF i amb el script els uneix.
- A més totes les imatges que usa la memòria estan comprimides automàticament durant l'exportació perquè el PDF resultant no siga molt pesat.

### Godot 4.5.1 {#sec-godot-451}

 [Godot](https://godotengine.org) és un motor de jocs 2D-3D de codi obert multiplataforma amb què es desenvoluparà el videojoc del qual tracta aquest treball. S'usarà la versió 4.5.1 que és l'última estable a l'abast del projecte en el seu inici.

Addicionalment, ha servit per al desenvolupament d'aquest treball els següents connectors:

- *[Godot Play Game Services](https://github.com/godot-sdk-integrations/godot-play-game-services.git)*: permet usar els GPS al projecte, cal posar l'ID del projecte de la Play Console en l'apartat corresponent del connector a Godot i en els paràmetres d'exportació d'Android emplenar els apartats de la clau, el nom del paquet... Després al codi es podrà cridar als mètodes que té disponibles. S'ha de col·locar en `addons`.
- *[Godot iOS GameCenter plugin](https://github.com/godot-sdk-integrations/godot-ios-plugins/tree/master/plugins/gamecenter)*: permet connectar Game Center amb el joc, s'ha de seleccionar en la pestanya d'exportació la casella en `Plugins > Game Center`. S'ha de col·locar en `ios/plugins`.
- *[Notification Scheduler Plugin](https://github.com/godot-mobile-plugins/godot-notification-scheduler/releases/tag/v5.1)*: connector multiplataforma per a poder usar notificacions al nostre joc. El connector té 2 carpetes una per a Android que ha d'anar a `addons` i altra per a iOS en `ios/plugins`

En els connectors s'ha usat la versió corresponent a la versió de Godot (4.5.1) i s'han posat en la carpeta corresponent, ja que si no, no funcionaven correctament.

Hi ha diverses maneres d'obtenir-los, però en aquest projecte s'ha optat per descarregar-los directament del repositori corresponent, col·locar-los a mà dins del projecte i activant-los en la configuració del projecte.

### VSCode

[VSCode](https://code.visualstudio.com/) és un editor de codi que s'ha usat per a fer l'exportador a PDF, com també revisar i alguns fitxers, usar la terminal integrada i controlar el repositori de Git.

Ha sigut l'editor del fitxer CSV de les traduccions del joc, ja que a Godot no es pot manipular. S'ha usat l'extensió *Rainbow CSV* per facilitar la lectura.

També s'ha usat per a tocar algun paràmetre concret dels fitxers `.tscn`, ja que en algunes solucions a errades que trobava mencionaven directament els paràmetres en codi pla i no en el nom de l'inspector de Godot.

### Xcode

[Xcode](https://developer.apple.com/xcode/) s'ha usat per a compilar i fer proves del projecte de Godot en un iPhone real. S'ha usat un *provisioning profile* per a poder provar en l'iPhone i per a muntar el joc a l'App Store un de distribució. D'aquest últim s'ha encarregat Miguel Ángel Lozano tirant-me una maneta perquè poguera usar el compte del màster per a muntar el joc. El procés era exportar el joc i passar-li'l perquè el poguera compilar i muntar a l'App Store Connect.

### GanttProject

[GanttProject](https://www.ganttproject.biz/) és una aplicació multiplataforma de programari lliure (sota la llicència GPL), la fi de la qual és la **gestió de projectes** mitjançant una representació gràfica de la distribució de les tasques necessàries a curt, mitjà i/o llarg termini.

### Affinity

[Affinity](https://www.affinity.studio) és un editor d'imatges per a fer dibuixos i icones dels diferents elements artístics del joc a més dels muntatges d'algunes figures de la memòria per tal d'agrupar fotos.

### Audacity

[Audacity](https://www.audacityteam.org/) és un programa de gravació i edició d'àudio multipista de codi obert. S'ha usat per a editar els efectes de so i la música del joc siga retallant siga ajustant el volum o exportant a diferents formats.

### MuseScore

[MuseScore](https://musescore.org/ca) és un programa de composició i notació musical. S'ha usat per a exportar el so d'una escala tocada a piano per fer el so de les tecles del joc.

### KDenLive

[KDenLive](https://kdenlive.org/es/) és un editor de vídeo per a elaborar vídeos de demos i producte final.

### LLM

En el desenvolupament del joc s'ha utilitzat Claude i ChatGPT per a depurar, trobar errades i refactoritzar diferents funcionalitats implementades en el joc. Només s'han usat pel que fa a la programació. Aquests LLM han permés anar més de pressa i evitar quedar-se paralitzat per alguna cosa que no eixira durant la implementació.

## Anàlisi de videojocs {#sec-analisi-videojocs}

Per a analitzar els videojocs de l'[estat l'art](#sec-estat-art), s'ha seguit aquesta metodologia:

1. Primer s'han jugat els jocs lúdicament sense cap altre objectiu que no siga progressar i passar-s'ho bé, com ho podria fer qualsevol jugador.
2. Després d'una sessió de joc, que es pot jugar intermitentment durant un dia, en el punt on ens trobem s'analitzarà:
	1. Interfície d'usuari amb captures del joc.
	2. Mecàniques.
	3. Progressió.
	4. Experiència d'usuari.
	5. Estil artístic.
	6. Música i sons.

Una vegada estiguen tots analitzats ajudarà al desenvolupament del videojoc del qual tracta aquest TFM. Podrem replicar i adaptar tècniques i estratègies de jocs que han sigut exitosos al propi.

## Proves

Durant el desenvolupament el joc s'ha provat en 3 dispositius mòbils distints que es tenien a l'abast:

- **Redmi note 13 Pro + 5G**: com a representació d'un mòbil Android actual i actualitzat.
- **Mi A1**: Android vell més limitat.
- **iPhone 12**: iOS actualitzat.

En Android ha sigut senzill instal·lar el joc per a fer proves ràpides gràcies que en Godot si es connecta el mòbil en mode desenvolupador per USB, el detecta i amb un botó s'instal·la.

En iOS, en canvi, s'havia d'exportar el projecte, obrir-lo amb Xcode i executar-lo en el dispositiu des d'ací.

Fora de les proves durant el desenvolupament en les últimes instàncies del projecte es va fer una prova amb usuaris per tal de conéixer l'opinió i rebre retroalimentació del joc, a més de saber si funciona en distints dispositius mòbils.

### Dispositius

L'aplicació s'ha pogut provar en diversos dispositius mòbils, entre ells s'han documentat els següents:

| Nom                       | Marca   | SO      | API    | RAM   | Pantalla |
| ------------------------- | ------- | ------- | ------ | ----- | -------- |
| **Redmi note 13Pro + 5G** | Xiaomi  | Android | 35     | 12 GB | 6.67"    |
| **Mi A1**                 | Xiaomi  | Android | 21     | 4 GB  | 5.5"     |
| **iPhone 12**             | Apple   | iOS     | 18.7.8 | 4 GB  | 6.1"     |
| **Redmi 9**               | Xiaomi  | Android | 30     | 4 GB  | 6.53"    |
| **Samsung S10**           | Samsung | Android | 31-32  | 8 GB  | 6.1"     |
| **POCO F7 Pro**           | Xiaomi  | Android | 36     | 12 GB | 6.67"    |
| **Vivo V23**              | Vivo    | Android | 30     | 12 GB | 6.44"    |
| **Samsung Galaxy A34**    | Samsung | Android | 36     | 8 GB  | 6.6"     |
| **Redmi Note 12**         | Xiaomi  | Android | 33     | 8 GB  | 6.67"    |
| **iPhone 16**                 | Apple   | iOS     |        |       |          |
| **iPhone**                    | Apple   | iOS     |        |       |          |
| **iPad**                      | Apple   | iOS     |        |       |          |
|                           | Android | iOS     |        |       |          |
: Dispositius mòbils on s'ha provat Pianissimo

Segons el SO l'usuari s'ha instal·lat l'aplicació:

- **Android**: a la *Play Store*, com a usuari de proves internes. Clavant-lo al grup de testers amb el seu correu podien descarregar-lo mitjançant un *enllaç* que portava a la pàgina del joc.
- **iOS**: amb *Test Flight*, per formar part del grup d'usuaris externs. En convidar un usuari a ser tester els arribava un correu amb un enllaç per a accedir-hi.