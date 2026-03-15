#!/bin/bash

# Verificăm dacă serviciul Nginx este activ
if systemctl is-active --quiet nginx; then
    echo "$(date): Nginx rulează corect pe server." >> nginx_status.log
else
    echo "$(date): ALERTA! Nginx este oprit. Se încearcă repornirea..." >> nginx_status.log
    # Încearcă să-l repornească
    sudo systemctl start nginx
    
    # Verifică din nou după repornire
    if systemctl is-active --quiet nginx; then
        echo "$(date): Nginx a fost repornit cu succes." >> nginx_status.log
    else
        echo "$(date): EROARE CRITICĂ: Nginx nu a putut fi repornit." >> nginx_status.log
    fi
fi
