test:
	@mocha
commit: test
	@git add .
	@git commit -am"$(message) `date`" || :
push: commit
	@git push origin master --tags
publish: push
	@npm publish
.PHONY: test
