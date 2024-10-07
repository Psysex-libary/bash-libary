#!/bin/bash

TODO_FILE="todo.txt"

function show_help {
    echo "Verwendung: $0 [Befehl] [Aufgabe]"
    echo "Befehle:"
    echo "  add [Aufgabe]    - Füge eine Aufgabe hinzu"
    echo "  list             - Zeige alle Aufgaben an"
    echo "  remove [Nummer]  - Entferne eine Aufgabe"
    echo "  help             - Zeige diese Hilfe an"
}

function add_task {
    echo "$1" >> "$TODO_FILE"
    echo "Aufgabe hinzugefügt: $1"
}

function list_tasks {
    if [[ ! -f "$TODO_FILE" ]]; then
        echo "Keine Aufgaben vorhanden."
        return
    fi

    echo "To-Do-Liste:"
    nl "$TODO_FILE"
}

function remove_task {
    if [[ ! -f "$TODO_FILE" ]]; then
        echo "Keine Aufgaben vorhanden."
        return
    fi

    sed -i.bak "${1}d" "$TODO_FILE"
    echo "Aufgabe $1 entfernt."
}

case "$1" in
    add)
        add_task "$2"
        ;;
    list)
        list_tasks
        ;;
    remove)
        remove_task "$2"
        ;;
    help)
        show_help
        ;;
    *)
        show_help
        ;;
esac
