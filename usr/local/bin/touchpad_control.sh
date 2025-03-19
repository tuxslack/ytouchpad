#!/bin/bash
#
# Autor:    Fernando Souza - https://www.youtube.com/@fernandosuporte/
# Data:     19/03/2025 as 16:07:50
# Homepage: https://github.com/tuxslack/ytouchpad
# Licença:  GPL
#


# Para desabilitar/habilitar o touchpad


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



# Atualizações: Teclas Sonorizadas (para tocar um som ao acionar), se quiser.



# Arquivos:
#
# /usr/local/bin/touchpad_control.sh
# /usr/share/icons/extras/touchpad-indicator.png
# /usr/share/applications/Touchpad Indicator.desktop



# Dê permissão de execução ao script:

# chmod +x /usr/local/bin/verificar_touchpad.sh


# Execute o script com usuário comum:

# verificar_touchpad.sh



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


clear


# ----------------------------------------------------------------------------------------

# Para controlar as configurações de touchpad


# O comando synclient foi muito utilizado no passado em distribuições Linux para controlar 
# as configurações de touchpad, especialmente quando o driver Synaptics estava instalado. 
# No entanto, nas distribuições mais recentes, o libinput tem substituído o Synaptics como 
# o driver padrão para touchpads, o que pode fazer com que o comando synclient não funcione 
# corretamente em sistemas mais novos.


# Ajuda a identificar se o driver Synaptics está ativo ou não no sistema.

distro_antiga(){


# Verifica se o módulo do driver Synaptics está carregado no kernel.

if lsmod | grep -q "synaptics"; then

    echo "O driver Synaptics está carregado."

else

    echo "O driver Synaptics NÃO está carregado."
    echo "Tentando verificar a instalação do pacote Synaptics..."



    # Verificar se o pacote Synaptics está instalado

    if command -v synclient &> /dev/null; then

        echo "O pacote Synaptics está instalado."

    else

        echo "O pacote Synaptics NÃO está instalado."

        # yad --center --title="Erro" --text="O synclient não está instalado. Instale o pacote 'xserver-xorg-input-synaptics'." --button=OK:0


        # Se o synclient não estiver instalado, instale o pacote xserver-xorg-input-synaptics:

        # Para sistemas baseados em Debian/Ubuntu:

        # sudo apt-get install -y xserver-xorg-input-synaptics


        # exit 1

    fi
fi


# Se a sua distribuição ainda usa o driver Synaptics para o touchpad, então o comando synclient pode funcionar.

# Para desativar o touchpad:

# synclient TouchpadOff=1


# Para ativar o touchpad:

# synclient TouchpadOff=0




# Função para desabilitar o touchpad

disable_touchpad() {

    synclient TouchpadOff=1

    yad --center --title="Controle do Touchpad" --text="Touchpad desabilitado!" --button=OK:0
}


# Função para habilitar o touchpad

enable_touchpad() {

    synclient TouchpadOff=0

    yad --center --title="Controle do Touchpad" --text="Touchpad habilitado!" --button=OK:0
}



# Exibir a interface com dois botões

# Ao executar o script, será aberta uma janela com dois botões: "Desabilitar Touchpad" e 
# "Habilitar Touchpad". Você poderá desabilitar ou habilitar o touchpad clicando nos 
# respectivos botões.

yad --center \
    --title="Controle do Touchpad - synclient" \
    --buttons-layout=center \
    --button="Desabilitar Touchpad:1" \
    --button="Habilitar Touchpad:2" \
    --width=400 --height=150 \
    --text="Escolha uma opção para o touchpad:" \
    --form \
     | while read button_id; do

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

    yad --center --title="Controle do Touchpad" --text="Touchpad não encontrado!" --button=OK:0  --width="300"

    exit 1
fi

# Função para desabilitar o touchpad

disable_touchpad() {

    xinput disable "$touchpad_name"

    yad --center --title="Controle do Touchpad" --text="Touchpad desabilitado!" --button=OK:0 --width="300" 
}

# Função para habilitar o touchpad

enable_touchpad() {

    xinput enable "$touchpad_name"

    yad --center --title="Controle do Touchpad" --text="Touchpad habilitado!" --button=OK:0 --width="300"
}


# Exibir a interface com dois botões

# Quando você executar o script, uma janela será aberta com os botões 
# "Desabilitar Touchpad" e "Habilitar Touchpad". Ao clicar em cada um, o 
# touchpad será desabilitado ou habilitado, respectivamente.

yad --center \
    --title="Controle do Touchpad - libinput" \
    --buttons-layout=center \
    --button="Desabilitar Touchpad:1" \
    --button="Habilitar Touchpad:2" \
    --width="400" --height="150" \
    --text="Escolha uma opção para o touchpad:" \
    --form \
     | while read button_id; do

        case $button_id in
            1) disable_touchpad ;;
            2) enable_touchpad ;;
        esac

    done



}

# ----------------------------------------------------------------------------------------

# Função para verificar se o comando está instalado

verificar_comando() {

    comando=$1

    if ! command -v "$comando" &> /dev/null; then

        echo "Erro: O comando '$comando' não está instalado."

        exit 1
    fi
}

# Verificar se xinput e notify-send estão instalados

verificar_comando "xinput"

verificar_comando "notify-send"


# No Void Linux
#
# sudo xbps-install -y xinput


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



intervalo="2"

# Tempo que a notificação ficará visível (em milissegundos)

tempo_notificacao="20000"  # 20000 ms = 20 segundos


while true; do

    # Verificar o nome do dispositivo do touchpad


# A mensagem "unable to find device" geralmente é gerada pelo comando xinput quando ele 
# não consegue encontrar o dispositivo de entrada especificado, como um touchpad, no 
# sistema.


    # touchpad_device=$(xinput list --name-only | grep -i "touchpad")


# Isso garante que o script encontre o touchpad mesmo se ele tiver um nome ligeiramente 
# diferente, como "SynPS/2 Synaptics TouchPad" ou "ETPS/2 Elantech Touchpad".

    touchpad_device=$(xinput list --name-only | grep -i 'synaptics\|elantech\|touchpad')

    # Verificar se o dispositivo foi encontrado

    if [ -z "$touchpad_device" ]; then

        notify-send -i /usr/share/icons/extras/touchpad-indicator.png -t $tempo_notificacao "Touchpad não encontrado" "Não foi possível encontrar o dispositivo de touchpad."

        exit 1 # Para evitar o error na variável $status abaixo.
    fi


# Erro na Execução:

# A linha "/usr/local/bin/touchpad_control.sh: linha 401: [: : esperava expressão de número inteiro" 
# sugere que o script encontrou um erro de comparação em algum ponto. Esse erro ocorre 
# quando o script tenta comparar uma variável que não contém um valor numérico (por exemplo, 
# o status do touchpad não é retornado corretamente).


    # Verificar o status do touchpad

    # Tem o objetivo de capturar o status de ativação ou desativação do touchpad. 


    # Se encontrado, exibe as propriedades

    # status=$(xinput list-props "$touchpad_device" | grep "Device Enabled" | awk '{print $4}')

    status=$(xinput list-props "$touchpad_device" 2>/dev/null | grep -i "Device Enabled" | awk '{print $NF}')




# Verifique se o valor de status é um número válido (1 ou 0)

if [[ ! "$status" =~ ^[01]$ ]]; then

    notify-send -i /usr/share/icons/extras/touchpad-indicator.png -t $tempo_notificacao "Erro" "Não foi possível obter o status do touchpad."

    exit 1

fi

    # Agora podemoes realizar a comparação normalmente

    if [ "$status" -eq 1 ]; then

        notify-send -i /usr/share/icons/extras/touchpad-indicator.png -t $tempo_notificacao "Touchpad Ativado" "O seu touchpad está ativado."

    else

        notify-send -i /usr/share/icons/extras/touchpad-indicator.png -t $tempo_notificacao "Touchpad Desativado" "O seu touchpad está desativado."

    fi

    # Aguardar o intervalo definido antes de verificar novamente

    sleep $intervalo

done


# ----------------------------------------------------------------------------------------

# Para usar como indicador de estado do touchpad desabilitar a função abaixo:


# ferramenta


# Ao executar o script, as verificações de driver e o controle do touchpad não serão mais feitas.

# Se você quiser reabilitar a função no futuro, basta remover o # para ativá-la novamente.

# Isso garante que o script apenas monitore e exiba o status do touchpad sem chamar a 
# função de controle do touchpad que altera seu estado.


# ----------------------------------------------------------------------------------------

exit 0

