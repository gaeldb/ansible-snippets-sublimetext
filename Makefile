INSTALL_DIR  	?= ~/.config/sublime-text/Packages/User/Ansible-snippets
GENERATION_DIR	= ./snippets
DEFAULT_DIR		= ./default-snippets


generate:
	mkdir -p $(GENERATION_DIR)
	bash generate.sh

install:
	mkdir -p $(INSTALL_DIR)
	cp -v $(DEFAULT_DIR)/*.sublime-snippet $(INSTALL_DIR)/
	cp -v $(GENERATION_DIR)/*.sublime-snippet $(INSTALL_DIR)/

uninstall:
	rm -rf $(INSTALL_DIR)/

clean:
	rm -rf $(GENERATION_DIR)/

all:
	generate
	install
	uninstall
	clean

.PHONY: clean generate install uninstall
