import re, commands, subprocess
from sys import platform
from os.path import expanduser

def get_keychain_pass_linux(account=None, server=None):
    params = {
        'account': account,
        'home': expanduser("~")
    }

    command = ["gpg", "--for-your-eyes-only", "-q", "--no-tty", "-d",
               "%(home)s/.config/mutt/credentials/%(account)s.gpg" % params]
    return subprocess.check_output(command)

def get_keychain_pass_osx(account=None, server=None):
    params = {
        'security': '/usr/bin/security',
        'command':  'find-internet-password',
        'account':  account,
        'server':   server
    }

    command = "%(security)s %(command)s -g -a %(account)s -s %(server)s" % params
    outtext = commands.getoutput(command)
    return re.match(r'password: "(.*)"', outtext).group(1)

def get_keychain_pass(account=None, server=None):
    if platform == "darwin":
        return get_keychain_pass_osx(account=account, server=server)
    else:
        return get_keychain_pass_linux(account=account, server=server)
