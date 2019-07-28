#!/bin/bash

[ ! -e ./configure ] && ./autogen.sh


sed -i.bak -e 's/<< uploaded_adjusted/<< 50*uploaded_adjusted/' ./src/tracker/tracker_http.cc
sed -i.bak -e 's/m_normal_interval(1800)/m_normal_interval(600)/' ./src/torrent/tracker.cc
sed -i.bak -e 's/:max(600, v), 8 . 3600/:max(60, v), 600/' src/torrent/tracker.h
sed -i.bak -e 's/:max(300, v), 4 . 3600/:max(30, v), 500/' src/torrent/tracker.h

#./configure CXXFLAGS="-fPIC -std=c++11" --prefix=/usr
./configure CXXFLAGS="-fPIC -std=gnu++11" --prefix=/usr && \
make install -j 32


