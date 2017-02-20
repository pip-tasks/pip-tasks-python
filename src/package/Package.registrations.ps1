########################################################
##
## Package.registrations.ps1
## Pip.Tasks.Java - Java build tasks for Pip.Tasks
## Registrations for package management tasks 
##
#######################################################

$piptasks= "$PSScriptRoot/Pip.tasks.ps1"

# Registrations for imperative tasks
Register-ImperativeInclude -CallFile $piptasks -Component

# Registrations for declarative tasks
Register-DeclarativeTask -Task Install -Variable Package -Value pip -CallFile $piptasks -CallTask PipInstall -Component
Register-DeclarativeTask -Task CleanDep -Variable Package -Value pip -CallFile $piptasks -CallTask PipCleanDep -Component
Register-DeclarativeTask -Task RestoreDep -Variable Package -Value pip -CallFile $piptasks -CallTask PipRestoreDep -Component
Register-DeclarativeTask -Task UpdateDep -Variable Package -Value pip -CallFile $piptasks -CallTask PipUpdateDep -Component
