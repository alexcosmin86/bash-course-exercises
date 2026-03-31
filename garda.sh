#!/bin/bash

# Fișierul unde salvăm ce se întâmplă
LOG="irigatii_afine.log"

# Verificăm dacă Nginx rulează (is-active)
if ! systemctl is-active --quiet nginx; then
    echo "$(date): [ALARMĂ] Nginx era oprit! Încerc repornirea..." >> "$LOG"
    sudo systemctl restart nginx
    
    # Verificăm dacă a reușit
    if systemctl is-active --quiet nginx; then
        echo "$(date): [OK] Nginx a fost repornit cu succes." >> "$LOG"
    else
        echo "$(date): [EROARE] Nginx tot nu vrea să pornească!" >> "$LOG"
    fi
else
    echo "Garda: Totul e în regulă, Nginx veghează afinele."
fi
