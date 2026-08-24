# Changelog

## [v0.5.0] - 2026-08-23

### Added

- Implementació Piano en `home` interactiu.
- Implementació de tema de les tecles blanques i negres personalitzat.
- Addició icones en botons de `game`.

### Fixed

- Tema personalitzat amb més detall
- Paleta actualitzada.
- Aspecte `Note` millorat.
- Afegir i corregir efectes de so de les tecles.

## [v0.4.0] - 2026-08-21

### Added

- Implementació dels connectors específics de cada tenda d'aplicacions al projecte de Godot.
- Investigació de les especificacions dels connectors `godot-play-services` i `gamecenter` de Godot.
- Façana comuna i *back-end* específic per a assoliments tant d'Android com d'iOS.
- Implementació d'assoliments en la Play Store i App Store.
- Implementació dels assoliments com a recurs en el projecte de Godot.
- Autenticació de l'usuari a Play Game Services i en Game Center.
- Visualització de la UI d'assoliments de cada SO amb `show_achivements_ui`.
- Proves en dispositius de cada SO per a validar que es poden desbloquejar assoliments.
- Muntada del joc a les tendes d'aplicacions per a poder descarregar-lo.

### Fixed

- Correcció i addició d'alguns `margins` per a millorar la UI.


## [v0.3.0] - 2026-08-18

### Added

- Pantalles mode **focus** (configuració, historial, sessió i resultat d'assajos) i **àlbum** de cartes.
- Sistema d'assajos.
- Recompensa de guanyar cartes i desbloquejar-les en l'àlbum per assaig completat.
- 6 cartes diferents.

### Fixed

- Solució error `can_process`.


## [v0.2.0] - 2026-08-15

### Added

- Esboç `It 2` en memòria.
- Creació diferents pantalles del joc: Home, Game, Settings.
- **Game**: sistema piano (amb tecles negres), upgrades i stats.
- **Settings**: ajustament del volum + reset progrés del joc.
- Internacionalització de les cadenes de text del joc.
- Tema bàsic personalitzable.
- Selecció de sons temporals.
- Abstracció de Millores i Estadístiques com a recursos independents editables.
- **Millores**: auto-tap, multiplier
- **Estadístiques**: keyboard.

### Fixed

- Solució display en emulador vs mòbil.
- Ajustament dels límits de la pantalla per a respectar la _safe area_.
- Canvi progrés lineal a progrés exponenecial.
- Solució error de busos de so.


## [v0.1.0] - 2026-08-04

_Initial release._

[v0.1.0]: https://github.com/solsolet/MemoriaTFM/releases/tag/v0.1.0

### Added

- Planificació inicial Gantt Project.
- Redacció memòria inicial.
- Redacció versió inicial One-Sheet i Ten-Pager.
- Creació exportador de memòria.
- Creació Projecte Godot.
- Exportació Android/iOS configurada i provada.