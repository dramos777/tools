Determinar quais diretorios receberão atributos do attr

# attr
- Listar os atributos dos arquivos
```
lsattr
```
- Não permitir alterações ou deleções do arquivo/diretório nem mesmo com usuário root (tornar imutável)
```
chattr +i
```
- Remover o atributo imutável do arquivo/diretório
```
chattr -i
```
- Aplicar as configurações de modo recursivo
```
chattr -R
```
- Colocar o diretório em modo apend (o arquivo não pode ser deletado, apenas alterado)
```
chattr -a diretorio
```
- Colocar o arquivo em modo apend (o arquivo não pode ser deletado ou alterado, apenas aceita adição de novas linhas)
```
chattr -a arquivo
```
- Igualar os atributos (a, i, e) em todos os arquivos (*)
```
chattr =aie *
```
- Compactar o arquivo no momento do armazenamento. (obs. Algumas distros não possuem suporte a este atributo. Neste caso ele será ignorado)
```
chattr +c
```
- Utilizar atributo para deletar o arquivo de forma segura. (este atributo zera todos os dados do arquivo. Obs. Não funciona bem com sistemas com journal)
```
chattr +s
```
- Ativar o sync do arquivo para imediatamente.
```
chattr +S
```
- Ativar o sync em um diretório. CUIDADO. Este atributo grava os arquivos no disco sem passar pelo buffer e diminui a performace do sistema
```
chatt +D diretorio
```
