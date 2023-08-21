generate-production-site:
	PRODUCTION=true emacs --batch -l ./publish.el --funcall dw/publish

generate-local-site:
	emacs --batch -l ./publish.el --funcall dw/publish
