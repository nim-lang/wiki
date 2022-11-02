Official branches
=================

**The information in this document is outdated.**

**This is a Work In Progress. Discuss on the IRC channel**.

There are two official branches: *stable* and *devel*. The *stable* branch is
a public facing branch which only contains whatever has been publicly released
as a zip/exe/installer/whatever and linked from
http://nimrod-lang.org/download.html. The purpose of the *stable* branch is
being able to *react* to environment changes outside of the normal development
cycle. By keeping an *untainted* source code branch *hotfixes* can be issued if
necessary.

The *devel* branch is a development branch where code scheduled for the next
stable is scheduled. Code **not meant to be** in the next stable release should
be put in a third branch, named at will by the developer in charge of it.
During normal development, code is added to *devel*, and contributors make
pull requests based off of *devel*.

When a *hotfix* has to be issued, a branch is created off of the *stable*
branch, necessary commits are added to it, and then it is merged into *stable*
to be released publicly (or maybe after a delay to allow other possible
hotfixes to go in that maintenance release) after tagging. Then the *stable*
branch is merged into *devel* so that the hotfix is carried over.

When a normal release is to be done, *devel* is merged into *stable* and
tagged with the release version.

Usage cases
===========

The *stable* branch doesn't exist yet. For the purposes of these examples
please run the following commands to create it:

	$ git checkout v0.9.2
	$ git checkout -b stable

In the future, *stable* will be the current *master*.

Quick web update
----------------

Let's suppose the web, which is generated through ``koch web`` [needs
updating](https://github.com/Araq/Nimrod/issues/750) but *devel* already
contains new files or updated APIs and thus running ``koch web`` in *devel*
would create the *wrong* stable documentation. First create a hotfix branch
based off of *stable*:

	$ git checkout stable
	$ git checkout -b hotfix_web_udpate_750

Now, commit to this branch the necessary changes. In this case we have the
change already on *devel*, so we can run:

	$ git cherry-pick 814e441341245f7a7105c426cf6edcf3aa0edd78

Presumably this is all we need, so merge the hotfix branch into stable and tag
for release.

	$ git checkout stable
	$ git merge hotfix_web_update_750
	$ git branch -d hotfix_web_update_750
	$ git tag vX.X.X

Don't forget to merge back into *devel*:

	$ git checkout devel
	$ git merge stable

Even in this case where you have picked commits form *devel* it makes sense
for git, it will record and empty merge with the metadata saying both branches
contain the same change despite their hashes being different. This helps in the
future for the merge of the stable release.

Normal release
--------------

The normal release is easy:

	$ git checkout stable
	$ git merge devel
	$ git tag vX.X.X

And development continues in *devel*.
