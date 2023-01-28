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
	@poetry run mypy .

lint-mypy-report:
	@poetry run mypy . --html-report ./mypy_html

unit-tests:
	@poetry run pytest

unit-tests-cov:
	@poetry run pytest --cov=src --cov-report term-missing --cov-report=html --cov-fail-under=80 --junitxml=pytest.xml | tee pytest-coverage.txt

clean-cov:
	@rm -rf .coverage
	@rm -rf htmlcov
	@rm -rf pytest.xml
	@rm -rf pytest-coverage.txt

format: format-black format-ruff
lint: lint-black lint-ruff lint-mypy