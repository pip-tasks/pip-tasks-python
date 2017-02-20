########################################################
##
## Python.tasks.ps1
## Pip.Tasks.Python - Python build tasks for Pip.Tasks
## Common build tasks
##
#######################################################

# Set correct path when invoked from other scripts
$BuildRoot = $BuildPath

# Synopsis: Clears Python project
task PythonClean {
    Clear-PythonBuild -Path .
}

# Synopsis: Builds Python project
task PythonBuild {
    Invoke-PythonBuild -Path .
}

# Synopsis: Rebuilds Python project
task PythonRebuild {
    Invoke-PythonRebuild -Path .
}
