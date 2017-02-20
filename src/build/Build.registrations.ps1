########################################################
##
## Build.registrations.ps1
## Pip.Tasks.Python - Python build tasks for Pip.Tasks
## Registrations for build tasks 
##
#######################################################

$pytasks = "$PSScriptRoot/Python.tasks.ps1"

# Registrations for imperative tasks
Register-ImperativeInclude -CallFile $pytasks -Component

# Registrations for declarative tasks
Register-DeclarativeTask -Task Clean -Variable Build -Value python -CallFile $pytasks -CallTask PythonClean -Component
Register-DeclarativeTask -Task Build -Variable Build -Value python -CallFile $pytasks -CallTask PythonBuild -Component
Register-DeclarativeTask -Task Rebuild -Variable Build -Value python -CallFile $pytasks -CallTask PythonRebuild -Component
