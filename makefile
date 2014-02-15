test:
	@mocha
	@make commit
commit:
	@git add .
	@git commit -am"$(message) `date`" || :
push: commit
	@git push origin --all
publish: push
	@npm publish
.PHONY: test
