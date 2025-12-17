# Instalação do Harbour no Debian 13 (Linux + MS-DOS via DJGPP)

Este documento descreve **do zero** como montar um ambiente no Debian 13 capaz de:

- Compilar programas Harbour nativamente para **Linux**
- Gerar executáveis **MS-DOS (`.EXE`)** usando **DJGPP (cross-compiler)**

A sequência abaixo foi validada em ambiente real.

---

## 1) Pré-requisitos e pacotes

Atualize e instale os pacotes necessários:

```bash
sudo apt update
sudo apt install -y \
  build-essential \
  gcc g++ make \
  git \
  curl wget \
  bison flex \
  libncurses-dev \
  libslang2-dev \
  libx11-dev \
  libxpm-dev \
  zlib1g-dev \
  libpcre3-dev \
  dosbox \
  unzip zip
```

---

## 2) Harbour nativo (Linux)

### 2.1 Clonar o Harbour

```bash
cd ~
git clone https://github.com/harbour/core.git harbour-core
cd harbour-core
```

### 2.2 Compilar e instalar

```bash
make clean
make
sudo make install PREFIX=/opt/harbour-linux
```

### 2.3 Validar

```bash
/opt/harbour-linux/bin/hbmk2 -h
```

---

## 3) DJGPP (cross-compiler)

### 3.1 Clonar o build system do DJGPP

```bash
cd ~
git clone https://github.com/jwt27/build-gcc.git
cd build-gcc
```

### 3.2 Compilar (perfil "minimal")

```bash
./build-djgpp.sh --prefix=/usr/local/djgpp minimal
```

### 3.3 Validar toolchain

```bash
/usr/local/djgpp/bin/i386-pc-msdosdjgpp-gcc --version
```

Se o comando retornar a versão do GCC para `i386-pc-msdosdjgpp`, o toolchain está OK.

---

## 4) Harbour para MS-DOS (DJGPP)

A compilação do Harbour para DOS deve usar o cross-compiler (DJGPP) e o alvo `dos`.

### 4.1 Exportar variáveis de build (sessão atual)

```bash
export PATH=/usr/local/djgpp/bin:$PATH
export HB_PLATFORM=dos
export HB_COMPILER=djgpp
export HB_CCPREFIX=i386-pc-msdosdjgpp-
```

### 4.2 Garantir permissões no source tree (se necessário)

Se você compilou com `sudo` em algum momento, podem existir diretórios `obj/` com owner `root`.
Corrija assim:

```bash
sudo chown -R "$USER:$USER" ~/harbour-core
chmod -R u+rwX ~/harbour-core
```

### 4.3 Compilar e instalar o Harbour DOS

```bash
cd ~/harbour-core
make clean
make
sudo rm -rf /opt/harbour-dos
sudo make install PREFIX=/opt/harbour-dos
```

### 4.4 Validação rápida (bibliotecas chave)

```bash
ls -l /opt/harbour-dos/lib/harbour/libgtdos.a
ls -l /opt/harbour-dos/lib/harbour/libhbdossrl.a
```

Se existirem, você tem os principais componentes de runtime/GT para DOS.

> Observação: em alguns cenários é necessário compilar também os módulos `src/rdd` para satisfazer símbolos de banco/DBF
> durante o link. Se você tiver erro de *undefined reference* em `hb_rdd*`, veja `docs/TROUBLESHOOTING.md`.

---

## 5) Script de ambiente para compilar DOS (recomendado)

Crie um script reutilizável para evitar exportar variáveis manualmente:

```bash
mkdir -p ~/bin

cat > ~/bin/hb_dos_env.sh <<'EOF'
export HB_ROOT=/opt/harbour-dos
export HB_PLATFORM=dos
export HB_COMPILER=djgpp
export HB_CCPREFIX=i386-pc-msdosdjgpp-
export PATH=/usr/local/djgpp/bin:$HB_ROOT/bin:$PATH
EOF

chmod +x ~/bin/hb_dos_env.sh
```

Uso:

```bash
source ~/bin/hb_dos_env.sh
```

Opcional (conveniência): adicionar `~/bin` ao PATH:

```bash
grep -q 'export PATH="$HOME/bin' ~/.bashrc || \
echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc
```

---

## 6) Projeto de teste (`Hello, World!`)

Crie um diretório de projetos:

```bash
mkdir -p ~/harbour-projects
cd ~/harbour-projects
```

Crie `test.prg`:

```harbour
PROCEDURE Main()
   ? "Hello, World!"
RETURN
```

---

## 7) Compilar para Linux (nativo)

```bash
/opt/harbour-linux/bin/hbmk2 test.prg -otest-linux
file test-linux
```

Resultado esperado: binário ELF 64-bit.

---

## 8) Compilar para MS-DOS (DJGPP)

```bash
source ~/bin/hb_dos_env.sh
hbmk2 test.prg -otest-msdos
file test-msdos.exe
```

Resultado esperado:

```
MS-DOS executable, COFF for MS-DOS, DJGPP go32 v2.05 DOS extender (stub)
```

---

## 9) Executar no DOSBox (DPMI)

Executáveis DJGPP exigem DPMI. No DOSBox, use `CWSDPMI.EXE`.

### 9.1 Baixar CWSDPMI

```bash
cd ~/harbour-projects
wget https://www.delorie.com/pub/djgpp/current/v2misc/csdpmi7b.zip
unzip csdpmi7b.zip
cp CWSDPMI.EXE .
```

### 9.2 Rodar no DOSBox

```bash
dosbox
```

Dentro do DOSBox:

```dos
mount c ~/harbour-projects
c:
test-msdos
```

Saída esperada:

```
Hello, World!
```

---

## 10) Compilar Linux e DOS com um único comando (opcional)

Veja `scripts/build_all.sh` e adapte para o seu projeto.
