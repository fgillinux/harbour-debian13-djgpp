# Harbour no Debian 13 — Linux + MS-DOS (DJGPP)

Este repositório fornece um guia **reprodutível e validado** para:

- Instalar e usar **Harbour** no Debian 13 (compilação nativa Linux)
- Instalar **DJGPP** como *cross-compiler*
- Compilar o **Harbour para MS-DOS (DJGPP/go32v2)** e gerar executáveis `.EXE`
- Executar em **DOSBox** ou **FreeDOS** (via `CWSDPMI.EXE`)

## Começando

1. Siga o guia principal: **[`docs/INSTALL_DEBIAN13.md`](docs/INSTALL_DEBIAN13.md)**
2. Use os scripts em `scripts/` para alternar rapidamente entre Linux e DOS.
3. Teste com o exemplo em `examples/hello/test.prg`.

## Estrutura

- `docs/` Documentação completa (instalação, DJGPP, DOSBox, troubleshooting)
- `scripts/` Scripts de ambiente e build
- `examples/` Exemplos prontos

## Licença

MIT (ver `LICENSE`).
