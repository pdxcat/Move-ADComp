
<#
    .Synopsis
    Moves a computer to the specified lab OU
    
    .Description
    The arguments for this script are the computer name to be moved, and the lab 
    to be moved to. The computer will then be moved to the specified lab OU. 
    Valid labs are: cadlab, intellab, mcaelab, teklab

    .Example
    move-adcomp.ps1 optimus teklab
    This will move the computer OPTIMUS to the ECE TEK Lab OU
#>


param( $computerName, $lab )

import-module activedirectory

# Finds the correct lab OU to put the computer into.
if ( $lab -eq "cadlab" ) {
    Get-ADComputer $computerName | Move-ADObject -targetpath "OU=CAD Lab,OU=CECS 2006,OU=Labs,OU=Supported,OU=CECS Machines,DC=ds,DC=cecs,DC=pdx,DC=edu"
    write-host -ForegroundColor green "$computerName moved to CAD Lab"
} elseif ( $lab -eq "intellab" ) {
    Get-ADComputer $computerName | Move-ADObject -targetpath "OU=Intel Lab,OU=CECS 2006,OU=Labs,OU=Supported,OU=CECS Machines,DC=ds,DC=cecs,DC=pdx,DC=edu"
    write-host -ForegroundColor green "$computerName moved to Intel Lab"
} elseif ( $lab -eq "mcaelab" ) {
    Get-ADComputer $computerName | Move-ADObject -targetpath "OU=MCAE Lab,OU=General 2006,OU=Labs,OU=Supported,OU=CECS Machines,DC=ds,DC=cecs,DC=pdx,DC=edu"
    write-host -ForegroundColor green "$computerName moved to MCAE Lab"
} elseif ( $lab -eq "teklab" ) {
    Get-ADComputer $computerName | Move-ADObject -targetpath "OU=ECE TEK Lab,OU=General 2006,OU=Labs,OU=Supported,OU=CECS Machines,DC=ds,DC=cecs,DC=pdx,DC=edu"
    write-host -ForegroundColor green "$computerName moved to ECE TEK Lab"
} else {
    #If the lab name is not valid, just display error message
    write-host -ForegroundColor red "Error: Not a valid lab name"
}