#!/bin/sh

# Kill any old connections hanging around.
pkill -f "ssh -N analytics -L 12821"

# Setup a tunnel to the Product Data Warehouse
ssh -N analytics -L 12821:localhost:3306 &

# Kill any old connections hanging around.
pkill -f "ssh -N deploydb -L 12822"

# Setup a tunnel to Samson's DB
ssh -N deploydb -L 12822:localhost:3306 &
