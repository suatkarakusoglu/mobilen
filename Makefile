.PHONY: publish-production-site

.generate-site:
	emacs --batch -l ./publish.el --funcall dw/publish

generate-production-site:
	PRODUCTION=true make .generate-site

generate-local-site:
	PRODUCTION=false make .generate-site

publish-production-site:
	git checkout gh-pages
	git merge --no-edit main
	make generate-production-site
	git add .
	git commit -m "Publish site."
	git push origin gh-pages
	git checkout main

see-production-site:
	open https://mobilen.art

see-local-site:
	open http://localhost:8080
