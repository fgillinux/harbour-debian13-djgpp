# Execução no DOSBox (DJGPP/go32v2)

Executáveis gerados com DJGPP precisam de DPMI. O DOSBox não provê DPMI por padrão,
então você deve usar `CWSDPMI.EXE`.

## Obter CWSDPMI

```bash
wget https://www.delorie.com/pub/djgpp/current/v2misc/csdpmi7b.zip
unzip csdpmi7b.zip
```

Copie `CWSDPMI.EXE` para o mesmo diretório do seu `.EXE`.

## Rodar

```bash
dosbox
```

Dentro do DOSBox:

```dos
mount c ~/harbour-projects
c:
test-msdos
```

Se aparecer “Load error: no DPMI”, confirme que `CWSDPMI.EXE` está no diretório (ou no PATH do DOS).
