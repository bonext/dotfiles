#!/usr/bin/env python
# vim: set fileencoding=utf-8 :
import os
import argparse

parser = argparse.ArgumentParser(description='Dotfiles manager v0.1.0')
parser.add_argument('command', choices=['list', 'init', 'sync'])

if __name__ == "__main__":
    args = parser.parse_args()
