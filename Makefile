PREFIX=$(DESTDIR)/usr/local/bin
PASS_EXTENSIONS_PREFIX=$(DESTDIR)/usr/lib/password-store/extensions


default:
	@echo "Nothing to do!"
	@echo 'Use "make install" to install the program to $(PREFIX) and $(PASS_EXTENSIONS_PREFIX) .'

install:
	install -D -m755 "passmenu/passmenu-notify.bash" "$(PREFIX)/passmenu-notify"
	install -D -m755 "pass-show-notify.bash" "$(PASS_EXTENSIONS_PREFIX)/show-notify.bash"

uninstall:
	rm "$(PREFIX)/passmenu-notify"
	rm "$(PASS_EXTENSIONS_PREFIX)/passmenu-notify"
