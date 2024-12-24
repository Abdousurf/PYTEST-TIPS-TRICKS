install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	python -m pytest -vvv --cov=hello --cov=greeting \
	--cov=smath --cov=web --cov=cli tests
	python -m pytest --nbval notebook.ipynb #tests on our notebook
	#python -m pytest -v tests/test_web.py #if you just want test web

debug:
	python -m pytest -vv --pdb  #Debugger is invoked

one-test:
	python -m pytest -vv tests/test_greeting.py::test_my_name4

debugthree:
	python -m pytest -vv --pdb --maxfail=3  # drop to PDB for first three failures

format:
	black *.py
	
lint:
	pylint --disable=R,C *.py

all: install lint test format