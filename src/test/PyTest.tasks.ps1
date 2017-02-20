########################################################
##
## PyTest.tasks.ps1
## Pip.Tasks.Python - Python build tasks for Pip.Tasks
## Python test tasks
##
#######################################################

# Set correct path when invoked from other scripts
$BuildRoot = $BuildPath

# Synopsis: Tests Python project using PyTest
task PyTest {
    Invoke-PyTest -Path . -Include $TestInclude
}
