########################################################
##
## Test.registrations.ps1
## Pip.Tasks.Python - Python build tasks for Pip.Tasks
## Registrations for test tasks 
##
#######################################################

$pytasks = "$PSScriptRoot/PyTest.tasks.ps1"

# Registrations for imperative tasks
Register-ImperativeInclude -CallFile $pytasks -Component

# Registrations for declarative tasks
Register-DeclarativeTask -Task Test -Variable Test -Value pytest -CallFile $pytasks -CallTask PyTest -Component
