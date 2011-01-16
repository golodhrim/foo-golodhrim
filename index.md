---
title: golodhrim/foo-golodhrim@GitHub
layout: default
author: Martin Scholz (martin@scholz-net.org)
tecass: Martin Scholz (martin@scholz-net.org)
contact: Martin Scholz (info@scholz-net.org)
---

# Funtoo Overlay from golodhrim #

********

This is the Page for golodhrim\'s overlay for funtoo.

This is the filestructure of the page:

    ├── README
    ├── app-admin
    │   └── sshguard
    │       ├── Manifest
    │       └── sshguard-1.5_rc4.ebuild
    ├── app-crypt
    │   └── cryptkeeper
    │       ├── Manifest
    │       ├── cryptkeeper-0.9.4-r1.ebuild
    │       └── files
    │           └── cryptkeeper-0.9.4-gcc4.4.patch
    ├── app-misc
    │   ├── gcstar
    │   │   ├── Manifest
    │   │   └── gcstar-1.5.0.ebuild
    │   ├── gourmet
    │   │   ├── Manifest
    │   │   └── gourmet-0.15.7.ebuild
    │   ├── gtimer
    │   │   ├── Manifest
    │   │   └── gtimer-2.0.0.ebuild
    │   ├── hotot│   │   ├── Manifest
    │   │   └── hotot-9999.ebuild
    │   └── yapet
    │       ├── Manifest
    │       ├── files
    │       │   └── yapet_0.7_patch_bug_46.patch
    │       └── yapet-0.7.ebuild
    ├── app-office
    │   ├── libreoffice
    │   │   ├── Manifest
    │   │   ├── files
    │   │   │   ├── 32_disable_valgrind-alloc.diff
    │   │   │   ├── autogen_noconfigure.diff
    │   │   │   ├── disable_gentoo-pax.diff
    │   │   │   ├── disable_gentoo-pythonpath.diff
    │   │   │   ├── disable_python.diff
    │   │   │   ├── download_external_sources.diff
    │   │   │   ├── env_log.diff
    │   │   │   ├── gentoo-prefix.diff
    │   │   │   └── gentoounstable.diff
    │   │   ├── libreoffice-3.2.99.2.ebuild
    │   │   └── libreoffice-3.3.0_pre.ebuild│   └── libreoffice-bin
    │       ├── Manifest
    │       ├── files
    │       │   ├── 50-libreoffice-bin
    │       │   └── wrapper.in
    │       └── libreoffice-bin-3.3.0_beta1.ebuild
    ├── app-text
    │   ├── context-dstroke
    │   │   ├── Manifest
    │   │   └── context-dstroke-1.111.ebuild
    │   ├── context-minimals
    │   │   ├── Manifest
    │   │   ├── context-minimals-9999.ebuild
    │   │   └── files
    │   │       ├── cont-sys.tex
    │   │       ├── makeproject.py3
    │   │       └── texmfcnf.lua
    │   ├── libwps
    │   │   ├── Manifest
    │   │   └── libwps-0.1.2.ebuild
    │   ├── pyroom
    │   │   ├── Manifest│   │   └── pyroom-0.4.1.ebuild
    │   └── texworks
    │       ├── Manifest
    │       └── texworks-0.2.3.ebuild
    ├── dev-java
    │   └── lucene
    │       ├── Manifest
    │       └── lucene-2.9.1-r1.ebuild
    ├── dev-perl
    │   └── CGI-Ajax
    │       ├── CGI-Ajax-0.707.ebuild
    │       └── Manifest
    ├── dev-php
    │   ├── PEAR-Contact_Vcard_Build
    │   │   ├── Manifest
    │   │   └── PEAR-Contact_Vcard_Build-1.1.2.ebuild
    │   └── PEAR-Contact_Vcard_Parse
    │       ├── Manifest
    │       ├── PEAR-Contact_Vcard_Build-1.1.2.ebuild
    │       └── PEAR-Contact_Vcard_Parse-1.32.0.ebuild
    ├── dev-util
    │   └── boost-build│       ├── Manifest
    │       ├── boost-build-1.43.0.ebuild
    │       └── boost-build-1.44.0.ebuild
    ├── eclass
    │   ├── boost-tools.eclass
    │   ├── boost-utils.eclass
    │   ├── boost.eclass
    │   ├── java-osgi.eclass
    │   └── qt4-edge.eclass
    ├── gnome-extra
    │   └── gnome-commander
    │       ├── Manifest
    │       ├── gnome-commander-1.2.8.4.ebuild
    │       ├── gnome-commander-1.2.8.5.ebuild
    │       ├── gnome-commander-1.2.8.6.ebuild
    │       └── gnome-commander-1.2.8.8.ebuild
    ├── media-gfx
    │   └── blender
    │       ├── Manifest
    │       ├── blender-9999.ebuild
    │       └── files
    │           ├── blender-2.5-bmake.patch
    │           ├── blender-2.5-doxygen.patch
    │           ├── blender-2.5-eigen.patch
    │           ├── blender-2.5-glew.patch
    │           └── blender-desktop.patch
    ├── media-plugins
    │   ├── calf
    │   │   ├── Manifest
    │   │   ├── calf-0.0.17.ebuild
    │   │   ├── calf-0.0.18.5.ebuild
    │   │   ├── calf-0.0.18.6.ebuild
    │   │   ├── calf-9999.ebuild
    │   │   └── files
    │   │       └── c-files-include.patch
    │   ├── invada-studio-plugins
    │   │   ├── Manifest
    │   │   ├── files
    │   │   │   └── 0.3.1-ladspa.patch
    │   │   └── invada-studio-plugins-0.3.1.ebuild
    │   └── invada-studio-plugins-lv2
    │       ├── Manifest
    │       └── invada-studio-plugins-lv2-1.2.0.0.ebuild
    ├── profiles
    │   └── repo_name
    ├── raw
    │   └── master
    │       └── LICENSE
    ├── sci-mathematics
    │   └── zul
    │       ├── Manifest
    │       └── zul-99999.ebuild
    ├── www-apps
    │   └── sql-ledger
    │       ├── Manifest
    │       └── sql-ledger-2.8.30.ebuild
    └── x11-apps
        └── axkb
	    ├── Manifest
	    ├── axkb-0.4.2.ebuild
	    └── axkb-9999.ebuild

**************
## Tools Description
**************
### axkb

A locale Switcher for different keyboard layouts for use with Openbox.

### sql-ledger

ERP tool for OS independent usage via Browser interface

### zul

Mathmatical contrution kit with circle and ruler.

### calf

plugin package for jack

### invada studio

plugin package for jack

### blender

version 2.5 of the 3D moddeling suite Blender

### gnome-commander

filemanager im MC style for Gnome

### PEAR Contact Vcard Build

PEAR packet for usage with sql-ledger/lx-office

### PEAR Contact Vcard Parse

PEAR packet for usage with sql-ledger/lx-office

### CGI Ajax

Perl Packet for usage with lx-office

### lucene

searching engine for usage with libreoffice

### texworks

nice simple TeX Editor

### pyroom

Do not get been disturbed by anything while writing your texts...

### libwps



### ConTeXt minimals

Great Text-preparation Toolkit

### ConTeXt dstroke

Doublestroke font to use with ConTeXt minimals

### libreoffice-bin

Fork of the OpenOffice Project in binary format

### libreoffice

Fork of the OpenOffice Project to be compiled from the sources

### sshguard

implementation of the new sshguard version

### cryptkeeper



### gcstar

Simple and nice collection manager

### gourmet

version 0.15.7 of the gourmet recipe manager software

### gtimer

project timer tool

### hotot

simple client for twitter.

### yapet

console password manager tool


