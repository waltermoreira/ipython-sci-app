#!/bin/sh

export PATH=$PATH:/root/python/bin
export PATH=$PATH:$EXTRA_PATH

/usr/bin/supervisord -c /etc/supervisor.conf
if [[ "$#" -eq 0 ]]; then
    ipython notebook --ip 0.0.0.0 --port 8888 --no-browser
elif [[ "$1" =~ ^-.* ]]; then
    # no arguments, or something that looks like an option:
    # redirect to 'intro' to show docs, etc.
    exec intro "$@"
else
    /bin/sh -c "$*"
fi
