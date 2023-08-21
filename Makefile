.PHONY: publish-production-site

generate-production-site:
	PRODUCTION=true emacs --batch -l ./publish.el --funcall dw/publish

generate-local-site:
	emacs --batch -l ./publish.el --funcall dw/publish

publish-production-site:
	make generate-production-site
	git checkout gh-pages
	git merge main
	git push origin gh-pages
	git checkout main
