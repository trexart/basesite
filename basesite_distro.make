api = 2
core = 6.x

projects[drupal][type] = core
projects[drupal][version] = "6.22"

; Includes ====================================================================

includes[] = https://raw.github.com/trexart/buildkit/6.x-1.x/developer.make

includes[] = https://raw.github.com/trexart/buildkit/6.x-1.x/standard.make

; Override buildkit ===========================================================

; Modules =====================================================================

projects[transliteration][subdir] = contrib
projects[transliteration][version] = 3.0

; Themes ======================================================================

; Libraries ===================================================================

; Profiles ====================================================================

projects[simple][type] = profile
projects[simple][download][type] = git
projects[simple][download][url] = git://github.com/trexart/basesite.git
;projects[simple][download][branch] = 6.x
projects[simple][download][branch] = master