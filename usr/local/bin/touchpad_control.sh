#!/usr/bin/env bash
#
# Autor:    Fernando Souza - https://www.youtube.com/@fernandosuporte/
# Data:     19/03/2025 as 16:07:50
# Homepage: https://github.com/tuxslack/ytouchpad
# Licença:  GPL
#

# Descrição: Para habilitar ou desabilitar o touchpad.


# Como desabilitar o touchpad do notebook no Linux?


# As vezes quando estamos fazendo alguma tarefa que precisa utilizar mais o teclado, pode 
# acontecer de ficar tocando o touchpad, e isso atrapalha na produtividade, alguns notebooks 
# vem com uma tecla para desabilitar, mas se o seu teclado não possue essa tecla?



# Este script é destinado a automatizar o processo de verificação e controle de um touchpad 
# em um notebook com Linux. Ele possui diversas funções que permitem verificar se o touchpad 
# está habilitado ou desabilitado e oferece uma interface gráfica para o usuário escolher a 
# opção desejada. 

# Esse script é útil para quem deseja controlar o touchpad de forma automatizada e fácil, 
# com notificações e uma interface gráfica. Ele é adaptável para diferentes drivers 
# (Synaptics ou libinput), verifica automaticamente o ambiente e ajusta seu comportamento, 
# e oferece uma maneira prática de desabilitar ou habilitar o touchpad em um sistema Linux.


# Compatibilidade com Distribuições Antigas e Recentes:

#  O script detecta automaticamente qual driver está em uso: Synaptics (para distribuições 
# mais antigas) ou libinput (para distribuições mais recentes).
#
#  Se o synclient estiver disponível, ele chama a função distro_antiga, que usa o comando 
# synclient. Caso contrário, ele chama a função distro_recente, que utiliza o xinput para 
# gerenciar o touchpad.


# Verificação Contínua do Status do Touchpad:

#  O script monitora continuamente o status do touchpad e envia notificações para o usuário, 
# indicando se o touchpad está ativado ou desativado. Para isso, utiliza o notify-send, que 
# exibe notificações na área de trabalho.




# O Indicador do Touchpad geralmente se refere a uma função ou ícone que exibe informações 
# sobre o estado do touchpad do seu dispositivo. Ele pode ter algumas finalidades, dependendo 
# do sistema operacional ou da configuração do seu computador. Aqui estão as funções mais 
# comuns:
# 
# 1. Mostrar se o Touchpad Está Ativo ou Desativado:
# 
#     Muitos laptops possuem um ícone ou indicador visual que mostra se o touchpad está 
# ativado ou desativado. Isso é útil quando você desativa o touchpad, por exemplo, para 
# evitar toques acidentais enquanto digita.
# 
# 2. Ajuste da Sensibilidade ou Configurações do Touchpad:
# 
#    Alguns sistemas permitem que o indicador também seja uma forma de acessar rapidamente 
# as configurações do touchpad, como a sensibilidade, a velocidade de movimento do ponteiro 
# ou o comportamento dos gestos (scroll, zoom, etc.).
# 
# 3. Alertar Sobre o Status do Dispositivo:
# 
#    Alguns touchpads têm LEDs ou indicadores visuais que acendem ou piscam para indicar 
# problemas, como falhas ou desconexão do dispositivo.
# 
# 4. Ajuste de Funções Avançadas:
# 
#    Em alguns dispositivos, o indicador também pode ser uma maneira de alternar entre 
# diferentes modos do touchpad (como habilitar gestos multitouch, por exemplo).
# 
# Onde você encontra o Indicador:
# 
#    Barra de tarefas: Em muitos laptops, você pode ver um ícone na bandeja do sistema 
# (canto inferior direito) que indica o status do touchpad.
# 
#    Ajustes/Configurações: No painel de controle do seu sistema operacional (Windows, 
# macOS, Linux), você pode acessar as configurações de dispositivos de entrada, incluindo 
# o touchpad.



# OpenBox

# Para configurar a tecla Fn + F7 para chamar um script no Openbox, você precisará editar 
# alguns arquivos de configuração. O Openbox não possui suporte direto para teclas de função 
# (como Fn) via sua própria configuração, mas você pode usar ferramentas como xbindkeys para 
# mapear teclas e chamar o script que deseja.

# Instalar xbindkeys e xev


# Identificar a tecla Fn + F7 com o xev

#     Execute o comando xev no terminal.

#     Uma nova janela será aberta. Agora, pressione Fn + F7 e observe o terminal onde o 
#     xev está rodando.

#     Ele vai mostrar várias informações sobre o evento da tecla pressionada. 

# state 0x0, keycode 68 (keysym 0xffc7, F7), same_screen YES,

# O código keycode associado à tecla F7 será algo como 68 no exemplo acima. Esse número 
# pode variar dependendo do seu teclado.


# Configurar o xbindkeys para Mapear a Tecla

# crie o arquivo de configuração

# xbindkeys --defaults > ~/.xbindkeysrc

# nano ~/.xbindkeysrc

# Agora, adicione uma linha para mapear o keycode identificado (vamos assumir que o 
# keycode da tecla F7 seja 68) para chamar o script. No exemplo, vamos chamar o script 
# touchpad_control.sh.

# Adicione uma linha como esta:

# "bash /usr/local/bin/touchpad_control.sh"
#     m:0x0 + c:68

# Aqui, c:68 é o código da tecla (que você obteve com o xev) e o comando após a " " é o 
# que será executado quando a tecla for pressionada.


# Reiniciar o xbindkeys

# Para carregar a nova configuração, reinicie o xbindkeys:

# pkill xbindkeys
# xbindkeys

# Ou, se você quiser executar o xbindkeys automaticamente ao iniciar, adicione essa linha 
# no seu arquivo de inicialização do Openbox (geralmente ~/.config/openbox/autostart).

# Testar

# Agora, pressione Fn + F7 e veja se o script é executado.



# Se a tecla Fn não for detectada diretamente (o que é comum em alguns teclados), você 
# pode precisar usar um código diferente para o F7, ou tentar outra ferramenta como 
# input-remapper para mapear as teclas Fn, já que o comportamento das teclas Fn pode variar 
# dependendo do hardware.




# Atualizações: Teclas Sonorizadas (para tocar um som ao acionar), se quiser.



# Arquivos:
#
# /usr/local/bin/touchpad_control.sh
# /usr/share/icons/extras/touchpad-indicator.png
# /usr/share/applications/Touchpad Indicator.desktop



# Dê permissão de execução ao script:

# chmod +x /usr/local/bin/touchpad_control.sh


# Execute o script com usuário comum:

# touchpad_control.sh



# Modelo: Vaio FE15

# Laptop Vaio FE15 o touchpad não funciona quando rodo o Zorin, já fiz alguns comandos 
# para forçar a instalação de synaptcis e até atualizei algum comando no Grupo, mas não 
# adiantou. No Windows funcionava normalmente, porém depois de alguns destes comandos 
# ele parou de funcionar também no Windows. Além disso quando rodo Linux e depois reinício 
# no Windows a hora fica 3 horas adiantadas, já dei comando no Zorin também para que o 
# UTC fique fixo mas não adiantou.


# https://plus.diolinux.com.br/t/touchpad-nao-funciona-zorin-os/72226
# https://www.vivaolinux.com.br/dica/Ligar-e-Desligar-Touchpad-do-Notebook-no-LXDE
# https://meumundotux.blogspot.com/2019/08/como-instalar-um-programa-indicador-de.html
# https://ubuntuhandbook.org/index.php/2021/10/disable-touchpad-typing-option-not-working/
# https://www.noobslab.com/2013/08/touchpad-indicator-updated-and-fixed.html
# https://franciscochaves.com.br/blog/habilitar-ou-desabilitar-o-touchpad-no-xubuntu/
# https://www.maketecheasier.com/disable-touchpad-on-startup-linux/


clear


# Variáveis

# ----------------------------------------------------------------------------------------

# Cores para formatação da saída dos comandos

RED='\e[1;31m'
GREEN='\e[1;32m'
YELLOW='\e[1;33m'
NC='\e[0m' # sem cor

# ----------------------------------------------------------------------------------------

intervalo="2"  # Intervalo de tempo entre verificações (em segundos)


# Tempo que a notificação ficará visível (em milissegundos)

tempo_notificacao="20000"  # 20000 ms = 20 segundos - Definir o tempo da notificação


# Ícone da notificação (alterar se necessário)

logo="/usr/share/icons/extras/touchpad-indicator.png"

# logo="touchpad-icon"     



# ----------------------------------------------------------------------------------------

# Definir caminho do arquivo de áudio


# Este arquivo de som é tocado quando um dispositivo é adicionado ao sistema. Isso pode 
# acontecer quando você conecta um novo hardware, como um mouse, teclado, headset, pendrive, 
# dispositivo de áudio, ou qualquer outro dispositivo reconhecido pelo sistema.

# Exemplo: Quando você conecta um dispositivo USB ao computador, o som device-added.oga 
# pode ser reproduzido para alertar o usuário de que o novo dispositivo foi detectado e 
# está pronto para ser utilizado.



# Verifica se algum dos arquivos existe e atribui o caminho à variável

if [ -f "/usr/share/sounds/freedesktop/stereo/device-added.oga" ]; then
    device_added="/usr/share/sounds/freedesktop/stereo/device-added.oga"

elif [ -f "/usr/share/sounds/gnome/default/alerts/drip.ogg" ]; then
    device_added="/usr/share/sounds/gnome/default/alerts/drip.ogg"

elif [ -f "/usr/share/sounds/LinuxMint/stereo/system-ready.ogg" ]; then
    device_added="/usr/share/sounds/LinuxMint/stereo/system-ready.ogg"
else
    # Caso nenhum arquivo seja encontrado, a variável pode ser deixada vazia ou com um valor padrão
    device_added=""
fi

# Exibe o valor da variável
# echo "Arquivo atribuído à variável device_added: $device_added"



# Este arquivo de som é tocado quando um dispositivo é removido do sistema. Isso pode 
# ocorrer quando você desconecta um dispositivo ou quando um dispositivo é desativado ou 
# removido fisicamente do sistema.

# Exemplo: Quando você retira um pen drive ou desconecta um dispositivo USB, o som 
# device-removed.oga é reproduzido para informar ao usuário que o dispositivo foi removido.


# Verifica se algum dos arquivos "device_removed" existe e atribui o caminho à variável
if [ -f "/usr/share/sounds/freedesktop/stereo/device-removed.oga" ]; then
    device_removed="/usr/share/sounds/freedesktop/stereo/device-removed.oga"

elif [ -f "/usr/share/sounds/LinuxMint/stereo/dialog-error.ogg" ]; then
    device_removed="/usr/share/sounds/LinuxMint/stereo/dialog-error.ogg"

elif [ -f "/usr/share/sounds/gnome/default/alerts/sonar.ogg" ]; then
    device_removed="/usr/share/sounds/gnome/default/alerts/sonar.ogg"
else
    # Caso nenhum arquivo seja encontrado, a variável pode ser deixada vazia ou com um valor padrão
    device_removed=""
fi

# Exibe o valor da variável
# echo "Arquivo atribuído à variável device_removed: $device_removed"



# O som dialog-warning.oga é associado a notificações de alerta ou avisos importantes no 
# sistema.

# Ele é tipicamente reproduzido em resposta a eventos que exigem a atenção do usuário, mas 
# que não são necessariamente erros críticos. A intenção é alertar o usuário sobre algo que 
# precisa ser observado ou corrigido, sem ser tão grave quanto uma mensagem de erro.




# Verifica se algum dos arquivos "warning_sound" existe e atribui o caminho à variável
if [ -f "/usr/share/sounds/freedesktop/stereo/dialog-warning.oga" ]; then
    warning_sound="/usr/share/sounds/freedesktop/stereo/dialog-warning.oga"

elif [ -f "/usr/share/sounds/LinuxMint/stereo/dialog-warning.ogg" ]; then
    warning_sound="/usr/share/sounds/LinuxMint/stereo/dialog-warning.ogg"
else
    # Caso nenhum arquivo seja encontrado, a variável pode ser deixada vazia ou com um valor padrão
    warning_sound=""
fi

# Exibe o valor da variável
# echo "Arquivo atribuído à variável warning_sound: $warning_sound"



# ----------------------------------------------------------------------------------------


# Início das funções



# Função para verificar se o comando está instalado

verificar_comando() {

    comando=$1

    if ! command -v "$comando" &> /dev/null; then


        echo -e "${RED}\nErro: O comando $comando não está instalado. \n ${NC}"

        sleep 1


        notify-send -i "$logo" -t $tempo_notificacao "Controle do Touchpad" "Erro: O comando $comando não está instalado."



       # Verifica se o arquivo existe

       if [ -f "$warning_sound" ]; then

          paplay "$warning_sound"

       fi





        exit 1

    fi

}


# Verificar se xinput e notify-send estão instalados

# verificar_comando "synclient"

# verificar_comando "xinput"

verificar_comando "notify-send"

verificar_comando "paplay"

# verificar_comando "yad"

# verificar_comando "inxi"



# No Void Linux

# sudo xbps-install -y xinput


# No Debian

# sudo apt install -y xinput



# Sons padrão do sistema para notificações


# No Void Linux:

# sudo xbps-install -S freedesktop-sound-theme


# No Debian:

# sudo apt-get install freedesktop-sound-theme


# ----------------------------------------------------------------------------------------


# Para controlar as configurações de touchpad


# O comando synclient foi muito utilizado no passado em distribuições Linux para controlar 
# as configurações de touchpad, especialmente quando o driver Synaptics estava instalado. 
# No entanto, nas distribuições mais recentes, o libinput tem substituído o Synaptics como 
# o driver padrão para touchpads, o que pode fazer com que o comando synclient não funcione 
# corretamente em sistemas mais novos.





# Ajuda a identificar se o driver Synaptics está ativo ou não no sistema.

distro_antiga(){


    # Tentando verificar a instalação do pacote...


    # Verificar se o pacote Synaptics está instalado

    if command -v synclient &> /dev/null; then


        echo -e "${GREEN}\nO pacote Synaptics está instalado. \n ${NC}"

        sleep 1


    else


        echo -e "${RED}\nO pacote Synaptics NÃO está instalado. \n ${NC}"

        sleep 1


        # yad --center --window-icon="$logo" --title="Erro" --text="O synclient não está instalado. Instale o pacote 'xserver-xorg-input-synaptics'." --buttons-layout=center --button=OK:0


        # Se o synclient não estiver instalado, instale o pacote xserver-xorg-input-synaptics:


        # Instalar o driver Synaptics

        # Se o driver Synaptics não estiver instalado, você precisará instalá-lo. No Ubuntu 
        # ou em distribuições baseadas no Debian.

        # sudo apt-get update

        # sudo apt-get install -y xserver-xorg-input-synaptics

        # Esse comando instala o pacote necessário para o driver Synaptics, que inclui a 
        # ferramenta synclient.



        exit 1

    fi




# Se a sua distribuição ainda usa o driver Synaptics para o touchpad, então o comando synclient pode funcionar.

# Para desativar o touchpad:

# synclient TouchpadOff=1


# Para ativar o touchpad:

# synclient TouchpadOff=0




# Função para desabilitar o touchpad

disable_touchpad() {


    # echo "off" | sudo tee /sys/class/input/*/device/power/control  # Para desabilitar

    synclient TouchpadOff=1



# Desativar o touchpad na inicialização

# mkdir -p ~/.config/autostart/

# echo "
# [Desktop Entry]
# Type=Application
# Name=Disable touchpad
# Name[en_US]=Disable touchpad
# Name[pt]=Desativar touchpad
# Name[pt_BR]=Desativar touchpad
# GenericName=Touchpad disabler
# Comment=Disables touchpad
# Comment[pt]=Desativa touchpad
# Comment[pt_BR]=Desativa touchpad
# Exec=synclient TouchpadOff=1
# StartupNotify=true
# Terminal=false
# " > ~/.config/autostart/disable-touchpad.desktop


# chmod +x ~/.config/autostart/disable-touchpad.desktop


# Depois que o arquivo estiver na pasta autostart, tudo o que você precisa fazer é reiniciar 
# sua máquina. Ao fazer isso, você notará que não poderá mais usar seu touchpad. Obviamente, 
# isso ocorre por causa do arquivo .desktop que acabou de ser colocado.

    echo -e "${RED}\nTouchpad desabilitado! \n ${NC}"

    sleep 1


     # Verifica se o arquivo existe

     if [ -f "$device_removed" ]; then

        paplay "$device_removed"

     fi 


    yad --center --window-icon="$logo" --title="Controle do Touchpad" --text="Touchpad desabilitado!" --buttons-layout=center --button=OK:0

}


# Função para habilitar o touchpad

enable_touchpad() {



     # echo "auto" | sudo tee /sys/class/input/*/device/power/control  # Para habilitar



     synclient TouchpadOff=0




# Reativando o touchpad

# Se você quiser reativar permanentemente o touchpad, navegue no seu gerenciador de arquivos 
# para ~/.config/autostart e exclua o arquivo "disable-touchpad.desktop". No entanto, se 
# você precisar dele apenas temporariamente, insira o seguinte comando acima em um terminal.


    # rm ~/.config/autostart/disable-touchpad.desktop


# Alterar 0 para 1 é semelhante a Verdadeiro e Falso. 1 o mantém desabilitado, 0 o mantém 
# desligado. Saber esse comando é ótimo, porque você pode habilitá-lo pelo tempo que precisar, 
# depois é só reiniciar (ou desligar sua máquina) e quando ligá-lo novamente, o touchpad 
# estará desabilitado novamente.


    echo -e "${GREEN}\nTouchpad habilitado! \n ${NC}"

    sleep 1



    # Verifica se o arquivo existe

    if [ -f "$device_added" ]; then

        paplay "$device_added"

    fi


    yad --center --window-icon="$logo" --title="Controle do Touchpad" --text="Touchpad habilitado!" --buttons-layout=center --button=OK:0

}



# Exibir a interface com dois botões

# Ao executar o script, será aberta uma janela com dois botões: "Desabilitar Touchpad" e 
# "Habilitar Touchpad". Você poderá desabilitar ou habilitar o touchpad clicando nos 
# respectivos botões.


# A recomendação de adicionar a opção -r ao comando read surge principalmente quando você 
# está lidando com entradas de dados que podem conter caracteres de escape, como barras 
# invertidas. No seu caso, no entanto, a saída do comando yad será apenas um número (1 ou 2), 
# o que não deveria causar problemas com ou sem a opção -r.


# Isso vai garantir que, caso você use entradas mais complexas no futuro, o read não terá 
# problemas com barras invertidas.


yad --center \
    --window-icon="$logo" \
    --title="Controle do Touchpad - synclient" \
    --buttons-layout=center \
    --button="Desabilitar Touchpad:1" \
    --button="Habilitar Touchpad:2" \
    --width="400" --height="150" \
    --text="Escolha uma opção para o touchpad:" \
    --form \
     | while read -r button_id; do

        case $button_id in

            1) disable_touchpad ;;

            2) enable_touchpad ;;

        esac

    done



}


# ----------------------------------------------------------------------------------------

# Para controlar as configurações de touchpad


distro_recente(){


# Caso o synclient não esteja disponível, ou se não funcionar corretamente, é provável que 
# sua distribuição esteja usando o libinput como driver.

# Caso esteja usando o libinput (mais comum nas distribuições atuais):

# Se o comando synclient não funcionar, o libinput é provavelmente o responsável pelo 
# controle do touchpad. Nesse caso, você pode usar xinput ou ferramentas específicas como 
# libinput para gerenciar o touchpad.

# Desabilitar o touchpad com xinput:

#     Liste os dispositivos de entrada:

# xinput list

# Identifique o seu touchpad (pode ser algo como "SynPS/2 Synaptics TouchPad" ou "ETPS/2 Elantech Touchpad").

# Para desativar:

# xinput disable "Nome do Touchpad"

# Para ativar:

#     xinput enable "Nome do Touchpad"


# Conclusão:

# synclient funciona com o driver Synaptics. Se você está em uma distribuição recente que 
# usa libinput, você precisará usar xinput para controlar o touchpad.
# 
# Se o comando synclient TouchpadOff=1 não funcionar, verifique se o driver Synaptics está 
# instalado ou considere usar xinput com libinput.





# Nome do dispositivo touchpad (pode ser alterado conforme o nome do seu touchpad)

touchpad_name=$(xinput list --name-only | grep -i 'touchpad')

if [[ -z "$touchpad_name" ]]; then


    echo -e "${RED}\nTouchpad não encontrado! \n ${NC}"

    sleep 1




    # Verifica se o arquivo existe

    if [ -f "$device_removed" ]; then

        paplay "$device_removed"

    fi


    yad --center --window-icon="$logo" --title="Controle do Touchpad" --text="Touchpad não encontrado!" --buttons-layout=center --button=OK:0  --width="300"

    exit 1

fi


# Função para desabilitar o touchpad

disable_touchpad() {

    xinput disable "$touchpad_name"


# Desativar o touchpad na inicialização

# mkdir -p ~/.config/autostart/

# echo "
# [Desktop Entry]
# Type=Application
# Name=Disable touchpad
# Name[en_US]=Disable touchpad
# Name[pt]=Desativar touchpad
# Name[pt_BR]=Desativar touchpad
# GenericName=Touchpad disabler
# Comment=Disables touchpad
# Comment[pt]=Desativa touchpad
# Comment[pt_BR]=Desativa touchpad
# Exec=xinput disable "$touchpad_name"
# StartupNotify=true
# Terminal=false
# " > ~/.config/autostart/disable-touchpad.desktop


# chmod +x ~/.config/autostart/disable-touchpad.desktop


# Depois que o arquivo estiver na pasta autostart, tudo o que você precisa fazer é reiniciar 
# sua máquina. Ao fazer isso, você notará que não poderá mais usar seu touchpad. Obviamente, 
# isso ocorre por causa do arquivo .desktop que acabou de ser colocado.


    echo -e "${RED}\nTouchpad desabilitado! \n ${NC}"

    sleep 1




    # Verifica se o arquivo existe

    if [ -f "$device_removed" ]; then

        paplay "$device_removed"

    fi


    yad --center --window-icon="$logo" --title="Controle do Touchpad" --text="Touchpad desabilitado!" --buttons-layout=center --button=OK:0 --width="300"

}


# Função para habilitar o touchpad

enable_touchpad() {

    xinput enable "$touchpad_name"


# Reativando o touchpad

# Se você quiser reativar permanentemente o touchpad, navegue no seu gerenciador de arquivos 
# para ~/.config/autostart e exclua o arquivo "disable-touchpad.desktop". No entanto, se 
# você precisar dele apenas temporariamente, insira o seguinte comando acima em um terminal.


    # rm ~/.config/autostart/disable-touchpad.desktop


    echo -e "${GREEN}\nTouchpad habilitado! \n ${NC}"

    sleep 1



    # Verifica se o arquivo existe

    if [ -f "$device_added" ]; then

        paplay "$device_added"

    fi


    yad --center --window-icon="$logo" --title="Controle do Touchpad" --text="Touchpad habilitado!" --buttons-layout=center --button=OK:0 --width="300"
}


# Exibir a interface com dois botões

# Quando você executar o script, uma janela será aberta com os botões 
# "Desabilitar Touchpad" e "Habilitar Touchpad". Ao clicar em cada um, o 
# touchpad será desabilitado ou habilitado, respectivamente.

yad --center \
    --window-icon="$logo" \
    --title="Controle do Touchpad - libinput" \
    --buttons-layout=center \
    --button="Desabilitar Touchpad:1" \
    --button="Habilitar Touchpad:2" \
    --width="400" --height="150" \
    --text="Escolha uma opção para o touchpad:" \
    --form \
     | while read -r button_id; do

        case $button_id in

            1) disable_touchpad ;;

            2) enable_touchpad ;;

        esac

    done



}

# ----------------------------------------------------------------------------------------




ferramenta(){


# Verificar qual ferramenta está disponível

if command -v synclient &> /dev/null; then

    # Tem o synclient

    distro_antiga


else

    # Tem o libinput

# O libinput é uma biblioteca open-source utilizada para gerenciar a entrada de dispositivos 
# como mouses, teclados, telas sensíveis ao toque, touchpads e outros dispositivos apontadores 
# no Linux. Ela é usada para fornecer uma interface unificada entre o kernel do Linux e as 
# aplicações que precisam interagir com dispositivos de entrada.
# 
# O libinput é uma parte importante no stack de entrada de muitos sistemas Linux, especialmente 
# em distribuições que usam o servidor gráfico Xorg ou o Wayland. Ele fornece funções como:
# 
# 
#     Gestão de gestos e toques em dispositivos de tela sensível ao toque e touchpads.
#     Ajuste de configurações para mouses e outros dispositivos de entrada, como a 
# aceleração do ponteiro.
# 
#     Detecção de múltiplos pontos de toque em telas sensíveis ao toque.
#     Suporte a diferentes dispositivos de entrada e como eles interagem com o sistema.

# Ele substitui outras bibliotecas de entrada antigas, como o evdev, e é uma escolha mais 
# moderna para muitas distribuições Linux. O libinput é também utilizado para implementar 
# comportamentos como os gestos de toque em laptops e tablets, e pode ser configurado para 
# melhorar a experiência do usuário com diferentes dispositivos de entrada.


    distro_recente

fi


}

# ----------------------------------------------------------------------------------------


# Para verifica se o touchpad está habilitado ou não, sem usar o xinput


# 1. Verificar a configuração do touchpad no diretório /sys/class/input

# O diretório /sys/class/input/ contém informações sobre os dispositivos de entrada. Para 
# verificar se o touchpad está habilitado ou não, você pode procurar no arquivo que 
# corresponde ao dispositivo de entrada.

# Primeiro, encontre o nome do dispositivo touchpad no diretório /sys/class/input/

# ls /sys/class/input/

# Procure por um diretório relacionado ao seu touchpad. O nome pode ser algo como eventX 
# ou mouseX (onde X é um número). Por exemplo, eventX é um arquivo de entrada que representa 
# um dispositivo.

# Para verificar se o dispositivo está habilitado ou desabilitado, você pode procurar um 
# arquivo chamado enabled dentro do diretório do dispositivo.

#     cat /sys/class/input/eventX/device/enable

#     Se o conteúdo for 1, o dispositivo está habilitado. Se for 0, está desabilitado.


# 2. Verificar no arquivo /proc/bus/input/devices

# Você pode buscar por dispositivos touchpad no arquivo /proc/bus/input/devices, mas além 
# de verificar a presença do touchpad, também é possível verificar se ele está habilitado 
# ou não com base nos eventos.

# Execute o seguinte comando para procurar por um touchpad no arquivo /proc/bus/input/devices:

# cat /proc/bus/input/devices | grep -i touchpad

# Se encontrar uma entrada correspondente ao touchpad, você pode tentar buscar mais 
# informações sobre o estado do dispositivo. No entanto, isso pode não indicar diretamente 
# se o touchpad está "habilitado" ou "desabilitado".


# 3. Usando o comando evtest

# Se você tem o comando evtest instalado (que é uma ferramenta para testar eventos de 
# dispositivos de entrada), você pode usá-lo para verificar se o dispositivo touchpad está 
# gerando eventos e, assim, saber se está ativo.

#   Execute o seguinte comando para listar os dispositivos de entrada disponíveis:

#   sudo evtest

#   Escolha o dispositivo relacionado ao touchpad e veja se ele está gerando eventos. Se 
# o touchpad não gerar eventos, isso pode indicar que ele está desabilitado.


# 4. Verificar o arquivo de configuração do libinput

# Se o seu sistema usa libinput, você pode verificar o status do touchpad no arquivo de 
# configuração do libinput. Normalmente, as configurações do touchpad são armazenadas em 
# arquivos como /etc/libinput/config.d/ ou /etc/X11/xorg.conf.d/


# 5. Usando dmesg para buscar informações sobre o touchpad

# O comando dmesg pode ser útil para verificar mensagens do kernel relacionadas ao seu 
# touchpad. Você pode executar o seguinte comando para procurar por mensagens que indiquem 
# o status do touchpad:

# dmesg | grep -i touchpad

# Se o touchpad estiver presente e configurado corretamente, o kernel geralmente exibirá 
# uma mensagem sobre o dispositivo ao iniciar.


# Conclusão:

# Se não tiver o xinput disponível, você ainda pode usar as abordagens acima para determinar 
# se o touchpad está habilitado ou não. Isso depende do seu sistema e da configuração 
# específica do dispositivo de entrada.



# Função para verificar se o arquivo "enabled" está presente e com valor 1 (habilitado)


# O comando synclient TouchpadOff=1 apenas desativa o dispositivo no contexto do servidor X, ou seja, o touchpad deixa de responder a eventos de entrada, mas o dispositivo em si ainda está fisicamente ativo e visível no sistema (isso é, a entrada ainda está sendo gerenciada pelo kernel e os dispositivos estão registrados em /sys/class/input/*).

# Este método funciona independentemente do servidor gráfico em uso (X11 ou Wayland), pois ele lida com o dispositivo no nível do kernel. O arquivo /sys/class/input/*/device/power/control determina o estado de energia de dispositivos de entrada, incluindo o touchpad.



check_touchpad_enabled() {


    # Itera sobre dispositivos em /sys/class/input
#     for input_device in /sys/class/input/*; do
#         if [[ -d "$input_device" ]]; then

            # Verifica se o dispositivo contém "touchpad" no nome
#             device_name=$(cat "$input_device/device/name" 2>/dev/null)

            # Confirma se o nome do dispositivo contém "Touchpad"
#             if [[ "$device_name" =~ "Touchpad" ]]; then

                # Verifica se existe o arquivo que controla o estado de energia do dispositivo
#                 if [[ -e "$input_device/device/power/control" ]]; then

#                    power_state=$(cat "$input_device/device/power/control")

                    # Se o valor do estado de energia for "auto", o dispositivo está habilitado
#                     if [[ "$power_state" == "auto" ]]; then

#                     echo -e "${GREEN}\nTouchpad está habilitado. \n ${NC}"

#                     sleep 1


#                     notify-send -i "$logo" -t $tempo_notificacao "Touchpad Ativado" "O seu touchpad está ativado."



# Verifica se o arquivo existe

# if [ -f "$device_added" ]; then

#        paplay "$device_added"

# fi


#                         return 0

#                     else

                         
#                     echo -e "${RED}\nTouchpad está desabilitado. \n ${NC}"

#                     sleep 1


#                     notify-send -i "$logo" -t $tempo_notificacao "Touchpad Desativado" "O seu touchpad está desativado."


# Verifica se o arquivo existe

# if [ -f "$device_removed" ]; then

#        paplay "$device_removed"

# fi                     


#                         return 1
#                     fi
#                 fi
#            fi
#         fi
#     done



        touchpad_state=$(synclient 2> /dev/null | grep TouchpadOff | cut -d= -f2 | sed "s/ //g")

# Couldn't find synaptics properties. No synaptics driver loaded?


# Verificação de erros: É sempre bom adicionar algum tipo de verificação de erros para 
# garantir que o synclient e os outros comandos estejam funcionando corretamente. Podemos 
# verificar se o comando synclient foi bem-sucedido antes de continuar a execução.

if [ -z "$touchpad_state" ]; then

    # Se nenhum touchpad for encontrado, retorna com mensagem

    echo -e "${RED}\nErro: Não foi possível determinar o estado do touchpad. \n ${NC}"

    sleep 1


    notify-send -i "$logo" -t $tempo_notificacao "Erro" "Não foi possível determinar o estado do touchpad."



    # Verifica se o arquivo existe

    if [ -f "$device_removed" ]; then

        paplay "$device_removed"

    fi 



    return 1

    # exit

fi



        if [[ "$touchpad_state" == "0" ]]; then


               echo -e "${GREEN}\nTouchpad está habilitado. \n ${NC}"

               sleep 1

               notify-send -i "$logo" -t $tempo_notificacao "Touchpad" "Touchpad está habilitado"



               # Verifica se o arquivo existe

               if [ -f "$device_added" ]; then

                   paplay "$device_added"

               fi

                     return 0


        elif [[ "$touchpad_state" == "1" ]]; then


               echo -e "${RED}\nTouchpad está desabilitado. \n ${NC}"

               sleep 1

               notify-send -i "$logo" -t $tempo_notificacao "Touchpad" "Touchpad está desabilitado"


               # Verifica se o arquivo existe

              if [ -f "$device_removed" ]; then

                    paplay "$device_removed"

              fi


                     return 1

        fi





}

# Chamada da função para verificar o estado do touchpad

check_touchpad_enabled




# ----------------------------------------------------------------------------------------


# Para verifica se o touchpad está habilitado ou não, usar o xinput


# Função para verificar o touchpad

verificar_touchpad() {


    # Verificar o nome do dispositivo do touchpad


# A mensagem "unable to find device" geralmente é gerada pelo comando xinput quando ele 
# não consegue encontrar o dispositivo de entrada especificado, como um touchpad, no 
# sistema.



# Liste os dispositivos conectados ao sistema (xinput list)

# Procure por um dispositivo que tenha "touchpad" no nome ou algo semelhante.


    # touchpad_device=$(xinput list --name-only | grep -i "touchpad")


# Isso garante que o script encontre o touchpad mesmo se ele tiver um nome ligeiramente 
# diferente, como "SynPS/2 Synaptics TouchPad" ou "ETPS/2 Elantech Touchpad".


    # Procurar pelo dispositivo de touchpad

    touchpad_device=$(xinput list --name-only | grep -i 'synaptics\|elantech\|touchpad')


    # Se não encontrar o dispositivo, exibe mensagem e sai

    if [ -z "$touchpad_device" ]; then

        echo -e "${RED}\nNão foi possível encontrar o dispositivo de touchpad. \n ${NC}"

        sleep 1

        notify-send -i "$logo" -t $tempo_notificacao "Touchpad não encontrado" "Não foi possível encontrar o dispositivo de touchpad."



       # Verifica se o arquivo existe

       if [ -f "$warning_sound" ]; then

          paplay "$warning_sound"

       fi

       exit 1 # Para evitar o error na variável $status abaixo.

    fi





# Erro na Execução:

# A linha "/usr/local/bin/touchpad_control.sh: linha 952: [: : esperava expressão de número inteiro" 
# sugere que o script encontrou um erro de comparação em algum ponto. Esse erro ocorre 
# quando o script tenta comparar uma variável que não contém um valor numérico (por exemplo, 
# o status do touchpad não é retornado corretamente).




    # Verificar o status do touchpad

    # Tem o objetivo de capturar o status de ativação ou desativação do touchpad. 


    # Se encontrado, exibe as propriedades


# Use o ID do dispositivo para obter mais informações detalhadas. Suponha que o ID do seu touchpad seja 10, então:

# xinput list-props 10


# Isso exibirá as propriedades do touchpad, como as configurações de toque, rolagem e outras opções.


    # Verificar o status do touchpad


    # status=$(xinput list-props "$touchpad_device" | grep "Device Enabled" | awk '{print $4}')

    status=$(xinput list-props "$touchpad_device" 2>/dev/null | grep -i "Device Enabled" | awk '{print $NF}')



    # Verificar se o status não é um número válido (0 ou 1)

    if [[ ! "$status" =~ ^[01]$ ]]; then

        echo -e "${RED}\nNão foi possível obter o status do touchpad. \n ${NC}"

        sleep 1

        notify-send -i "$logo" -t $tempo_notificacao "Erro" "Não foi possível obter o status do touchpad."



        # Verifica se o arquivo existe

        if [ -f "$warning_sound" ]; then

           paplay "$warning_sound"

        fi


        exit 1

    fi


    # Agora podemoes realizar a comparação normalmente

    # Verificar o status e notificar o usuário

    if [ "$status" -eq 1 ]; then

        echo -e "\n${GREEN}O seu touchpad está ativado. ${NC}\n"

        notify-send -i "$logo" -t $tempo_notificacao "Touchpad Ativado" "O seu touchpad está ativado."



# Verifica se o arquivo existe

if [ -f "$device_added" ]; then

        paplay "$device_added"

fi


    else

        echo -e "${RED}\nO seu touchpad está desativado. \n ${NC}"

        notify-send -i "$logo" -t $tempo_notificacao "Touchpad Desativado" "O seu touchpad está desativado."


       # Verifica se o arquivo existe

       if [ -f "$device_removed" ]; then

          paplay "$device_removed"

       fi 



    fi


}



# ----------------------------------------------------------------------------------------

# Fim das funções




# ----------------------------------------------------------------------------------------



# Modelo da placa-mãe

# A opção -M foi adicionada ao inxi na versão 3.0.00. Essa versão foi lançada em março de 
# 2018. A opção -M é usada para mostrar informações sobre a placa-mãe do sistema, incluindo 
# o modelo e o fabricante, se disponível.


# No Linux Mint:

# /usr/bin/inxi: illegal option -- -



# A mensagem de erro /usr/bin/inxi: illegal option -- - normalmente significa que você 
# está tentando executar o comando inxi com uma opção inválida ou não reconhecida. O inxi 
# é uma ferramenta usada para exibir informações do sistema de forma legível, e ela tem 
# um conjunto específico de opções que aceita.



# Verifica a versão do inxi instalada

inxi_version=$(inxi --version)

# Extrai o número da versão

version_number=$(echo $inxi_version | grep -oP '\d+\.\d+\.\d+')

# Compara a versão com 3.0.00

if [[ $(echo -e "3.0.00\n$version_number" | sort -V | head -n1) == "3.0.00" ]]; then

    # echo "A versão do inxi é $version_number e possui a opção -M."


# which inxi 1> /dev/null &&  

echo -e "\n${GREEN}Placa-mãe: ${NC}\n" && inxi -M 2> /dev/null


# else
#     echo "A versão do inxi instalada é $version_number, que não possui a opção -M."

fi




echo -e "\n\n"

# ----------------------------------------------------------------------------------------


echo -e "\nMódulos relacionados ao suporte a touchpad: \n"

# Verifica se o módulo está carregado no kernel.

# Para verificar múltiplos módulos de entrada e touchpad.

# Isso ajuda a garantir que você está verificando todos os módulos possíveis que podem 
# estar envolvidos no suporte ao seu touchpad.

# Conclusão:

# Existem várias variações e módulos diferentes relacionados ao suporte a touchpads no 
# Linux, dependendo do fabricante, do tipo de interface (PS/2, USB, I2C) e da tecnologia 
# utilizada. Além de synaptics, synaptics_i2c, e psmouse, você também pode encontrar outros 
# módulos, como evdev, hid_multitouch, i2c-hid, e outros, dependendo do hardware e do driver 
# em uso.


# Retirado o -q do grep abaixo.

if lsmod | grep -E "synaptics|synaptics_i2c|psmouse|ps2mouse|evdev|hid_multitouch|alps|elan_i2c|hid-psmouse|hid-sensor-touchscreen|i2c-hid|hid_generic"; then


    echo -e "\n${GREEN}O módulo está carregado. ${NC}\n"

    sleep 1


# Funcionou no notebook

# Desabilita o touchpad

# modprobe -r psmouse


else

    echo -e "${RED}\nO módulo NÃO está carregado. ${NC}"

    sleep 1


# Carregar o módulo manualmente (Habilita o touchpad):

# Se o seu sistema não estiver usando o módulo automaticamente, você pode tentar carregá-lo 
# manualmente com o comando:

# sudo modprobe synaptics_i2c


# Funcionou no notebook

# sudo modprobe psmouse



# O comando modprobe synaptics_i2c não pode ser executado por um usuário comum sem permissões 
# elevadas, pois ele requer acesso para carregar ou descarregar módulos do kernel, o que é 
# uma operação que envolve modificações no sistema.


# Diagnóstico:

# Se o módulo não estiver carregado ou o touchpad não estiver funcionando corretamente, 
# você pode verificar as mensagens do kernel com o comando dmesg para ver se há erros 
# relacionados ao synaptics_i2c:

# dmesg | grep synaptics_i2c

# Isso pode ajudar a identificar problemas na comunicação entre o touchpad e o sistema.


fi


# ----------------------------------------------------------------------------------------


# Como identificar o touchpad no Linux?


# if [[ ! -f /proc/bus/input/devices ]]; then

#     echo "Arquivo /proc/bus/input/devices não encontrado!"

# else

# Verifica se um touchpad está presente no sistema, lendo o conteúdo de /proc/bus/input/devices

#  cat /proc/bus/input/devices | grep -i touchpad
# N: Name="ETPS/2 Elantech Touchpad"

#touchpad_dev=$(cat /proc/bus/input/devices | grep -i touchpad)

# Procure por uma seção que mencione o touchpad ou dispositivo de entrada relacionado 
# ao movimento do ponteiro.

# O comando grep -i touchpad procura por uma linha que contenha a palavra "touchpad" (a 
# opção -i faz a busca ser insensível a maiúsculas/minúsculas).

# O resultado da busca (se encontrado) é armazenado na variável touchpad_dev.


# O if verifica se a variável touchpad_dev está vazia (o que significa que nenhum 
# dispositivo touchpad foi encontrado). O -z retorna verdadeiro se a string estiver vazia.

# if [[ -z "$touchpad_dev" ]]; then


#     echo -e "${RED}\nTouchpad não encontrado! - /proc/bus/input/devices \n ${NC}"


    # Aguarda 1 segundo

#     sleep 1

# fi



# fi



# O comando dmesg exibe mensagens do kernel e pode mostrar informações relacionadas ao 
# toque, caso o driver do touchpad tenha sido carregado.

# dmesg | grep -i touchpad


# Se o seu sistema usa o libinput (muito comum em distribuições modernas), você pode usar 
# o seguinte comando para ver os dispositivos gerenciados:

#  libinput list-devices

#  Isso mostrará todos os dispositivos de entrada, incluindo o touchpad, se estiver presente.



# ----------------------------------------------------------------------------------------



# Para verifica se o touchpad está habilitado ou não, usar o xinput


# Só será executado se o comando xinput estiver disponível. 


# Verificar se o xinput está instalado

if ! command -v xinput &> /dev/null; then

    # echo -e "${RED}\nO comando xinput não foi encontrado. Por favor, instale o xinput para continuar. \n ${NC}"

    # exit 1

# ----------------------------------------------------------------------------------------

# Para verifica se o touchpad está habilitado ou não, sem usar o xinput

# Chama a função para verificar o touchpad

  check_touchpad_enabled


# ----------------------------------------------------------------------------------------



else


# Início do loop while

while true; do

    verificar_touchpad


    # Aguardar o intervalo definido antes de verificar novamente

    sleep $intervalo

done

# Fim do loop while



fi


# ----------------------------------------------------------------------------------------

# Aqui podemos desabilitar ou habilitar temporariamente o touchpad.


# Para usar como indicador de estado do touchpad desabilitar a função abaixo:


# ferramenta


# Ao executar o script, as verificações de driver e o controle do touchpad não serão mais feitas.

# Se você quiser reabilitar a função no futuro, basta remover o # para ativá-la novamente.

# Isso garante que o script apenas monitore e exiba o status do touchpad sem chamar a 
# função de controle do touchpad que altera seu estado.


# ----------------------------------------------------------------------------------------


exit 0

