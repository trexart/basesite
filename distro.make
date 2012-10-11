; distro.make
; Usage:
; $ drush make distro.make [directory]

api = 2
core = 7.x

; Include Build Kit distro makefile via URL
includes[] = https://raw.github.com/trexart/buildkit/master/distro.make
;includes[] = http://drupalcode.org/project/buildkit.git/blob_plain/refs/heads/7.x-2.x:/distro.make

; remove buildkit profile download as it isn't needed and downloads a bunch of stuff
projects[buildkit] = null

; Add myprofile to the full Drupal distro build
projects[myprofile][type] = profile
projects[myprofile][download][type] = git
projects[myprofile][download][url] = git://github.com/myname/myprofile.git