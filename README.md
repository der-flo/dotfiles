# My dotfiles

```
git clone git://github.com/der-flo/dotfiles ~/dotfiles
cd ~/dotfiles

rake homebrew

echo /usr/local/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish
curl -L https://get.oh-my.fish | fish

rake install
```

## Install software by hand

* Adium
  * [Patch](https://news.softpedia.com/news/how-to-fix-broken-auto-scrolling-in-adium-on-macos-catalina-527933.shtml) it
* BitBar
* Bitwarden
* Cyberduck
* Dash
* Docker Desktop
* FUSE for macOS
* GIMP
* Google Chrome
* Hammerspoon
* Homebrew
* Karabiner-Elements
* MacVim
* MySQL Workbench
* Octotree
* P4Merge
* Seafile Client
* Sequel Pro
* Signal
* SourceTree
* Spotify
* Tampermonkey for Chrome
* VeraCrypt
* Wireshark

## Generate SSH keypairs

Generate quite secure (according to
[Secure Secure Shell](https://stribika.github.io/2015/01/04/secure-secure-shell.html))
SSH keypairs:

```
ssh-keygen -t ed25519 -o -a 100
ssh-keygen -t rsa -b 4096 -o -a 100
```

## Misc. macOS configuration

TODO: Alles auf englisch?

TODO: Konfigurationsoptionen auch irgendwie via Kommandozeile möglich und so
      besser dokumentierbar?
      https://github.com/skwp/dotfiles/blob/master/bin/macos

* Setup hostname
  ```
  sudo scutil --set HostName flo.adigi.ai
  sudo scutil --set ComputerName flo.adigi.ai
  ```
* Operator Mono Nerd Font
* Tastatur
  * → Kurzbefehle
    * Mission Control → "Zu Schreibtisch X wechseln" aktivieren
    * Tabulatortaste: Alle Steuerungen
  * → Tastatur
    * Tastatur- und Emoji-Übersichen in der Menüleiste anzeigen
  * TODO: → Text: Korrekturzeug weg?
* Mission Control
  * → "Monitore verwenden verschiedene Spaces" deaktivieren
  * → "Spaces automatisch anhand der letzten Verwendung ausrichten" deaktivieren
* Systemeinstellungen
  * Sicherheit → Allgemein
    * Passwort "sofort" erforderlich
* de-nodeadkeys:
  https://foo-blog.de/2010/05/der-mac-und-die-toten-tasten/
  http://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&id=ukelele
  https://apple.stackexchange.com/questions/44913/make-a-custom-keyboard-layout-the-system-default-even-for-the-login-screen/44916#44916

  TODO: Hat ein selbstgebautes Bundle kein Problem mit der Icon-Darstellung?
* der-flo.org-CA installieren
* Nww-CA installieren

## Setup track

TODO: Wohl unvollständig
```
cd track
rake build
sudo gem install track
track config redmine_url https://adigi.planio.de
track config redmine_api_key XXX
mkdir ~/.bitbar
open track-url-handler.app
```

<<Tampermonkey-Skript installieren>>


## Notes on used software

### mysql-connector-c

`mysql_config` seems wrong in this package, I had to
[patch it](https://stackoverflow.com/a/44790834) in order to get the `mysql2`
gem compiling.

### Chrome

* Install private Tampermonkey scripts
* Transfer bookmarks
* Configure start page

## Why I'm not using …

### Safari

* Pinned tabs show up in every open window. That's not optimal for my use case
(mailers, messengers).
* Clicking links with custom URL schemes always result in a security warning.
  This is not configurable because of
  [possible exploits](https://digitasecurity.com/blog/2018/08/30/windshift/).
  I use such a custom scheme for time tracking, so this is quite a blocker for
  me.

So Chrome is actually the way to go for me.

## More actually not used software

* See [install_homebrew_software.sh](install_homebrew_software.sh)
* SuperDuper
* TeamViewer
* Google Hangouts Chat App
* iTerm
* Atom, VS Code
* DBeaver, HeidiSQL
* Xcode

## Inspirations

Inspired by or shamelessly copied from

* https://github.com/hoffi/dotfiles
* https://github.com/ryanb/dotfiles
* https://github.com/skwp/dotfiles

---

## TODO: Prerequisites

* A terminal with support for 256 colors (<tt>TERM=xterm-256color</tt>)

