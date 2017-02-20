# <img src="https://github.com/pip-tasks/pip-tasks-ps/raw/master/artifacts/logo.png" alt="Pip.Devs Logo" style="max-width:30%"> <br/> Python build tasks for Pip.Tasks

This Powershell module brings tasks for Pip.Tasks to build Python components

**Pip** tasks turned on by property **$Package = 'pip'**
* **CleanDep** - cleans packages with Pip dependencies
* **RestoreDep** - downloads Pip packages references by projects 
* **UpdateDep** - updates selected package or all packages from specified source to the latest compatible version

**Python** tasks turned on by properties **$Build = 'python'** and **$Run = 'python'**
* **Clean** - cleans Python projects
* **Build** - compiles Python projects
* **Rebuild** - rebuilds Python projects (cleans and builds)
* **Start** - runs projects with Python (python ...)

**Pytest** tasks turned on by property **$Test = 'pytest'**
* **Test** - executes tests with Pytest

## Installation

* Checkout **pip-tasks-ps** and **pip-tasks-python-ps** modules
* Add folder with the modules to **PSModulePath**
* Import **pip-tasks-python-ps** module. **pip-tasks-ps** will be imported automatically

## Usage

TBD...

## Acknowledgements

This module created and maintained by **Sergey Seroukhov**.
