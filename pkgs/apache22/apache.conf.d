# Configuration file for the httpd service.

#
# The default processing model (MPM) is the process-based
# 'prefork' model. A thread-based model, 'worker', is also
# available, but does not work with some modules (such as PHP).
# The service must be stopped before changing this variable.
#
#HTTPD=/usr/sbin/httpd.worker

#
# To pass additional options (for instance, -D definitions) to the
# httpd binary at startup, set OPTIONS here.
#
#OPTIONS=
