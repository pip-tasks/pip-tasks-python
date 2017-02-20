########################################################
##
## pip-tasks-python-ps.psm1
## Pip.Tasks.Python - Python build tasks for Pip.Tasks
## Startup module
##
#######################################################

$path = $PSScriptRoot
if ($path -eq "") { $path = "." }

. "$path\src\package\Pip.ps1"
. "$path\src\build\Python.ps1"
. "$path\src\test\Pytest.ps1"

. "$path\src\package\Package.registrations.ps1"
. "$path\src\build\Build.registrations.ps1"
. "$path\src\test\Test.registrations.ps1"
