########################################################
##
## Pip.tasks.ps1
## Pip.Tasks.Python - Python build tasks for Pip.Tasks
## Pip build tasks
##
#######################################################

# Set correct path when invoked from other scripts
$BuildRoot = $BuildPath

# Synopsis: Installs Pip project
task PipInstall {
    Install-Pip -Path .
}

# Synopsis: Clears nuget dependencies
task PipCleanDep {
    Clear-PipDependencies -Path .
}

# Synopsis: Install nuget dependencies
task PipInstallDep {
    Install-PipDependencies -Path .
}

# Synopsis: Update nuget dependency
task PipUpdateDep {
    Update-PipDependency -Path . -Dependency $Dependency -Version $Version
}
