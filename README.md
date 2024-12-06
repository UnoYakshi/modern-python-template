# Modern Python Template (MPT)
[![Rye](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/astral-sh/rye/main/artwork/badge.json)](https://rye.astral.sh)
[![Ruff](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/astral-sh/ruff/main/assets/badge/v2.json)](https://github.com/astral-sh/ruff)


## Description
A one-day start [Cookiecutter](https://github.com/cookiecutter/cookiecutter) Python project template with configured up-to-date tools.
It is framework-agnostic as it doesn't come with any framework at all at all [for now].

It features:
- [ ] [Rye](https://rye.astral.sh/) as a package manager
- [ ] code quality tools via pre-commit: [Ruff](https://docs.astral.sh/ruff/), MyPy
- [ ] development and production Docker Compose YAMLs and staged Dockerfile
- [ ] convenient file structure (`src/`, `tests/`, `deploy/`, `scripts/`, `docs/`) with some pre-built files
- [ ] set-up semantic-release for automatic versioning, and tag+release+changelog via GitHub CI
- [ ] `pyproject.toml` with configured and commented scripts, pytest, coverage, black, ruff, etc.


## Why?
There are plenty other Cookiecutter Python templates. More sophisticated, more parametrized, more stable.
Why then create yet another one?

There are two main reasons. 
- It's a good place to store practices, configurations, and tools I encountered throughout my career.
- Most of the templates don't include newer Rust-made tools, Rye and Ruff, that I use extensively. 
  - Because of their high performance and convenience, I believe they should dominate sooner or later.

### `semantic-release` vs. `python-semantic-release`
I've spent way too much my own and others' time configuring local file version update (`src/__init__.py::__version__`).
It'd be great to have the same ready-to-use configuration for `semantic-release` in whatever project/language/paradigm...
But it just doesn't work out of the box w/o `package.json`.
`.releaserc` falls short delivering and would also need an extra prerequisite step --- it's not MPT's purpose.
I want it to run with a single click.

## Usage

To create a new project using this template:

1. Install Cookiecutter if you haven't already:
    ```bash
    pip install cookiecutter
    ```

2. Run the following command and follow the prompts:
    ```bash
    cookiecutter python-project-cookiecutter/
    ```

## Variables

- `project_name`: The name of your project (displayed in documentation).
- `project_slug`: A slugified version of the project name used for directories and files.
- `author_name`: Your name or organization.
- `license`: The license under which your project will be released.
- `main_branch_name`: Choose between `master` and `main` branch.

## File Structure
```
{{ cookiecutter.project_slug }}/
│
├── .github/workflows/
│   └── ci.yml
│
│   # Contains the main source code files...
├── src/
│   │
│   │   # Unit tests...
│   ├── tests/
│   │   └── __init__.py
│   │
│   │   # `__version__` variable will be located here...
│   └── __init__.py
│
│   # Integrational tests that would require running your server(s)...
├── tests/
│   └── __init__.py
│
├── docs/
│   │   # A template C4 Mermaid diagram...
│   └── c4.md
│
├── requirements/
│   ├── dev.txt
│   └── prod.txt
│
├── scripts/
│   │   # Gunicorn + Uvicorn workers running template script
│   └── start.sh
│
├── deploy/
│   ├── Dockerfile.dev
│   ├── Dockerfile.prod
│   ├── docker-compose.dev.yml
│   └── docker-compose.prod.yml
│
│
├── .gitignore
├── .pre-commit-config.yml
└── pyproject.toml
```
