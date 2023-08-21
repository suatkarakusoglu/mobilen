.PHONY: publish-production-site

generate-production-site:
	PRODUCTION=true emacs --batch -l ./publish.el --funcall dw/publish

generate-local-site:
	emacs --batch -l ./publish.el --funcall dw/publish

publish-production-site:
	git checkout gh-pages
	git merge --quiet main
	make generate-production-site
	git add .
	git commit -m "Publish site."
	git push origin gh-pages
	git checkout main
