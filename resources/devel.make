api = 2
core = 7.x

: administration_language_negotiation
projects[administration_language_negotiation][subdir] = "contrib"
projects[administration_language_negotiation][version] = "1.4"

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

# Testing for build on Drone.

projects[entity_translation][download][branch] = 7.x-1.x
projects[entity_translation][download][revision] = edd540b2e1180db45ad1cea14843daa19e13878a
projects[entity_translation][download][type] = git
projects[entity_translation][subdir] = "contrib"
; Issue #1707156 : Workbench Moderation integration
; https://www.drupal.org/node/1707156
projects[entity_translation][patch][] = https://www.drupal.org/files/issues/workbench_moderation-1707156-63.patch
; Update to entity_translation beta6
; https://webgate.ec.europa.eu/CITnet/jira/browse/NEPT-539
; https://www.drupal.org/node/2859223
projects[entity_translation][patch][] = https://www.drupal.org/files/issues/entity_translation-strict_warning_only_variables_should_be_passed_by_reference-2859223-2.patch
; https://www.drupal.org/node/2856927
projects[entity_translation][patch][] = https://www.drupal.org/files/issues/entity_translation-2856927-8-dual_setter_logic.patch
; https://www.drupal.org/node/2741407
projects[entity_translation][patch][] = https://www.drupal.org/files/issues/entity_translation-respect_pathauto_state-2741407-6_0.patch
; https://www.drupal.org/node/2743685
projects[entity_translation][patch][] = https://www.drupal.org/files/issues/entity_translation-pathauto_update-2743685-2_0.patch
; https://www.drupal.org/node/2877074
projects[entity_translation][patch][] = https://www.drupal.org/files/issues/entity_translation-fix_content_translation_test-2877074-4.patch

