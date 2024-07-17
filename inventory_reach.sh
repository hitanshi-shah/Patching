#!/bin/bash

for delete_file in unreachable_hosts winunreachable; do
    if [ -f "$delete_file" ]; then
        grep -v -F -f "$delete_file" ansible_inventory.ini > ansible_inventoryreach.ini
        mv ansible_inventoryreach.ini ansible_inventory.ini

    fi
done
