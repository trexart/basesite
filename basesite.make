api = 2
core = 6.x

; Includes ====================================================================

includes[] = https://raw.github.com/trexart/buildkit/6.x-1.x/developer.make

includes[] = https://raw.github.com/trexart/buildkit/6.x-1.x/standard.make

; Override buildkit ===========================================================

; Modules =====================================================================

;projects[mollom][subdir] = contrib
;projects[mollom][version] = 1.0

; Themes ======================================================================

; Libraries ===================================================================

libraries[profiler][download][type] = git
libraries[profiler][download][url] = http://git.drupal.org/project/profiler.git
libraries[profiler][download][revision] = 0fad6aacad6788815e97f6b95d5c6ef8a2d7313c