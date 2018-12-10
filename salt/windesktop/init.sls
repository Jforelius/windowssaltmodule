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
    - name: teamspeak

C:\musaa\distroblyat.mp3:
  file.managed:
    - source: https://www.dropbox.com/s/21jt7pxzy1v1sc8/Distroblyat.mp3?dl=1
    - source_hash: md5=6f136e9435234a7389520c6164477cee
    - makedirs: true

C:\musaa\Ihavecometodestroy.mp3:
  file.managed:
    - source: https://www.dropbox.com/s/0se3tfbhc0bpz3r/I%20Have%20Come%20to%20Destroy%20You.mp3?dl=1
    - source_hash: md5=ee28f17a23f2ccf8bae04de292e2f1d9
    - makedirs: true

#copy_files: konsepti jos master aktiivinen
#  file.recurse:
#    - name: C:\vstfolder
#    - source: salt://vst

C:\vst_test\vst_test.zip:
  file.managed:
    - source: https://www.dropbox.com/sh/qv53g6lop9q27j0/AABP1yPzW_vA382qMSZNWmJ_a?dl=1
    - source_hash: md5=f82ad96b6e5e4ed8bb8a2b22e0f0eecd
    - makedirs: True

C:\avira\avira_en_fass0_5c0da9c76ab18_ws.exe:
  file.managed:
    - source: https://package.avira.com/download/connect-client-win/package/avira_en_fass0_5c0da9c76ab18__ws.exe
    - source_hash: md5=3d9a1ef9a534cc36102f92a361910775
    - makedirs: true
