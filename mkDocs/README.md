# MkDocs
MkDocs is a fast, simple and downright gorgeous static site generator that's geared towards building project documentation. Documentation source files are written in Markdown, and configured with a single YAML configuration file. Start by reading the introductory tutorial, then check the User Guide for more information. (https://www.mkdocs.org/)

### Instalation
```
apt update && apt install mkdocs -y
```
### Create new project
```
mkdocs new my-project
cd my-project
```
### Show the project on a http server (http://127.0.0.1:8000)
```
mkdocs serve
```
### To add new pages just edit the tags on mkdocs.yml like this
```
site_name: My Project
pages:
    - Home: index.md
    - About: about.md
```
### To build the site (the follow command will create the directory site that can be pushed to github-pages, for example) 
```
mkdocs build
```
### All documentation can be reach on https://www.mkdocs.org/
