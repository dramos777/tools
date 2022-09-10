### free
- Exibir informações da memória física e swap da estação
```
free
```
- Exibir em kilobytes (bloco de 1000)
```
free --kilo
```
- Exibir em kilobytes (bloco de 1024)
```
free --kibi
```
- Exibir em megabytes (bloco de 1000)
```
free --mega
```
- Exibir em megabytes (bloco de 1024)
```
free --mebi
```
- Exibir em gigabytes (bloco de 1000)
```
free --giga
```
- Exibir em gigabytes (bloco de 1024)
```
free --gibi
```

Exibir em megabytes a cada 1 segundo
```
free --mega -s 1
```

### lsof
- Exibir os arquivos do diretório /var abertos e o PID do processo
```
lsof /var >> Vai exibir os arquivos do diretório /var abertos e o PID do processo
```
- Exibir o PID do processo dos arquivos abertos no diretório /var
```
lsof -t /var >> Vai exibir o PID do processo dos arquivos abertos no diretório /var
```

### top

**m** --> Muda a forma que a memória é exibida

**1** --> Muda a forma de exibição do CPU


**M** --> Classifica por uso de memória

**F** --> Abre o seletor de classificação

**k** --> Disponibiliza campo para matar processos

**d** --> Altera o delay de atualização

**W** --> Salva customização


### top na linha de comandos
- Ignorar os processos zumbis
```
top -i
```
- Exibir a linha de comandos na listagem do processo
```
top -c
```

### vmstat
- Exibir um resumo do uso de memória, cpu, swap, system e io
```
vmstat >> Exibe um resumo do uso de memória, cpu, swap, system e io
```
- Exibir atualização do resumo da memória a cada 1 segundo
```
vmstat 1 >> Exibe atualização a cada 1 segundo
```

### ps
- Exibir os processos rodando no terminal corrent
```
ps
```
- Exibir os processos rodando em todos os terminais
```
ps -a
```
- Exibir os processos de todos os usuários do sistema sendo de terminais ou não
```
ps -ax
```
- Exibir os processos de todos os usuários
```
ps -aux
```
- Exibir detalhes do uso de memória
```
ps -axm
```
- Exibir as variáveis de ambientes utilizdas na execução do comando (o w server para exibir toda alinha)
```
ps -axew
```
- Classificar a saída com base no pid
```
ps -aux --sort=pid
```
- Classificar a saída com base na memória residente (RSS)
```
ps -ax --sort=rss
```
