# moduuli: fresh install windowsiin

	base:
	  'xubuntu*':
	    - hello
	  'windows*':
	    - hello
	    - windesktop

Installasin saltin ekaksi xubuntu koneella. Testasin että toimii hello.txt. Lisäsin windowsin kun se liittyi.

	~$ sudo mkdir /srv/salt/win
	~$ sudo chown root.salt /srv/salt/win
	~$ sudo chmod ug+rwx /srv/salt/win
	~$ sudo salt-run winrepo.update_git_repos
	~$ sudo salt -G 'os:windows' pkg.refresh_db

Sain tällä repositorystä suoraan paketteja.
Tarkoituksena oli installata kaikki paketit, laittaa hello.txt, joka kertoo mitä tapahtui + ehkä uninstallaa salt + chocolatey

Ongelmana windows saltin kanssa on lähinnä timeoutin takia tulevat false negativet.
Salt olettaa että paketit ei ole asennettuja, vaikka tosiasiassa windows asensi ne negatiivisen vastauksen jälkeen.
Tämän takia en saa require konditionaaleja millään tavalla läpi. Otin uuden orjan fresh installista. Seuraavaa tapahtui:


		windowskolmas:
		----------
	          ID: windesktop
	    Function: pkg.installed
	      Result: False
	     Comment: The following packages failed to install/update: vlc, libreoffice, 7zip
	              The following packages were installed/updated: chocolatey, firefox
	     Started: 18:44:15.584660
	    Duration: 294750.744 ms
	     Changes:   
	              ----------
	              7zip:
	                  ----------
	                  install status:
	                      success
	              chocolatey:
	                  ----------
	                  new:
	                      0.10.11
	                  old:
	              firefox:
	                  ----------
	                  new:
	                      63.0
	                  old:
	              libreoffice:
	                  ----------
	                  install status:
	                      success
	              vlc:
	                  ----------
	                  install status:
	                      success
			----------
	          ID: chocoinstalls
	    Function: chocolatey.installed
	        Name: reaper
	      Result: True
	     Comment: 
	     Started: 18:49:10.351022
	    Duration: 20313.702 ms
	     Changes:   
	              ----------
	              reaper:
	                  ----------
	                  new:
	                      - 5.961
	                  old:
			----------
	          ID: C:\hello.txt
	    Function: file.managed
	      Result: True
	     Comment: File C:\hello.txt updated
	     Started: 18:49:30.695975
	    Duration: 62.494 ms
	     Changes:   
	              ----------
	              diff:
	                  New file
	
	Summary for windowskolmas
	------------
	Succeeded: 2 (changed=3)
	Failed:    1
	------------
	Total states run: 3	
	Total run time: 315.127 s

Ehkä ratkaisuna on oikeasti laittaa vähintään 30min timeout rajaksi että oikeat asiat asentuvat. 
Näin ollen saisi req toimimaan?

Sain dropbox linkin lataamaan tieskarille. Piti laittaa absoluuttinen dl linkki + oikea md5hash että toimii.
Tämän voi tehdä linux tai windows ilman suuremmitta ongelmia.
