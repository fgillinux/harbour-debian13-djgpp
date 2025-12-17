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

## Estrutura deste repositório

- `docs/` Documentação completa (instalação, DJGPP, DOSBox, troubleshooting)
- `scripts/` Scripts de ambiente e build
- `examples/` Exemplos prontos

## Sobre o Projeto Harbour

Harbour é a implementação de software livre e de código aberto de uma linguagem de programação multiplataforma, multithread, orientada a objetos e com suporte a scripts, retrocompatível com linguagens xBase. Harbour consiste em um compilador e bibliotecas de tempo de execução com múltiplos backends de interface do usuário, banco de dados e entrada/saída, seu próprio sistema de compilação e uma coleção de bibliotecas e bindings para APIs populares. Com Harbour, você pode criar aplicativos que rodam em GNU/Linux, Windows, macOS, iOS, Android, *BSD, *nix e muito mais.

Visite o site oficial do Harbour: https://harbour.github.io/

## Sobre o Projeto DJGPP

O DJGPP é um sistema completo de desenvolvimento C/C++ de 32 bits para PCs Intel 80386 (e superiores) com DOS. Inclui adaptações de muitas ferramentas de desenvolvimento GNU. As ferramentas de desenvolvimento exigem um computador com processador 80386 ou superior para funcionar, assim como os programas que geram. Na maioria dos casos, os programas produzidos podem ser comercializados sem licença ou royalties.

Visite o site oficial do DJGPP: https://www.delorie.com/djgpp/

## Sobre o Projeto DOSBox

O DOSBox é um emulador que recria um ambiente compatível com MS-DOS (completo com som, entrada, gráficos e até mesmo rede básica). Esse ambiente é completo o suficiente para executar muitos jogos clássicos de MS-DOS sem nenhuma modificação. Para utilizar todos os recursos do DOSBox, você precisa primeiro entender alguns conceitos básicos sobre o ambiente MS-DOS.

Visite o site oficial do DOSBox: https://www.dosbox.com/

## Sobre o Projeto FreeDOS

FreeDOS é um sistema operacional livre e de código aberto que é uma reimpressão do DOS original de Microsoft. Ele é projetado para ser compatível com o DOS original de Microsoft, mas com a vantagem de ser livre e de código aberto.

Visite o site oficial do FreeDOS: https://www.freedos.org/

## Sobre o Projeto CWSDPMI

CWSDPMI é um host DPMI de 32 bits escrito por Charles W. Sandmann entre 1996 e 2010, atualmente na versão r7. É baseado, em linhas gerais, no código GO32.EXE anterior usado no DJGPP v1. Ele pode fornecer serviços DPMI 0.90+ de 32 bits para programas compilados com as versões mais recentes dos compiladores DJGPP, etc.

Visite o site oficial do CWSDPMI: https://sandmann.dotster.com/cwsdpmi/ ou
CWSDPMI na Wikipedia: https://en.wikipedia.org/wiki/CWSDPMI

## Licença

MIT (ver `LICENSE`).
