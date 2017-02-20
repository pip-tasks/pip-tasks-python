########################################################
##
## PyTest.ps1
## Pip.Tasks.Python - Python build tasks for Pip.Tasks
## PyTest commands
##
#######################################################

function Invoke-PyTest
{
<#
.SYNOPSIS

Runs PyTest to test project

.DESCRIPTION

Invoke-PyTest executes PyTest tests

.PARAMETER Path

Path to Python project (default: .)

.PARAMETER Include

List of test folders (default: none)

.EXAMPLE

PS> Invoke-PyTest -Path .

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, Position=0, ValueFromPipelineByPropertyName=$true)]
        [string] $Path = '.',
        [Parameter(Mandatory=$false, Position=1, ValueFromPipelineByPropertyName=$true)]
        [string[]] $Include = @()
    )
    begin {}
    process 
    {
        Invoke-At $Path {
            Invoke-External { 
                & py.test -s $Include
            } "Running PyTest test failed"
        }
    }
    end {}
}
