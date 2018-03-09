api = 2
core = 7.x

; log_filter
projects[log_filter][subdir] = "develop"
projects[log_filter][version] = "1.4"

; module_filter
projects[module_filter][subdir] = "develop"
projects[module_filter][version] = "2.0"

; judy
projects[judy][subdir] = "develop"
projects[judy][version] = "2.2"

; stage_file_proxy
projects[stage_file_proxy][subdir] = "develop"
projects[stage_file_proxy][version] = "1.7"

; ImageCache defaults.
projects[imagecache_defaults][subdir] = "develop"
projects[imagecache_defaults][version] = "1.0-beta4"

; hotjar
projects[hotjar][subdir] = "develop"
projects[hotjar][version] = "1.1"

; masquerade
projects[masquerade][subdir] = "develop"
projects[masquerade][version] = "1.0-rc7"

; maillog
projects[maillog][subdir] = "develop"
projects[maillog][version] = "1.0-alpha1"

;node_revision_delete
projects[node_revision_delete][subdir] = "develop"
projects[node_revision_delete][version] = "2.6"

; devel
projects[devel][subdir] = "develop"
projects[devel][version] = "1.5"

; security_review
projects[security_review][subdir] = "develop"
projects[security_review][version] = "1.2"

; smtp support
projects[smtp][subdir] = "develop"
projects[smtp][version] = "2.x-dev"

; UUID features.
projects[uuid_features][subdir] = "develop"
projects[uuid_features][version] = "1.x-dev"
projects[uuid_features][patch][] = "https://www.drupal.org/files/issues/uuid_features-support_packaged_file_entities-1229670-36.patch"

; Include the original site.make file.
includes[] = "site.make"

