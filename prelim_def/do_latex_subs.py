#!/usr/bin/python

""" Performs replacements for strings in eps_tex files.
"""

import json
import re
import sys

with open('latex_subs.json') as datafile:
    data = json.load(datafile)

search_pattern = r'((\s*\\put\([0-9]*(\.[0-9]*)?,[0-9]*(\.[0-9]*)?\))\{\\color\[rgb\]\{[0-9]*,[0-9]*,[0-9]*\}\\makebox\([0-9]*,[0-9]*\)\[.*\]\{\\smash\{)(.*)(\}\}\}\%)'

for file_prefix in data['files']:
    if file_prefix.keys()[0] == sys.argv[1]:
        fdata = file_prefix[file_prefix.keys()[0]];
        with open('figures/{0}.eps_tex'.format(file_prefix.keys()[0]), 'r') as cfile, \
             open('figures/{0}.eps_latex'.format(file_prefix.keys()[0]), 'w') as ofile:
            for line in cfile:
                m = re.search(search_pattern, line)
                if m:
                    in_text = m.group(5)
                    out_text = fdata[in_text]
                    out_line = m.group(1) + out_text + m.group(6)
                else:
                    out_line = line.rstrip()

                ofile.write(out_line + "\n")
