.PHONY: install

install: lib.typ
	install -D lib.typ ~/.local/share/typst/packages/local/local-query/0.1.0/lib.typ
	install -D LICENSE ~/.local/share/typst/packages/local/local-query/0.1.0/LICENSE
	install -D typst.toml ~/.local/share/typst/packages/local/local-query/0.1.0/typst.toml
