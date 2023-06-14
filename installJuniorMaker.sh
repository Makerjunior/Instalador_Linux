#!/bin/bash

# DESENVOLVEDOR   JUNIOR PEREIRA DE  SOUSA   (JUNIOR MAKER)

# INTALADOR DE PROGRAMAS

# VISUAL STUDIO
# QT-CREATOR
# ARDRUINO IDE
# VIRTUALBOX
clear   #limpa tela

echo "----------------------------------"
echo "|BEM VINDO AO INSTALADOR MAKERJR|"
echo "----------------------------------"

##################################  AUTUALIZAÇAO   #######################################

echo "Atualizar o sistema [s/n]?"  #Pergunta ao usuario
read -n1 atualizar                 #armazena a resposta
echo " "

if [ "$atualizar" == "s" ]
then
 sudo apt-get update && sudo apt-get upgrade
 echo "Sistema atualizado"
elif [ "$atualizar" == "n" ]
then
 echo "Sistema nao atualizado"
else
 echo "Entrada invalida sistema nao atualizado"
fi


##################################  MENU   #######################################

function Menu {
echo "-----------------------------------"
echo "|Quais programas deseja instalar ?|"
echo "-----------------------------------"
echo "###### |A| Copiladores   #########|"
echo "-----------------------------------"
echo "###### |B| Visual Studio #########|"
echo "-----------------------------------"
echo "###### |C| Qt-Creator    #########|"
echo "-----------------------------------"
echo "###### |D| Virtualbox    #########|"
echo "-----------------------------------"
echo "#######|E| Arduino IDE   #########|"
echo "-----------------------------------"
echo "#######|F| Todos         #########|"
echo "-----------------------------------"
echo "#######|G| SAIR          #########|"
echo "-----------------------------------"

read -n1 resposta
}
##################################  FUNÇOES   #######################################


#Funçao que que instala os copiladores
function Copiladores {
echo "  "
echo "Instalando copiladores"
if sudo apt install build-essential
then
  echo "Pacote de copiladores Bulid-essential instalado"
fi
}

#Funcao que istala o Visual studio
function Vscode {
echo " "
echo "Adicionando repositorio para VS-Code"
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
echo "Baixando VS-Code"
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
echo "Atualizando pacotes"
sudo apt-get update
echo "Instalando VS-Code"
sudo apt-get install code

}

#Funcao que isntala o Qt-Creator
function Qtcreator {
echo " "
echo "Instalando QT-Creator"
sudo apt install qtcreator
echo "Instalando as bibliotecas"
sudo apt install build-essential
echo "Instalando Qt5"
sudo apt install qt5-default
echo "Instalando documentaçao e exemplos"
sudo apt install qt5-doc qt5-doc-html qtbase5-doc-html qtbase5-examples
}

#Funcao que instala Virtualbox
function Virtualbox {
echo " "
echo "Baixando Virtualbox"
wget https://download.virtualbox.org/virtualbox/6.1.28/VirtualBox-6.1.28-147628-Linux_amd64.run -O virtualbox.run
echo "Criando o executavel do Virtualbox"
chmod +x virtualbox.run
echo "Iniciando instalaçao"
sudo ./virtualbox.run
}

#Funcao que instala Ardruino IDE
function Arduino {
echo " "
echo "Arduino IDE 1.8.15 "
mkdir arduino
cd arduino/
echo "Baixando Arduino IDE"
wget https://downloads.arduino.cc/arduino-1.8.15-linux64.tar.xz
echo "Extraindo arquivo"
tar -xvf ./arduino-1.8.15-linux64.tar.xz
echo "Instalando Arduino IDE"
cd arduino-1.8.15/
sudo ./install.sh
echo "Para evitar possíveis problemas ao usar o Arduino IDE, adicione o usuário do sistema ao grupo dialout."
echo "Este é o procedimento para acessar a porta serial do Arduino Software (IDE) se você receber um erro."
echo "Pode acontecer que, ao carregar um esboço, receba o seguinte erro:"
echo " Erro ao abrir porta serial ... "
echo "Se você receber esse erro, precisará definir as permissões da porta serial."
echo "Digite o seguinte comando no terminal:"
echo "$ ls -l /dev/ttyACM*"
echo "você obterá algo como":
echo "crw-rw---- 1 root dialout 188, 0 5 apr 23.01 ttyACM0"
echo "Os dados de que precisamos são 'dialout' (é o proprietário do grupo do arquivo)."
echo "Agora só precisamos adicionar o usuário do nosso sistema ao grupo:"
echo "$ sudo usermod -a -G dialout <username>"
echo "onde  <username> está o seu nome de usuário Linux. Você precisará fazer logout e login novamente para que isso tenha efeito."
echo "No meu caso é:"
echo "$ sudo usermod -a -G dialout smilojkovic"
}

#Funcao que instala Todos os programas
function Todos {
Copiladores
Vscode
Qtcreator
Virtualbox
Arduino
exit
}


##################################  QUAL PROGRAMA SERA INSTALADO   #######################################

res=s
while [ "$res" = "s" ]
do

 Menu
 case $resposta in
   A | a)
      Copiladores
    ;;
   B | b)
      Vscode
    ;;
   C | c)
      Qtcreator
    ;;
   D | d)
      Virtualbox
    ;;
   E | e)
      Arduino
    ;;
   F | f)
      Todos
    ;;
   G | g)
      echo "  "
      echo "Saindo do instalador"
      exit
    ;;
  *)
      echo "  "
      echo "Opção inválida";;
 esac

 echo "   "
 echo "Deseja instalar mais programas [s/n] "
  read -n1 res
  echo "  "
  if [ "$res" = "n" ]
  then
    break
  fi

done
