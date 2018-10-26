import subprocess


def mailpasswd(acct):
    path = "email.%s.password" % (acct)
    args = ["pony", "get", path]
    try:
        return subprocess.check_output(args).strip()
    except subprocess.CalledProcessError:
        return ""
