# Script para Linux (Debian/Ubuntu, Fedora, Arch/Manjaro)
# Creado por Melvin Guerrero ~ Junio 6, 2022 - 15:40
# Ultima modificacion ~ Junio 7, 2022 - 13:12 16:23

#!/bin/sh

lat_ver=$(latino --version)

if [[ -n "$lat_ver" ]]; then
    echo "Su version actual de latino es: ${lat_ver}"
    read -p "Esta seguro de que desea continuar con la desinstalacion? [s/N]" sn
    case $sn in
        [Ss]* )
            sudo /bin/rm -f /usr/local/bin/latino
            sudo /bin/rm -f /usr/local/lib/liblatino.so
            sudo /bin/rm -f /usr/local/lib/libliblatino_static.a
            sudo /bin/rm -f /usr/local/share/man/man1/latino.1.gz
            sudo /bin/rm -f /usr/local/share/nano/latino.nanorc
            sudo /bin/rm -f /usr/local/share/applications/latino.desktop
            sudo /bin/rm -f /usr/local/share/latino/Latino-logo.png
            sudo /bin/rm -f /usr/local/include/latast.h
            sudo /bin/rm -f /usr/local/include/latcompat.h
            sudo /bin/rm -f /usr/local/include/latdic.h
            sudo /bin/rm -f /usr/local/include/latdo.h
            sudo /bin/rm -f /usr/local/include/latgc.h
            sudo /bin/rm -f /usr/local/include/latino.h
            sudo /bin/rm -f /usr/local/include/latlex.h
            sudo /bin/rm -f /usr/local/include/latlist.h
            sudo /bin/rm -f /usr/local/include/latmem.h
            sudo /bin/rm -f /usr/local/include/latmv.h
            sudo /bin/rm -f /usr/local/include/latobj.h
            sudo /bin/rm -f /usr/local/include/latparse.h
            sudo /bin/rm -f /usr/local/include/latrepl.h
            sudo /bin/rm -f /usr/local/include/latobj.h

            echo "#----------------------------------------------------#"
            echo "| Desinstalacion exitosa!                            |"
            echo "| Latino ya fue desinstalado con exito de su equipo. |"
            echo "#----------------------------------------------------#"
        ;;
        [Nn]* | "" )
            echo "#------------------------------#"
            echo "| ***Desinstalacion anulada*** |"
            echo "#------------------------------#"
            exit;;
        * ) echo ">>> Por favor responda con S o N";;
    esac
else
    echo "#-------------------------------------------------#"
    echo "| ***ERROR*** Latino no se encontro en su sistema |"
    echo "#-------------------------------------------------#"
    echo "***Latino no se encuentra instalado en su sistema.***"
    echo "Puede descargar latino en el siguiente enlace:"
    echo "https://lenguajelatino.org"
    echo #
fi

exit 0