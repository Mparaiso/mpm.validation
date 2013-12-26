test:
	@mocha
	@make commit
commit:
	@git add .
	@git commit -am"auto-commit `date`" || :
push: commit
	@git push origin --all
publish: push
	@npm publish
.PHONY: test
