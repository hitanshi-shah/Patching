#!/bin/bash
grep -A10 '^\[Windows\]' ansible_inventory.ini | sed '/^\[Windows\]/d' | cut -d " " -f1 > wininventory
grep -v -f win_reachable_hosts wininventory > winunreachable
