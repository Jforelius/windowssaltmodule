windesktop:
  pkg.installed:
    - pkgs:
      - 7zip
      - chocolatey
      - firefox
      - libreoffice
      - vlc
      - steam

chocoinstalls:
  chocolatey.installed:
    - name: mumble
    - name: reaper

#C:\Users\juska\AppData\Roaming\Mozilla\Firefox\Profiles\*.default\browser-extension-data\uBlock0@*\storage.js:
#  file.managed:
#    - source: salt://windesktop/storage.js
#    - makedirs: True
#ei toimi *. absoluuttinen filepath tarpeellinen?

C:\bday.mp3:
  file.managed:
    - source: https://www.dropbox.com/s/935sx2ja64i1lim/Juska bday 2.mp3?dl=1
    - source_hash: md5=fbcf0a5604b4fe4a72f848caa22a270e
