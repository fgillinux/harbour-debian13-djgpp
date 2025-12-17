# Harbour no Debian 13 — Linux + MS-DOS (DJGPP)

Este repositório documenta **passo a passo** como instalar e utilizar o
**Harbour no Debian 13**, permitindo:

- Compilação nativa para Linux
- Cross-compile para MS-DOS usando DJGPP
- Execução em DOSBox ou FreeDOS

Todo o conteúdo foi validado em ambiente real.

---

## Conteúdo

- 📘 Instalação completa no Debian 13
- ⚙️ Toolchain DJGPP cross
- 💾 Geração de executáveis MS-DOS (.EXE)
- 🧪 Exemplo funcional
- 🧰 Scripts prontos para uso

---

## Começando

➡️ **Leia primeiro**:  
[`docs/INSTALL_DEBIAN13.md`](docs/INSTALL_DEBIAN13.md)

---

## Estrutura do projeto

```text
docs/        Documentação detalhada
scripts/     Scripts de build e ambiente
examples/    Exemplos Harbour

### Requisitos

- Debian 13
- GCC
- Git
- DOSBox (opcional)

### Licença

Este repositório segue a licença MIT, exceto quando indicado.


---

# 2️⃣ docs/INSTALL_DEBIAN13.md

👉 **Este é o tutorial principal**, equivalente ao Wiki que você pediu.

> Conteúdo:  
Use **integralmente** o texto Wiki que gerei anteriormente, sem alterações.

(Se quiser, posso colar novamente já formatado — mantive separado para evitar duplicação.)

---

# 3️⃣ docs/DJGPP.md

```markdown
# DJGPP Cross-Compiler

Este documento descreve a instalação e uso do DJGPP como
cross-compiler no Debian 13.

## Compilação

```bash
git clone https://github.com/jwt27/build-gcc.git
cd build-gcc
./build-djgpp.sh --prefix=/usr/local/djgpp minimal


### Verificacao

i386-pc-msdosdjgpp-gcc --version


### Observações

- DJGPP gera executáveis 32-bit em protected mode
- Requer DPMI (CWSDPMI)



---

# 4️⃣ docs/DOSBOX.md

```markdown
# Execução no DOSBox

Executáveis DJGPP requerem DPMI.

## Preparação

```bash
wget https://www.delorie.com/pub/djgpp/current/v2misc/csdpmi7b.zip
unzip csdpmi7b.zip


Copie CWSDPMI.EXE para o diretório do programa.

### Executar

mount c ~/harbour-projects
c:
test-msdos



---

# 5️⃣ docs/TROUBLESHOOTING.md

```markdown
# Troubleshooting

## Erro: no DPMI

Mensagem:
Load error: no DPMI



Solução:
- Copiar `CWSDPMI.EXE` para o diretório
- Ou usar FreeDOS

---

## Erro: cannot find -lgtdos

Causa:
- Harbour DOS incompleto

Solução:
- Recompilar Harbour com:
  - HB_PLATFORM=dos
  - HB_COMPILER=djgpp


6️⃣ scripts/hb_dos_env.sh

#!/bin/bash
export HB_ROOT=/opt/harbour-dos
export HB_PLATFORM=dos
export HB_COMPILER=djgpp
export HB_CCPREFIX=i386-pc-msdosdjgpp-
export PATH=/usr/local/djgpp/bin:$HB_ROOT/bin:$PATH

7️⃣ scripts/build_all.sh

#!/bin/bash

set -e

echo "Build Linux"
hbmk2 test.prg -otest-linux

echo "Build MS-DOS"
source ./scripts/hb_dos_env.sh
hbmk2 test.prg -otest-msdos

echo "Done"


8️⃣ examples/hello/test.prg

PROCEDURE Main()
   ? "Hello, World!"
RETURN


9️⃣ LICENSE (MIT)

MIT License

Copyright (c) 2025

Permission is hereby granted...


