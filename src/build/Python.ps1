########################################################
##
## Python.ps1
## Pip.Tasks.Python - Python build tasks for Pip.Tasks
## Python commands
##
#######################################################


function Clear-PythonBuild
{
<#
.SYNOPSIS

Clears Python project

.DESCRIPTION

Clear-PythonBuild clears Python project build

.PARAMETER Path

Path to Python project (default: .)

.EXAMPLE

PS> Clear-PythonBuild -Path .

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, Position=0, ValueFromPipelineByPropertyName=$true)]
        [string] $Path = '.'
    )
    begin {}
    process 
    {
        # Clean directories
        $fs = Get-ChildItem -Path . -Include '.cache', '*.egg-info', '__pycache__' -Recurse
        foreach ($f in $fs)
        {
            Remove-Item -Path $f.FullName -Recurse -Force
        }

        # Clean compiled files
        $fs = Get-ChildItem -Path . -Include '*.pyc' -Recurse
        foreach ($f in $fs)
        {
            Remove-Item -Path $f.FullName -Force
        }
    }
    end {}
}


function Invoke-PythonBuild
{
<#
.SYNOPSIS

Builds Python project

.DESCRIPTION

Invoke-Python builds Python project in specified configuration

.PARAMETER Path

Path to Python project (default: .)

.EXAMPLE

PS> Invoke-PythonBuild -Path .

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, Position=0, ValueFromPipelineByPropertyName=$true)]
        [string] $Path = '.'
    )
    begin {}
    process 
    {
        # Do nothing...
    }
    end {}
}


function Invoke-PythonRebuild
{
<#
.SYNOPSIS

Rebuilds Python project

.DESCRIPTION

Invoke-Python rebuilds Python project in specified configuration

.PARAMETER Path

Path to Python project (default: .)

.EXAMPLE

PS> Invoke-PythonRebuild -Path .

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, Position=0, ValueFromPipelineByPropertyName=$true)]
        [string] $Path = '.'
    )
    begin {}
    process 
    {
        Clear-PythonBuild -Path $Path
        Invoke-PythonBuild -Path $Path
    }
    end {}
}
