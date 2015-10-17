#!/usr/bin/bash

# Define the clock
Clock() {
        DATE=$(date "+%a %b %d, %T")

        echo -n "$DATE"
}

# Print the clock

while true; do
        echo "%{c}%{Fyellow}%{Bblue} $(Clock)%{F-}"
        sleep 1;
done
