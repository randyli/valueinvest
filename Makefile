.PHONY: fetch calc api demo

CODE ?= 600519

fetch:
	python backend/fetch_data.py --code $(CODE)

calc:
	python backend/calc_iv.py --code $(CODE)

api:
	uvicorn backend.app:app --reload --port 8000

demo:
	python -m http.server 8080 --directory frontend
