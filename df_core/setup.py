try:
    from setuptools import setup
except ImportError:
    from distutils.core import setup

config = {
    'description': '',
    'author': 'bonext',
    'download_url': '',
    'author_email': '',
    'version': '0.1.0',
    'install_requires': ['nose'],
    'packages': ['df_core'],
    'scripts': [],
    'name': 'projectname'
}

setup(**config)
