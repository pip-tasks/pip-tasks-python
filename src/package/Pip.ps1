########################################################
##
## Pip.ps1
## Pip.Tasks.Python - Python build tasks for Pip.Tasks
## Pip commands
##
#######################################################

function Install-Pip
{
<#
.SYNOPSIS

Installs Python module locally

.DESCRIPTION

Install-Pip installs Python module and make it available locally

.PARAMETER Path

Path to Pip project (default: .)

.EXAMPLE

PS> Install-Pip -Path .

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
        Invoke-At $Path {
            Invoke-External { 
                & pip install -e . 
            } "Install module with Pip failed"
        }
    }
    end {}
}


function Clear-PipDependencies
{
<#
.SYNOPSIS

Clears Pip dependencies

.DESCRIPTION

Clear-PipDependencies removed dependencies folder with npm dependencies

.PARAMETER Path

Path to Pip project (default: .)

.EXAMPLE

PS> Clear-PipDependencies -Path .

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
        Invoke-At $Path {
            Invoke-External { 
                    & pip uninstall -r requirements.txt -y
            } "Failed to clear Pip dependencies"
        }
    }
    end {}
}

function Install-PipDependencies
{
<#
.SYNOPSIS

Installs Pip dependencies

.DESCRIPTION

Install-PipDependencies installs Pip dependencies

.PARAMETER Path

Path to Pip project (default: .)

.EXAMPLE

PS> Install-PipDependencies -Path .

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
        Invoke-At $Path {
            if (Test-Path -Path 'requirements.txt')
            {
                Invoke-External { 
                    & pip install -r requirements.txt
                } "Failed to install Pip dependencies"
            }
        }
    }
    end {}
}


function Update-PipDependency
{
<#
.SYNOPSIS

Updates version of Pip dependency

.DESCRIPTION

Update-PipDependency updates version of Pip dependency specified by name

.PARAMETER Path

Path to Pip project (default: .)

.PARAMETER Dependency

Dependency name

.PARAMETER Version

Dependency version

.EXAMPLE

PS> Update-PipDependency -Path . -Dependency pip-services-commons -Version 1.0.*

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, Position=0, ValueFromPipelineByPropertyName=$true)]
        [string] $Path = '.',
        [Parameter(Mandatory=$false, Position=1, ValueFromPipelineByPropertyName=$true)]
        [string] $Dependency,
        [Parameter(Mandatory=$false, Position=2, ValueFromPipelineByPropertyName=$true)]
        [string] $Version
    )
    begin {}
    process 
    {
        if ($Dependency -eq $null -or $Dependency -eq '') { return }
        if ($Dependency.Contains('@'))
        {
            $pos = $Dependency.IndexOf('@')
            $Dependency = $Dependency.Substring(0, $pos)
            $Version = $Dependency.Substring($pos + 1)
        }

        # Todo: Complete this implementation later
    }
    end {}
}
