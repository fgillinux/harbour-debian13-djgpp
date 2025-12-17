# Troubleshooting

## 1) Erro no DOSBox: "Load error: no DPMI"

**Causa:** executável DJGPP precisa de DPMI.  
**Solução:** colocar `CWSDPMI.EXE` no mesmo diretório do `.EXE` (ou usar FreeDOS).

---

## 2) Linker: undefined reference para símbolos `hb_rdd*` / funções DBF (BOF/EOF/RECNO etc.)

Exemplo de sintomas:
- `undefined reference to hb_rddGetFieldValue`
- `Referenced, missing: BOF(), EOF(), RECNO(), SELECT() ...`

**Causa provável:** bibliotecas RDD não foram geradas/instaladas no prefixo DOS.

**Solução (no source tree do Harbour):**
```bash
cd ~/harbour-core
export PATH=/usr/local/djgpp/bin:$PATH
export HB_PLATFORM=dos
export HB_COMPILER=djgpp
export HB_CCPREFIX=i386-pc-msdosdjgpp-

make -C src/rdd clean
make -C src/rdd

sudo cp -v ~/harbour-core/lib/dos/djgpp/*.a /opt/harbour-dos/lib/harbour/
```

---

## 3) Build tentando incluir headers do Linux (`/usr/include`) ao compilar para DOS

Sintoma típico:
- `fatal error: bits/libc-header-start.h: No such file or directory`

**Causa:** algum componente (ex.: curses/slang/x11) do host está sendo incluído no build do alvo DOS.  
**Solução prática:** para DOS use `gtdos`, `gtstd`, `gtpca` e evite GTs dependentes do host, como `gtcrs`, `gtsln`, `gtxwc`.

---

## 4) Diretórios `obj/` com owner root causando "Permission denied"

**Causa:** build anterior executado com `sudo`.  
**Solução:**
```bash
sudo chown -R "$USER:$USER" ~/harbour-core
chmod -R u+rwX ~/harbour-core
```
