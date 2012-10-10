api = 2
core = 7.x

; Includes ====================================================================
; Include Build Kit install profile makefile via URL
includes[] = https://raw.github.com/trexart/buildkit/master/buildkit.make

;includes[] = https://raw.github.com/trexart/buildkit/master/standard.make

; Modules =====================================================================

;projects[backup_migrate][type] = module
;projects[backup_migrate][subdir] = contrib
;projects[backup_migrate][version] = 2.4

;projects[boxes][type] = "module"
;projects[boxes][subdir] = "contrib"
;projects[boxes][version] = "1.0-beta3"

;projects[date][type] = module
;projects[date][subdir] = contrib
;projects[date][version] = 2.6

;projects[entity][type] = module
;projects[entity][subdir] = contrib
;projects[entity][version] = 1.0-rc3

;projects[entitycache][type] = "module"
;projects[entitycache][subdir] = "contrib"
;projects[entitycache][version] = "1.0"

;projects[feeds][type] = "module"
;projects[feeds][subdir] = "contrib"
;projects[feeds][version] = "2.0-alpha3"

;projects[google_analytics][type] = module
;projects[google_analytics][subdir] = contrib
;projects[google_analytics][version] = 1.2

;projects[job_scheduler][type] = "module"
;projects[job_scheduler][subdir] = "contrib"
;projects[job_scheduler][version] = "2.0-alpha2"

;projects[jquery_update][type] = module
;projects[jquery_update][subdir] = contrib
;projects[jquery_update][version] = 2.2

;projects[libraries][type] = module
;projects[libraries][subdir] = contrib
;projects[libraries][version] = 2.0

;projects[panels][type] = module
;projects[panels][subdir] = contrib
;projects[panels][version] = 3.3

;projects[pathauto][type] = module
;projects[pathauto][subdir] = contrib
;projects[pathauto][version] = 1.2

;projects[markdown][type] = module
;projects[markdown][subdir] = contrib
;projects[markdown][version] = 1.0

;projects[node_export][type] = module
;projects[node_export][subdir] = contrib
;projects[node_export][version] = 3.0

;projects[rules][type] = module
;projects[rules][subdir] = contrib
;projects[rules][version] = 2.2

;projects[token][type] = module
;projects[token][subdir] = contrib
;projects[token][version] = 1.4

;projects[transliteration][type] = module
;projects[transliteration][subdir] = contrib
;projects[transliteration][version] = 3.1

;projects[uuid][type] = module
;projects[uuid][subdir] = contrib
;projects[uuid][version] = 1.0-alpha3

;projects[views][type] = module
;projects[views][subdir] = contrib
;projects[views][version] = 3.5

;projects[views_slideshow][type] = module
;projects[views_slideshow][subdir] = contrib
;projects[views_slideshow][version] = 3.0

;projects[wysiwyg][type] = module
;projects[wysiwyg][subdir] = contrib
;projects[wysiwyg][version] = 3.5

;projects[ckeditor][type] = module
;projects[ckeditor][subdir] = contrib
;projects[ckeditor][version] = 1.9

; Features ====================================================================

;projects[my_feature][type] = module
;projects[my_feature][subdir] = features
;projects[my_feature][location] = http://fserver.trexart.com/fserver ; from a feature server
;projects[my_feature][download][type] = "git"
;projects[my_feature][download][url] = git.github.com/trexart/my_feature.git

; Libraries ===================================================================

; CKEditor
;libraries[ckeditor][download][type]= "get"
;libraries[ckeditor][download][url] = "http://download.cksource.com/CKEditor/CKEditor/CKEditor%203.6.5/ckeditor_3.6.5.tar.gz"
;libraries[ckeditor][directory_name] = "ckeditor"
;libraries[ckeditor][destination] = "libraries"