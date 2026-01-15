#!/bin/bash

# Cuenta actualizaciones oficiales
official=$(checkupdates 2>/dev/null | wc -l)

# Cuenta actualizaciones de AUR (opcional)
aur=$(paru -Qua 2>/dev/null | wc -l)

# Suma total
total=$((official + aur))

# Salida formateada
if [[ "$total" -eq 0 ]]; then
    echo "✓"
elif [[ "$total" -gt 100 ]]; then
	echo "<span style='color:red'>$total</span>"
else
    echo "$total"
fi

