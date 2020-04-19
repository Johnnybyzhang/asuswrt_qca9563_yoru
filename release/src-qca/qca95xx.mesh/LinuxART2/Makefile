INSTALLKMODDIR:=$(INSTALLDIR)/lib/modules/$(LINUX_KERNEL)
PBBINS=$(wildcard prebuild/*)
BINS=$(filter %.bin,$(PBBINS))
EXEC=$(filter %.out,$(PBBINS))
LIBS=$(filter %.so,$(PBBINS))
KMOD=$(filter %.ko,$(PBBINS))

all:

install:
	@[ -d $(INSTALLDIR)/usr/sbin ] || install -d $(INSTALLDIR)/usr/sbin
	@for i in $(BINS); do install -D $$i $(INSTALLDIR)/usr/sbin ; done
	@for i in $(EXEC); do install -D $$i $(INSTALLDIR)/usr/sbin ; done
	@[ -d $(INSTALLDIR)/usr/lib ] || install -d $(INSTALLDIR)/usr/lib
	@for i in $(LIBS); do install -D $$i $(INSTALLDIR)/usr/lib ; done
	@[ -d $(INSTALLKMODDIR) ] || install -d $(INSTALLKMODDIR)
	@for i in $(KMOD); do install -D $$i $(INSTALLKMODDIR) ; done

clean:

stage:
