#!/usr/bin/env bash

# This workaround is needed to apply the good selinux label for the ly binary at boot time
# See https://universal-blue.discourse.group/t/selinux-workarounds-for-binaries-with-the-wrong-label/342
# And https://github.com/ublue-os/bluefin/issues/727

cp /usr/bin/ly /usr/local/bin/ly
mount --bind /usr/local/bin/ly /usr/bin/ly
semanage fcontext -a -t xdm_exec_t "/usr/bin/ly"
restorecon /usr/bin/ly
