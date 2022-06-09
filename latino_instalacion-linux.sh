# Script para Linux (Debian/Ubuntu, Fedora, RHEL/CentOS-7, Arch/Manjaro)
# Creado por Melvin Guerrero ~ Junio 6, 2022

exe1=""
exe2=""
COMP=""
OS=$(hostnamectl hostname)
ID_LIKE=$(lsb_release -is)
rep="yes Y S J"

if [ -n ${ID_LIKE} ]; then
	COMP=${ID_LIKE}
else
	COMP=${OS}
fi

if [ ${COMP} == fedora ]; then
	ID_LIKE="fedora"
else
	[test -e /etc/os-release && os_release='/etc/os-release' || os_release='/usr/lib/os-release'
	. "${os_release}"
fi
case ${ID_LIKE} in
	"arch")
		exe1="sudo pacman -Syu"
		exe2="sudo pacman -S --noconfirm base-devel cmake git"
	;;
	"debian" | "Debian")
		exe1="sudo apt-get update"
		exe2="sudo apt-get install git cmake build-essential libreadline-dev libpthread-stubs0-dev"
	;;
	"fedora")
		rep=""
		exe1="sudo dnf -y update"
		exe2="sudo dnf -y install gcc-c++ git cmake kernel-devel readline-devel"
	;;
	"rhel fedora")
		rep=""
		exe1="sudo yum -y update"
		exe2="sudo yum -y group install git cmake gcc readline-devel \"Development Tools\""
	;;
	*)
		echo #
		echo "##################################################"
		echo "#  >>> Deteniendo instalacion... <<<"
		echo "#"
		echo "#  Este script solo es valido en systemas basados en:"
		echo "#  Debian - Ubuntu, Fedora, ArchLinux - Manjaro"
		echo "#"
		echo "#  Le recomendamos usar los pasos manuales descritos en el siguiente enlace:"
		echo "#  https://github.com/lenguaje-latino/instalacion"
		echo "#"
		echo "#  IMPORTANTE! Si usted cree que esto es un error"
		echo "#  y usted esta corriendo un sistema basado en los ya mencionados"
		echo "#  por favor, pase a crear un issue en el siguiente enlace:"
		echo "#  https://github.com/lenguaje-latino/instalacion/issues"
		echo "##################################################"
		echo #
		exit
	;;
esac

echo #
echo "#--------------------------------------------#"
echo "| - Iniciando la actualizacion del sistema   |"
echo "#--------------------------------------------#"
echo "Este proceso puede llegar a tardar un tiempo considerable!"
echo "Por favor, tenga paciencia..."
echo #
sleep 5
${rep} | ${exe1}

clear
echo "#---------------------------------------#"
echo "|  .__          __  .__                 |"
echo "|  |  | _____ _/  |_|__| ____   ____    |"
echo "|  |  | \__  \\\   __\  |/    \ /  _ \   |"
echo "|  |  |__/ __ \|  | |  |   |  (  <_> )  |"
echo "|  |____(____  /__| |__|___|  /\____/   |"
echo "|            \/             \/          |"
echo "#---------------------------------------#"
echo "https://lenguajelatino.org"
echo #
echo "Iniciando Script para instalar Latino en Linux"
echo "El script ejecutado es" $0
echo #
echo "#--------------------------------#"
echo "| - Instalacion de Dependencias: |"
echo "#--------------------------------#"
echo #

${rep} | ${exe2}

echo #
echo "#-----------------------------------------#"
echo "| - Descargando codigo fuente de Latino   |"
echo "#-----------------------------------------#"
echo #

cd ~
sudo git clone https://github.com/lenguaje-latino/latino-core

echo #
echo "#-------------------------------------#"
echo "| - Iniciando instalacion de Latino   |"
echo "#-------------------------------------#"
echo #

cd latino-core
sudo cmake .
sudo make install

lat_ver=$(latino --version)

if [[ -n "$lat_ver" ]]; then
	echo #
	echo "#----------------------------#"
	echo "| - Instalacion completada   |"
	echo "#----------------------------#"
	echo #
	echo "  ________                   .__                "
	echo " /  _____/___________    ___ |__|____    ______ "
	echo "/   \  __\_  __ \__  \ _/ __\|  \__  \  /  ___/ "
	echo "\    \_\  \  | \// __ \\\  \__|  |/ __ \_\___ \  "
	echo " \______  /__|  (___  / \__  >__(____  /____  > "
	echo "        \/          \/     \/        \/     \/  "
	echo #
	echo "Gracias por instalar Latino"
	echo "Su version actual de latino es:"
	echo ${lat_ver}
	echo #
	echo "para mas informacion o ayuda sobre este lenguaje"
	echo "puede consultar nuestra documentacion en:"
	echo #
	echo "Manual - Documentacion:"
	echo "https://manual.lenguajelatino.org"
	echo #
	echo "Grupo de Telegram:"
	echo ">Latino (lenguaje de programacion)"
	echo "https://t.me/+PqXr-IgDsyGQgepX"
	echo #
else
	echo #
	echo "#------------------------------------#"
	echo "| - ***ERROR*** al instalar Latino   |"
	echo "#------------------------------------#"
	echo #
	echo "############################################"
	echo "| error     error     error     error       "
	echo "|  ___________   error     error     error  "
	echo "|  \_   _____/_____________  ___________    "
	echo "|   |    __)_\_  __ \_  __ \/  _ \_  __ \   "
	echo "|   |       \ |  | \/|  | \(  <_> )  | \/   "
	echo "|  /_______  /|__|   |__|   \____/|__|      "
	echo "| error    \/rror     error     error       "
	echo "|      error     error     error     error  "
	echo "############################################"
	echo #
	echo "ERROR, No se pudo instalar latino de manera correcta"
	echo "Por favor verifique que todos los pasos se allan seguido correctamente"
	echo "Para mayor informacion puede consultar en los siguientes enlaces:"
	echo #
	echo "Manual - Documentacion:"
	echo "https://manual.lenguajelatino.org/es/latest/Instalar-Latino.html"
	echo #
	echo "Grupo de Telegram:"
	echo ">Latino (lenguaje de programacion)"
	echo "https://t.me/+PqXr-IgDsyGQgepX"
	echo #
fi