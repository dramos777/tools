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

### nice/renice (prioridade padrão 0; maior prioridade -20; menor prioridade 19)
**Obs**.: Prioridades abaixo de 0 apenas o root tem permissão para alterar
- Iniciar o processo sleep com prioridade 10
```
nice -n 10 sleep 1000
```
- Reajustar a prioridade do processo 597 com nice = 15
```
renice -n 15 -p 597
```
- Reajustar todos os processos do usuário teste com prioridade 15
```
renice -n 15 -u teste
```
- Reajustar todos os processos do grupo teste com prioridade 15
```
renice -n 15 -g teste
```

### tload
- Exibir de forma gráfica um resumo dos processos rodando
```
tload
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

### pidof
- Exibir o PID do processo do cron (obs. É necessário passar o nome exato do programa rodando)
```
pidof cron
```

### pstree
- Exibir os processos em forma de "arvore"
```
pstree
```
- Exibir toda a estrutura, incluindo os processos PAI
```
pstree -c
```
- Exibir a estrutura destacando o processo PAI
```
pstree -h
```
- Exibir o PID dos processos entre ()
```
pstree -p
```

### kill
- Matar o processo de forma forçada
```
kill -9
```
- Mandar o processo reler as configurações sem finalizar
```
kill -HUP
```
- Matar um job que esteja rodando em segundo plano
```
kill %3
```

### pgrep
- Pesquisar todos os processos que possuem sshd e retornar o PID
```
pgrep sshd
```
- Exibir o PID de todos os processos do usuário root que tenham sshd
```
pgrep -u root sshd
```

### pkill
- Matar todos os processos que tenha firefox 
```
pkill firefox
```
- Matar todos os processos do usuário root que tenha firefox
```
pkill -u root firefox
```

### killall
- Matar todos os processos do usuáro root que tenha firefox
```
killall -u root firefox
```
- Matar todos os processos
```
killall5
```

### nohup
O nohup "proteje" o processo em execução pra que ele não seja afetado por sinais de interrupções que sejam diferentes de kill -9 ou kill -15. Ex:
```
nohup sleep 200
```

### &
- Iniciar o programa sleep em backgraound
```
sleep 100 &
```

### CTRL + z
- Enviar um programa que já está rodando em foreground para backgraund
```
CTRL+z
```

### jobs
- Exibir os jobs que estão rodando em background
```
jobs
```

### bg
- Iniciar um programa com ID 3 que está parado em background (um programa enviado para background pelo CTRL+x não inicia automaticamente. É necessário utilizar o comando bg)
```
bg %3
```

### fg
- Enviar o job 3 rodando em background para foreground
```
fg %3
```

### kill
- Mata o job 3 de um programa que está rodando em background
```
kill %3
```
