# DTT Toolkit upgrade

## Introduction

This package is used to allow DTT to test toolkit without actually upgrading
their starterkit. It contains a custom composer.json that executes steps before
installing the toolkit to simulate the upgrade. It will allow DTT to run their
codebase on a Drone pipeline so they can give feedback as to what is missing or
should be improved.

These are current steps performed on the codebase prior to executing the pipeline
steps: https://github.com/ec-europa/dtt-toolkit-upgrade/blob/master/src/composer.json#L11-L23

