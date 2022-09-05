### top
```
m >> Muda a forma que a memória é exibida
1 >> Muda a forma de exibição do CPU

M >> Classifica por uso de memória
F >> Abre o seletor de classificação
k >> Disponibiliza campo para matar processos
d >> Altera o delay de atualização
W >> Salva customização
```

### top na linha de comandos
```
top -i >> Ignora os processos zumbis
top -c >> Exibe a linha de comandos na listagem do processo
```

### nice/renice (prioridade padrão 0; maior prioridade -20; menor prioridade 19)
```
Obs.: Prioridades abaixo de 0 apenas o root tem permissão de alterar
nice -n 10 sleep 1000 >> O processo sleep iniciaria com prioridade 10
renice -n 15 -p 597 >> O processo 597 seria reajustado com nice = 15
renice -n 15 -u teste >> Todos os processos do usuário teste rodariam com prioridade 15
renice -n 15 -g teste >> Todos os processos do grupo teste rodariam com prioridade 15
```

### tload
```
tload >> Exibe de forma gráfica um resumo dos processos rodando
```

### vmstat
```
vmstat >> Exibe um resumo do uso de memória, cpu, swap, system e io
vmstat 1 >> Exibe atualização a cada 1 segundo
```

### ps
```
ps >> Exibe os processos rodando no terminal corrent
ps -a >> Exibe os processos rodando em todos os terminais
ps -ax >> Exibe os processos de todos os usuários do sistema sendo de terminais ou não
ps -aux >> Exibe os processos de todos os usuários
ps -axm >> Exibe detalhes do uso de memória
ps -axew >> Exibe as variáveis de ambientes utilizdas na execução do comando (o w server para exibir toda alinha)
ps -aux --sort=pid >> Classifica a saída com base no pid
ps -ax --sort=rss >> Classifia a saída com base na memória residente (RSS)
```

### pidof
```
pidof cron >> Vai retornar o PID do processo do cron (obs. É necessário passar o nome exato do programa rodando)
```

### pstree
```
pstree >> Exibe os processos em forma de "arvore"
pstree -c >> Exibe toda a estrutura, incluindo os processos PAI
pstree -h >> Exibe a estrutura destacando o processo PAI
pstree -p >> Exibe o PID dos processos entre ()
```

### kill
```
kill -9 >> Mata o processo de forma forçada
kill -HUP >> Manda o processo reler as configurações sem finalizar
kill %3 >> Mata um job que esteja rodando em segundo plano
```

### pgrep
```
pgrep sshd >> Vai pesquisar todos os processos que possuem sshd e retornar o PID
pgrep -u root sshd >> Vai exibir o PID de todos os processos do usuário root que tenham sshd
```

### pkill
```
pkill firefox >> Vai matar todos os processos que tenha firefox 
pkill -u root firefox >> Vai matar todos os processos do usuário root que tenha firefox
```

### killall
```
killall -u root firefox >> Vai matar todos os processos do usuáro root que tenha firefox
killall5 >> Mata todos os processos
```

### nohup
```
nohup sleep 200 >> O nohup "proteje" o processo em execução pra que ele não seja afetado por sinais de interrupções (diferentes de kill -9 ou kill -15)
```

### &
```
sleep 100 & >> Inicia o programa sleep em backgraound
```

### CTRL + z
```
CTRL+z >> Envia um programa que já está rodando para backgraund
```

### jobs
```
jobs >> Exibe os processos que estão rodando em background
```

### bg
```
bg %3 >> Inicia um programa parado em background (um programa enviado para background pelo CTRL+x não inicia automaticamente. É necessário utilizar o comando bg)
```

### fg
```
fg %3 >> Envia o processo 3 para rodar em foreground
```

### kill
```
kill %3 >> Mata o programa que está rodando em background e que tem o número do job 3
```
