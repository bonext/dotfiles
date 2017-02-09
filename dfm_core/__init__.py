import os
import json


class DotfilesManager:
    SCHEME_NAME = 'dfscheme'

    def __init__(self, root):
        self.root = root

    def list(self):
        print 'Scheme\t\t\tLocation'
        print '------\t\t\t--------'
        for root, dirnames, filenames in os.walk(self.root):
            if self.SCHEME_NAME in filenames:
                with open(os.path.join(root, self.SCHEME_NAME)) as schemefp:
                    scheme = json.load(schemefp)
                    print scheme["name"], "\t\t\t", os.path.relpath(root, self.root)