# ZFS MOTD

This follows Ubuntu-style motd generation. This script should be run periodically (cron?) and will generate a
file containing some metrics about your zfs filesystems, then concatenate a directory of files into
`/etc/motd`.

## Getting started

    sudo ./setup.sh

This will create the necessary directories and all that. Also, it'll give you a line to put in your crontab.

To generate motd:

    sudo ./zfs_motd /etc/motd.d

