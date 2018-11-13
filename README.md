# Getting started with pandas dev

This is a repo to bootstrap you to get going with [pandas development](https://github.com/pandas-dev/pandas)

This helps setting up [development environment](http://pandas-docs.github.io/pandas-docs-travis/contributing.html#contributing-dev-env) 
quickly.

History: built for onboarding at
[Pycon 2018 Canada sprint](https://github.com/pyconca/2018-wiki/wiki/Sprints)


# Dependency

This requires you to have [Docker](https://docs.docker.com/docker-for-mac/) installed.  We relie on Docker 
to keep our environment homogenous between developers.

# Getting started

## 1. Setting up your pandas source folder

Create a fork of the [pandas repo](https://github.com/pandas-dev/pandas/) following
this [instructions](https://guides.github.com/activities/forking/)

Then you can start pulling it into your repo.
```
git clone https://github.com/<your user name>/pandas.git
git remote add upstream git@github.com:pandas-dev/pandas.git
```

See [adding upstream and merge](https://help.github.com/articles/configuring-a-remote-for-a-fork/)
for understanding the upstream setup.

## 2. Building the docker image

```
make build
make run
# This will put you into the shell of the image.
```

Once you are in the docker image, run:

```
$ conda activate pandas-dev
$ python scripts/validate_docstrings.py pandas.DataFrame.mean
```

Note that if the above doesnt run, with the error:

```
ImportError: C extension: No module named 'pandas._libs.tslibs.conversion' not built. If you want to import pandas from the source directory, you may need to run 'python setup.py build_ext --inplace --force' to build the C extensions first.
```

You will need to run:

```
python setup.py build_ext --inplace -j 4 && python -m pip install -e .
```


# Some development notes

## Docs contributing guideline

* [Contributing guideline](http://pandas-docs.github.io/pandas-docs-travis/contributing.html#contributing-to-the-documentation)
* [reST introduction](http://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html)
