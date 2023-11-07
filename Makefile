libs.tar.gz: /usr/local/bin/fncs_player_anon
	tar --exclude="*.a" --exclude="*.la" -cvzf libs.tar.gz /usr/local/lib /usr/local/bin

/usr/local/bin/fncs_player_anon: fncs/fncs_player_anon
	cd fncs && make install-strip
	ldconfig

fncs/fncs_player_anon: fncs/Makefile
	cd fncs && make

fncs/Makefile: fncs/Makefile.in
	cd fncs && ./configure

