# DTT Toolkit upgrade

## Introduction

This package is used to allow DTT to test toolkit without actually upgrading
their starterkit. It contains a custom composer.json that executes steps before
installing the toolkit to simulate the upgrade. It will allow DTT to run their
codebase on a Drone pipeline so they can give feedback as to what is missing or
should be improved.

These are current steps performed on the codebase prior to executing the pipeline
steps: https://github.com/ec-europa/dtt-toolkit-upgrade/blob/master/src/composer.json#L11-L23

## Upgrade steps explained

### PHPCS ruleset

The first step in the upgrade proces renames `resources/phpcs-custom.xml` to
`phpcs-ruleset.xml`. Usually there are no further steps required. But since we
are building resources in the europa theme folder which is located in lib/ the
custom upgrade script is adding some exclusions regarding that theme to the file
after moving it to the correct location:

```shell
# Move file.
mv resources/phpcs-custom.xml phpcs-ruleset.xml
# Delete last line.
sed -i '$ d' phpcs-ruleset.xml
# Append extra exclusions.
echo \"$(cat vendor/ec-europa/dtt-toolkit-upgrade/src/phpcs-ruleset.xml)\" >> phpcs-ruleset.xml
```

### Copy resources

We copy all resources needed to allow your project to run toolkit in Drone:
```shell
# Copy the general build files into the root folder.
# - props file contains property mappings from starterkit to toolkit.
# - xml file contains new build targets to allow Drone to build on toolkit.
cp -Rf vendor/ec-europa/dtt-toolkit-upgrade/build.project.* ./
# The individual project properties are being copied into the resources folder.
cp -Rf vendor/ec-europa/dtt-toolkit-upgrade/resources ./
```

### Copy tests files

We are placing the composer.json and composer.lock file that was previously
located in your resources folder into your tests folder. An extra requirement
with this is to also define your `bin-dir` as "bin". We are executing the tests
from within the tests folder because the resources will actually be deployed to
production:

```shell
# Copy the composer files with the bin-dir added to it.
cp -Rf vendor/ec-europa/dtt-toolkit-upgrade/tests ./
# Add lines with brower and capabiities to run on headless chrome.
sed -i '/      selenium2:/ r vendor/ec-europa/dtt-toolkit-upgrade/src/behat.yml.dist' tests/behat.*.dist
# Remove all lines that have a step to with for AJAX (issue will be explained).
sed -i '/And I wait for AJAX to finish/d' tests/features/**/*.feature
```

### Make new locations for the modules and themes

Toolkit symlinks individual modules instead of entire folders to be more in line
with the way composer builds your project. To simulate the upgrade we make new
directories for `custom` modules and `features` under `Lib/modules`.

After we have the folders we symlink all individual modules to the new location.

```shell
# Make new location directories.
mkdir lib/modules/custom && mkdir lib/modules/features
# Symlink all custom modules and remove the custom folder to avoid recursion.
ln -s $(pwd)/lib/modules/*/ lib/modules/custom && rm lib/modules/custom/custom
# Symlink all custom features.
ln -s $(pwd)/lib/features/*/ lib/modules/features
# Symlink the entire dev_modules foler so we can access it as well during build.
ln -s $(pwd)/resources/dev_modules lib/modules/custom/dev_modules
```

### Install toolkit

The last step installs the toolkit as we have executed all steps to simulate and
upgrade from starterkit to toolkit:

```shell
PROJECT=$(pwd) composer run-script toolkit-install -d ./vendor/ec-europa/toolkit
```