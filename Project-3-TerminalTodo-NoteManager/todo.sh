#!/bin/bash

TODO_FILE="tasks.txt"

function show_menu() {
    echo "==========================="
    echo "      TODO MANAGER"
    echo "==========================="
    echo "1) Add a task"
    echo "2) List tasks"
    echo "3) Remove a task"
    echo "4) Exit"
    echo ""
}

function add_task() {
    read -p "Enter new task: " task
    echo "$task" >> "$TODO_FILE"
    echo "Task added!"
}

function list_tasks() {
    echo "Your tasks:"
    nl -ba "$TODO_FILE"
}

function remove_task() {
    list_tasks
    read -p "Enter task number to remove: " num
    sed -i "${num}d" "$TODO_FILE"
    echo "Task removed!"
}

# Main loop
while true; do
    show_menu
    read -p "Choose an option: " choice

    case $choice in
        1) add_task ;;
        2) list_tasks ;;
        3) remove_task ;;
        4) exit 0 ;;
        *) echo "Invalid option!" ;;
    esac

    echo ""
done

