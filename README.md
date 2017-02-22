# <img src="https://github.com/pip-tasks/pip-tasks/raw/master/artifacts/logo.png" alt="Pip.Devs Logo" style="max-width:30%"> <br/> Python build tasks for Pip.Tasks

This Powershell module contains tasks for [Pip.Tasks](https://github.com/pip-tasks/pip-tasks) to build Python components

### Pip package management tasks

Python module configuration is stored in **conf.py** file in the root folder of the component.
Pip dependencies are stored in **requirements.txt** file in the root folder.

Pip tasks:
* **CleanDep** - cleans packages with Pip dependencies
* **InstallDep** - downloads Pip dependencies 
* **UpdateDep** - updates dependency to specified version
  - **Dependency** - dependency name parameter
  - **Version** - dependency version parameter

Pip configuration variables:
* **Package** - Turn on Pip tasks (must be 'pip')

### Python build and run tasks

Python tasks
* **Clean** - cleans Python projects
* **Build** - compiles Python projects
* **Rebuild** - rebuilds Python projects (cleans and builds)
* **Start** - runs projects with Python (python ...)

Python configuration variables:
* **Build** - Turn on Python build tasks (must be 'python')
* **Run** - Turn on Python run tasks (must be 'python')

### PyTest test tasks

PyTest configuration is defined in **setup.cfg** file in the root folder of the component.

PyTest tasks:
* **Test** - executes tests with Pytest

PyTest configuration variables:
* **Test** - Turns on PyTest tasks (must be 'pytest')
* **TestInclude** - Folder or list of folders or files with PyTest tests

## Installation

* Checkout **pip-tasks** and **pip-tasks-python** modules
* Add folder with the modules to **PSModulePath**
* Import **pip-tasks-python** module. **pip-tasks** will be imported automatically

## Usage

Let's say you have a Python component which is tested with PyTest.

The file structure may look the following:
```bash
/workspace
  ...
  /component1
    /mymodule
    /test
    component.conf.ps1
    conf.py
    requirements.txt
    setup.cfg
```

**component.conf.ps1** file:
```powershell
$VersionControl = 'git'
$Package = 'pip'
$Build = 'python'
$Document = 'none'

$Test = 'pytest'
$TestInclude = './test'

$Deploy = 'none'
$Run = 'none'
```

A typical scenario to work with this component may include the following steps:

* Pull changes from Git repository
```powershell
> Invoke-Task -Task Pull -Component component1
```

* Install npm packages
```powershell
> Invoke-Task -Task InstallDep -Component component1
```

* Test component with PyTest
```powershell
> Invoke-Task -Task Test -Component component1
```

* Change version of external dependency
```powershell
> Invoke-Task -Task UpdateDep -Dependency component2 -Version 1.2.0 -Component component1
```

* Set new version for the component and push changes to Git repository
```powershell
> Invoke-Task -Task SetVersion -Version 1.0.1 -Component component1
> Invoke-Task -Task Push -Message "My changes" -Component component1
```

* Set tag to Git repository and publish public release
```powershell
> Invoke-Task -Task SetTag v1.0.1 -Component component1
> Invoke-Task -Task Publish -Component component1
```

Instead of typing full Powershell command 
```powershell
> Invoke-Task -Task getchanges -Component component1
```
you can use shortcuts like:
```powershell
> piptask getchanges
```

For more information about **Pip.Tasks** build infrastructure read documentation 
from the master project [here...](https://github.com/pip-tasks/pip-tasks)

## Acknowledgements

This module created and maintained by **Sergey Seroukhov**.
