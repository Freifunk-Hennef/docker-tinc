# tinc

Docker Image für einen Freifunk tinc Server.

## Funktionen

* Startet einen tincd

Muss im Host-Netzwerk ausgeführt werden und benötigt das Device `/dev/net/tun` und die Capability `NET_ADMIN`

## Variablen

| Variable            | Beschreibung                                                             | Format                | Standardwert                          | Benötigt           |
| ------------------- | ------------------------------------------------------------------------ | --------------------- | ------------------------------------- | ------------------ |
| TINC_NAME           | Name des `tinc` Servers                                                  | String                | `unkown`                              | :white_check_mark: |
| TINC_ADDRESS_FAMILY | IP-Adresstyp                                                             | IP-Adresstyp          | `ipv4`                                | :x:                |
| TINC_DEVICE         | Device für `tinc`-Tunnel                                                 | Device                | `/dev/net/tun`                        | :x:                |
| TINC_MODE           | `tinc` Mode                                                              | `tinc` Mode           | `switch`                              | :x:                |
| TINC_CONNECT_TO     | Liste der `tinc` Server, mit denen eine Verbindung aufgebaut werden soll | Liste von Servernamen | Alle Dateinamen aus `/etc/tinc/hosts` | :x:                |
| TINC_INTERFACE_MAC  | MAC-Adresse für das `tinc` Interface                                     | MAC-Adresse           | -                                     | :x:                |
| TINC_CONFIG_APPEND  | Wird an die `tinc`-Konfiguration angehängt                               | `tinc`-Konfiguration  | -                                     | :x:                |