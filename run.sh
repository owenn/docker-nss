#!/bin/bash 
# The following script will do a random user to the

DB_DIR=/etc
ID=`id -u`
GROUP=`id -g`

cat <<EOF >> $DB_DIR/passwd
randouser:x:${ID}:${GROUP}:Rando User,,,:`pwd`:/bin/bash
EOF

# If the GID already exists then no probs. First entry
# wins

cat <<EOF >> $DB_DIR/group
randogroup:x:${GROUP}:randouser
EOF

echo "Using $@"
exec "$@"
