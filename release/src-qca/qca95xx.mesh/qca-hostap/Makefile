PBBINS=$(wildcard prebuild/*)
QCAHOSTAP_SH=$(filter %.sh,$(PBBINS))
QCAHOSTAP_EXEC=$(filter-out $(QCAHOSTAP_SH),$(PBBINS))

# librt.so
CROSS_TOOLCHAIN_DIR=$(TOOLCHAIN)
LIBRT_VERSION=0.9.33.2

all:

install:
	@install -D $(CROSS_TOOLCHAIN_DIR)/lib/librt-$(LIBRT_VERSION).so $(INSTALLDIR)/lib/librt-$(LIBRT_VERSION).so
	@cd $(INSTALLDIR)/lib && ln -sf librt-$(LIBRT_VERSION).so librt.so
	@cd $(INSTALLDIR)/lib && ln -sf librt-$(LIBRT_VERSION).so librt.so.0
	$(STRIP) $(INSTALLDIR)/lib/*
	@[ -d $(INSTALLDIR)/usr/bin ] || install -d $(INSTALLDIR)/usr/bin
	@for i in $(QCAHOSTAP_EXEC); do install -D $$i $(INSTALLDIR)/usr/bin ; done
	@$(STRIP) $(INSTALLDIR)/usr/bin/*
ifeq ($(AMAS),y)
	@[ -d $(INSTALLDIR)/usr/sbin ] || install -d $(INSTALLDIR)/usr/sbin
	@for i in $(QCAHOSTAP_SH); do install -D $$i $(INSTALLDIR)/usr/sbin ; done
endif

clean:

stage:
