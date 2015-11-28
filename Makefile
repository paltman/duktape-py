build:
	cython duktape.pyx
	python setup.py build_ext --inplace

buildtest:
	cython -X linetrace=True duktape.pyx
	CYTHON_TRACE=1 python setup.py build_ext --inplace

test: buildtest
	py.test -xv --cov=duktape.pyx

clean:
	rm -rf build/ duktape.c duktape*.so

.PHONY: build clean
