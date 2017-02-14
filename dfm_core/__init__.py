# vim: set fileencoding=utf-8 :
import sys
import os
import shutil
import json
import argparse


class DotfilesManager(object):
    SCHEME_NAME = 'dfscheme'

    def __init__(self, root):
        self.root = root
        parser = argparse.ArgumentParser(
            description='Dotfile manager v0.1.0',
            usage='''dfm <command> [<args>]

Commands:
    ls    Show available schemes
    setup   Set up according to a scheme'''
        )
        parser.add_argument('command', help='Command to run')
        args = parser.parse_args(sys.argv[1:2])
        if not hasattr(self, args.command):
            print 'Unrecognised command'
            print parser.print_help()
            exit(1)
        else:
            self._build_index()
            getattr(self, args.command)()

    def _build_index(self):
        self.schemes = {}
        for root, dirnames, filenames in os.walk(self.root):
            if self.SCHEME_NAME in filenames:
                with open(os.path.join(root, self.SCHEME_NAME)) as schemefp:
                    scheme = json.load(schemefp)
                    scheme['root'] = root
                    self.schemes[scheme['name']] = scheme

    def _install_scheme(self, scheme, scheme_root):
        for f, t in [(os.path.join(scheme_root, pair['file']), os.path.expanduser(pair['dest'])) for pair in scheme]:
            print 'Copying', f, '->', t
            shutil.copy(f, t)

    def ls(self):
        parser = argparse.ArgumentParser(
            description=''
        )
        args = parser.parse_args(sys.argv[2:])

        print 'List of available schemes'
        print '-------------------------'
        for scheme in self.schemes:
            print scheme["name"], '\t\t\t', scheme['root']
            for config in scheme['configurations']:
                    print ' * ', config['name']

    def setup(self):
        parser = argparse.ArgumentParser(
            description=''
        )
        parser.add_argument('name', help='Config to install', type=str, nargs='+')
        args = parser.parse_args(sys.argv[2:])

        try:
            name = args.name[0]
            scheme = self.schemes[name]
            if len(args.name) > 1:
                sub = args.name[1]
                if sub == 'default':
                    sub = scheme['default']
            else:
                sub = scheme['default']

            print 'Setting up', name, sub
            for config in scheme['configurations']:
                if config['name'] == sub:
                    self._install_scheme(config['scheme'], scheme['root'])
                    exit(0)
            print 'No subscheme', sub, 'in scheme', name

        except KeyError:
            print 'No scheme named', args.name
            exit(1)


    def sync(self):
        pass
