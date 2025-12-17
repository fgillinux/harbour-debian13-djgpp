# DJGPP Cross-Compiler (Debian 13)

Este documento complementa o guia principal (`INSTALL_DEBIAN13.md`) com detalhes do DJGPP.

## Build (minimal)

```bash
cd ~
git clone https://github.com/jwt27/build-gcc.git
cd build-gcc
./build-djgpp.sh --prefix=/usr/local/djgpp minimal
```

## Validação

```bash
/usr/local/djgpp/bin/i386-pc-msdosdjgpp-gcc --version
```

## Observações

- Os executáveis DJGPP usam o *DOS extender* `go32v2`.
- Para rodar em DOSBox/FreeDOS, normalmente é necessário um servidor DPMI (ex.: `CWSDPMI.EXE`).
