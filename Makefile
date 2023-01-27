# Makefile
format-black:
	@poetry run black .

format-ruff:
	@poetry run ruff . --fix

lint-black:
	@poetry run black . --check

lint-ruff:
	@poetry run ruff . --diff

lint-mypy:
	@poetry run mypy ./src

lint-mypy-report:
	@poetry run mypy ./src --html-report ./mypy_html

format: format-black format-ruff
lint: lint-black lint-ruff lint-mypy