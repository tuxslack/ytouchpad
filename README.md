# ytouchpad
Para quem deseja controlar o touchpad de forma automatizada e fácil (Habilita, desabilita ou exiba o status do touchpad). 


<img src="https://raw.githubusercontent.com/tuxslack/ytouchpad/refs/heads/master/touchpad-linux.png" width="500" />

Padrão: 

O script apenas monitore e exiba o status do touchpad sem chamar a função de controle do touchpad que altera seu estado (ferramenta).
Se você quiser reabilitar a função no futuro, basta remover o # para ativá-la novamente.
Isso garante que o script apenas monitore e exiba o status do touchpad sem chamar a função de controle do touchpad que altera seu estado.

--------------------------------------------------------------------------------------------------------------------------------------------

Este script é destinado a automatizar o processo de verificação e controle do touchpad em notebook com Linux. Ele 
possui diversas funções que permitem verificar se o touchpad está habilitado ou desabilitado e oferece uma interface gráfica (Yad) 
para o usuário escolher a opção desejada.

1. Verificação de Drivers e ferramentas disponíveis:

    O script verifica se o driver Synaptics está instalado e carregado. Se não estiver, ele verifica se o pacote synclient
   (ferramenta para controlar o touchpad com Synaptics) está instalado. Caso o driver não esteja instalado, o script sugere a instalação do
   pacote xserver-xorg-input-synaptics.
   
    Se o sistema não usar o Synaptics, o script verifica se o driver libinput está presente (o driver mais recente em muitas distribuições Linux).
   Caso o synclient não funcione, o script usa o xinput, que é uma ferramenta genérica para gerenciar dispositivos de entrada, como o touchpad.

2. Controle do Touchpad:

    O script possui duas funções principais para habilitar ou desabilitar o touchpad:
   
        disable_touchpad: Desabilita o touchpad (usando synclient TouchpadOff=1 ou xinput disable).
        enable_touchpad: Habilita o touchpad (usando synclient TouchpadOff=0 ou xinput enable).
   
    O script exibe uma interface gráfica usando Yad com dois botões: "Desabilitar Touchpad" e "Habilitar Touchpad". O usuário pode clicar no botão desejado
   para executar a ação correspondente.

3. Verificação Contínua do Status do Touchpad:

    O script monitora continuamente o status do touchpad e envia notificações para o usuário, indicando se o touchpad está ativado ou desativado. Para isso,
   utiliza o notify-send, que exibe notificações na área de trabalho.

4. Compatibilidade com distribuições antigas e recentes:

    O script detecta automaticamente qual driver está em uso: Synaptics (para distribuições mais antigas) ou libinput (para distribuições mais recentes).
    Se o synclient estiver disponível, ele chama a função distro_antiga, que usa o comando synclient. Caso contrário, ele chama a função distro_recente,
   que utiliza o xinput para gerenciar o touchpad.


5. Fluxo do Script:

    O script começa verificando a disponibilidade de drivers e ferramentas.
    Em seguida, dependendo do driver disponível, o script utiliza a ferramenta adequada para controlar o touchpad.
    Ao longo da execução, ele monitora o status do touchpad e envia notificações sempre que o status mudar.


Conclusão:

Esse script é útil para quem deseja controlar o touchpad de forma automatizada e fácil, com notificações e uma interface gráfica. Ele é adaptável para diferentes 
drivers (Synaptics ou libinput), verifica automaticamente o ambiente e ajusta seu comportamento, e oferece uma maneira prática de desabilitar ou habilitar o 
touchpad no Linux.

