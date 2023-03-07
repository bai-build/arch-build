
Notable changes in 0.32 since 0.31)
===================================

* Python 3 is now preferred.  Python 2 support is deprecated, and it's
  possible that we'll stop new development for Python 2 fairly soon.
  If so, we'll probably continue to fix bugs in the last Python 2
  compatible version for a while, but please make plans to migrate.

  At the moment, ./configure doesn't explicitly look for any python
  newer than python3.8 by default (though one might be selected by the
  eventual python3 fallback).  If desired, you can explicitly select a
  version like this:

      PYTHON=python3.9 ./configure

* With Python 3.9, the command line reported in tools like `ps` and
  `top` will be `python...` rather than `bup...`.  This was caused by
  an upstream change that appears to have been reverted.  We're likely
  to avoid the issue entirely in a future relese.

Bugs
----

* A number of Python 3 compatibility problems have been fixed.

* `bup web` should no longer crash when attempting to listen on IPV6
  interfaces.

* `bup restore -vv` should no longer crash when printing paths with
  Python 3.

* `bup --prune-older --pretend` should format the plus/minus lines
  correctly now.

* The `TTY_WIDTH` should now be correctly propagated to subprocesses
  and remotes..

* Errors encountered while writing packfiles should be handled more
  carefully.

* Some issues with the handling of integral type signs and sizes on
  the C side have been fixed.

Build and install
-----------------

* The tests are now handled by pytest.  See the
  [README](../README#getting-started) for the additional dependency
  information and further instructions.

Thanks to (at least)
====================

Christian Brabandt, Greg Troxel, Gustavo Goretkin, Jean-Paul Marmorat,
Johannes Berg, Karl-Philipp Richter, Rob Browning, and danpawlikZ
