# IsoSpot — Hotspot Analogique / VoIP (SvxLink + SA818S + Orange Pi Zero)

Hotspot radioamateur UHF autonome base sur un **Orange Pi Zero** (Armbian), un module transceiver **SA818S** avec isolation galvanique audio, **SvxLink** (Reflecteur RI49 + EchoLink) et une interface web de controle locale.

## Architecture materielle et logicielle
- **SBC :** Orange Pi Zero (UART `/dev/ttyS2` pour le controle AT du SA818S)
- **Module RF :** SA818S UHF (432.975 MHz, CTCSS 79.7 Hz, bande large 25 kHz)
- **Audio & Squelch :** Detection CTCSS logicielle stabilisee (`CTCSS_OPEN_THRESH=15`, `CTCSS_CLOSE_THRESH=5`, `SQL_HANGTIME=400`)
- **Logique VoIP :** Bascule automatique du Talkgroup ReflectorLogic vers `TG #0` lors d'une connexion EchoLink (`MUTE_LOGIC_LINKING=1`) pour eviter tout chevauchement audio

## Installation rapide
1. Cloner le depot sur l'Orange Pi Zero :
   ```bash
   git clone https://github.com/VOTRE_COMPTE/IsoSpot.git
   cd IsoSpot
   sudo ./install.sh
   ```
2. Renseigner votre indicatif et vos acces dans `/etc/svxlink/svxlink.conf` et `/etc/svxlink/svxlink.d/ModuleEchoLink.conf`.
3. Redemarrer : `sudo reboot`.
