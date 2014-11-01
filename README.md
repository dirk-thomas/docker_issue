Issue with Docker
=================

The example in this repo demonstrates an issue with Docker I ran into.

Summary
-------

The Dockerfile creates a user named `builder` and then invokes `su builder -c dpkg-buildpackage` in the `CMD` line.
The problem is that `dpkg-package` runs only half way through and then terminates the container.

Actual behavior
---------------

The script wrapping the `dpkg-package` invocation does not continue to run.
Instead the container terminates unexpectedly.


Expected behavior
-----------------

`dpkg-package` should finish correctly (which would result in the sourcedeb files being generated correctly as well as some more output).
Furthermore the wrapping script would output several more messages.

Commands to reproduce
---------------------

    git clone https://github.com/dirk-thomas/docker_issue.git /tmp/docker_issue
    cd /tmp/docker_issue
    docker build -t docker_issue .
    docker run docker_issue

"Workarounds" not showing the problem
-------------------------------------

* Drop into the interactive shell and call the exact same command there:

        docker run -i -t docker_issue sh
        /tmp/sourcedeb/script/run.sh

* Invoke `dpkg-buildpackage` with `root` instead of the normal user `builder` by changing the `CMD` to:

        CMD ["sh", "-c", "/tmp/sourcedeb/script/run.sh"]
