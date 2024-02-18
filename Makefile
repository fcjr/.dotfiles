TOP_TARGETS := install

SUBDIRS := $(wildcard */)

$(TOP_TARGETS): $(SUBDIRS)
$(SUBDIRS):
	echo "stow $@"
	stow -D "$@"
	stow "$@"

.PHONY: $(TOP_TARGETS) $(SUBDIRS)
