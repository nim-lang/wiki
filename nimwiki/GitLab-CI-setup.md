# GitLab CI

This page contains instructions on how to set up the GitLab CI runner on your machine. Perfect if you would like to allow us to use it in our continuous integration pipeline.

The installation is fairly simple, but there are some problems that need a workaround. In particular for Windows.

Basically, you want to follow the following instructions to set up the runner: https://gitlab.com/gitlab-org/gitlab-ci-multi-runner#install-gitlab-runner (pick the ones for your OS).

## General information needed during setup

Specify the following URL during runner setup: ``https://gitlab.com/ci``

Use the following registration token during setup: ``yWbuZXxvWK3ypissf7bL``

### Tags

Please apply the following tags based on your build machine's characteristics:

* ``linux`` - The builder runs on Linux
* ``windows`` - The builder runs on Windows
* ``bsd`` - The builder runs on FreeBSD, OpenBSD etc. (exception: macOS).
* ``macos`` - The builder runs on Mac OS X.
* ``fast`` - The builder is relatively fast, defined by the fact that it can run the test suite in under two hours.
* ``amd64`` - The builder runs on a 64bit OS/CPU.
* ``x86`` - The builder runs on a 32bit OS/CPU.

## On Windows?

There is currently an open issue for the GitLab CI runner which means that artifacts are not handled properly on Windows. The workaround for now is to use a slightly older version of it. For more details see [here](https://gitlab.com/gitlab-org/gitlab-ci-multi-runner/issues/1523).

Basically download v1.3.4, amd64 download here: https://gitlab-ci-multi-runner-downloads.s3.amazonaws.com/v1.3.4/binaries/gitlab-ci-multi-runner-windows-amd64.exe