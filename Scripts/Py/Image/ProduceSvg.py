#!/usr/bin/env python

import os
import sys
import fileinput

if len(sys.argv) < 4:
    print 'Usage: Exec InputBaseSvg OutputSvg \"My Header String\"'
    sys.exit()

header = '@cabecalho@'
headerString = sys.argv[3]

lines = None
baseFilename = sys.argv[1]
outputFilename = sys.argv[2]
with open(baseFilename, 'r') as baseFile:
    lines = baseFile.readlines()

of = open(outputFilename, 'w')

for line in lines:
    if header in line:
       line = line.replace(header, headerString)
    of.write(line)
of.close()
