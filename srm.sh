#!bin/bash

# • Scrivere uno script che abbia le funzionalità di rm, ma che invece di cancellare
# definitivamente i file li sposti in una directory .trash nella vostra home
# • Usage:
# • saferm –L elenca il contenuto del cestino
# • saferm –P svuota (“purge”) il cestino
# • saferm –R files ripristina il file file
# • saferm files rimuove i file spostandoli nel cestino
# • Nota: le varie opzioni sono esclusive; ovvero, non si può lanciare un comando
# saferm –L –P ; generate un errore e stampate l’usage dello script nel caso

trash="/home/$USER/.trash"

mkdir -p $trash

if [[ "$1" != "" ]]; then
  if [[ "$2" == "" ]]; then
    if [[ "$1" == "-P" ]]; then
      # to empty the trash
      rm -rf $trash/*
    elif [[ "$1" == "-L" ]]; then
      # to list trash content
      ls $trash
    elif [[ "$1" == "-h" ]]; then
      echo "Available commands: "
      echo "saferm -L (to show trash content)"
      echo "saferm -P (to remove trash content)"
      echo "saferm -R file (to restore 'file' here)"
    elif [[ "$1" != -* ]]; then
      if [[ -e "$trash/$1" ]]; then
        # to handle the duplicate name condition in the trash
        date=$(date -r $trash/$1 +%s)
        mv $trash/$1 $trash/$1.$date
        mv $1 $trash
      else
        mv $1 $trash
      fi
    else
      echo "Invalid command: you can use 'saferm -h' to show available commands"
    fi
  elif [[ "$2" == -* ]]; then
    echo "Invalid command: you can use 'saferm -h' to show available commands"
  else
    if [[ "$1" == "-R" ]]; then
      if [[ -e "./$2" ]]; then
        # to handle the duplicate name condition in the current directory
        date=$(date -r $trash/$2 +%s)
        mv $trash/$2 $trash/$2.$date
        mv $trash/$2.$date .
      fi
    else
      echo "Invalid command: you can use 'saferm -h' to show available commands"
    fi
  fi
else
  echo "Missing parameters: use -h to show available commands"
fi
