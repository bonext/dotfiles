#!/usr/bin/env python
# vim: set fileencoding=utf-8 :

import os
import argparse
from dfm_core import DotfilesManager

parser = argparse.ArgumentParser(description='Dotfiles manager v0.1.0')
parser.add_argument('command', choices=['list', 'init', 'sync'])

if __name__ == "__main__":
    args = parser.parse_args()

    manager = DotfilesManager(os.getcwd())

    if args.command == 'list':
        manager.list()
    else:
        raise NotImplementedError(args.command)