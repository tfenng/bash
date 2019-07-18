#!/usr/bin/env python
import os
import sys


def findfile(root_dir, name):
    for rel_path, dirs, files in os.walk(root_dir):
        if name in files:
            full_path = os.path.join(root_dir, rel_path, name)
            print(os.path.normpath(os.path.abspath(full_path)))

if __name__ == '__main__':
    if len(sys.argv) < 2:
        print('Usage: {} directory file_name'.format(sys.argv[0]))
        raise SystemExit(1)
    findfile(sys.argv[1], sys.argv[2])