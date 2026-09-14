# Obsidian-Pandoc

Instruccions per a exportar d'Obsidian a PDF usant LaTeX amb Pandoc per a fer memòries acadèmiques.

## Regles

### Imatges

Limitació per altura:
```
![Caption. Font: Cookie Clicker](Memoria/.../.png){height=10cm}
```

#### Figures

Per a referenciar figures dins de la memòria i que es genere l'enllaç i la numeració correctament podem usar:
```pandoc
\ref{fig:IDfigura a referenciar en el text}

![Descripció \label{fig:ID figura a ser referenciada}](ruta figura)
```

### Taules

Peu de taula, que ixirà també a l'índex de taules, s'ha de posar immediatament després de la taula:
```
: Text que volem que isca com a peu de Taula
```

### Alineació

Per a posar cites i dedicatòries a la dreta:
```pandoc
\begin{flushright}

text

\end{flushright}
```

### Cursiva

Si per algun motiu l'estil de cursiva no s'aplica a un text que tinga alguna regla que interfereix podem:
```pandoc
\textit{el text d'ací dins estarà en cursiva}

\itshape
tot el text d'ací baix estarà en cursiva
```