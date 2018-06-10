#!/bin/bash
mv scripts/vscripts/trigger/passcorner.lua scripts/vscripts/trigger/PassCorner.lua
mv scripts/npc/spawner.txt scripts/npc/Spawner.txt
perl-rename 's/ability(\w)/ability\u$1/g' scripts/vscripts/abilities/*
