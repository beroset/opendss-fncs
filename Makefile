/usr/local/bin/fncs_player_anon: fncs/fncs_player_anon
	cd fncs && make install
	ldconfig

fncs/fncs_player_anon: fncs/Makefile
	cd fncs && make

fncs/Makefile: fncs/Makefile.in /usr/local/lib/libczmq.so
	cd fncs && ./configure

/usr/local/lib/libczmq.so: czmq/src/libczmq.la
	cd czmq && make install

czmq/src/libczmq.la: czmq/Makefile 
	cd czmq && make check

czmq/Makefile: czmq/Makefile.in
	cd czmq && ./configure

czmq/Makefile.in: czmq/Makefile.am /usr/local/lib/libzmq.so
	cd czmq && ./autogen.sh

/usr/local/lib/libzmq.so: libzmq/src/libzmq.la
	cd libzmq && make install

libzmq/src/libzmq.la: libzmq/Makefile
	cd libzmq && make 

libzmq/Makefile: libzmq/Makefile.in
	cd libzmq && ./configure

libzmq/Makefile.in: libzmq/Makefile.am /usr/local/lib/libsodium.so
	cd libzmq && ./autogen.sh

/usr/local/lib/libsodium.so: libsodium/src/libsodium/.libs/libsodium.a
	cd libsodium && make install

libsodium/src/libsodium/.libs/libsodium.a: libsodium/Makefile
	cd libsodium && make check

libsodium/Makefile: libsodium/Makefile.in
	cd libsodium && ./configure

libsodium/Makefile.in: libsodium/Makefile.am
	cd libsodium && ./autogen.sh



