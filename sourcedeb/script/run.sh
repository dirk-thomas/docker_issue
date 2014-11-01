#!/usr/bin/env sh

echo "run.sh"
echo ""

cd /tmp/sourcedeb/source
echo "pwd `pwd`"
echo ""

CMD="dpkg-buildpackage -S -us -uc"
echo "invoke: $CMD"
echo ""
$CMD

echo ""
echo "THE SCRIPT DOES NOT REACH THIS LINE - THE DOCKER CONTAINER IS TERMINATED BEFORE"
echo ""

CMD2="ls -al /tmp/sourcedeb"
echo "invoke: $CMD2"
echo ""
$CMD2

echo ""
echo "sleeping for 3s"
sleep 3
echo "done sleeping"
echo ""
