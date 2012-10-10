; distro.make
; Usage:
; $ drush make distro.make [directory]

api = 2
core = 7.x

; Include Build Kit distro makefile via URL
includes[] = https://raw.github.com/trexart/buildkit/master/distro.make

; Add myprofile to the full Drupal distro build
projects[myprofile][type] = profile
projects[myprofile][download][type] = git
projects[myprofile][download][url] = git://github.com/myname/myprofile.git