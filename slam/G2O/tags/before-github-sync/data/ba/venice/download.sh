#!/bin/sh

URL=http://ais.informatik.uni-freiburg.de/projects/datasets/g2o-datasets/venice871.g2o.gz

wget -U Mozilla/5.0 $URL
for i in *.gz; do
  gunzip $i
done
