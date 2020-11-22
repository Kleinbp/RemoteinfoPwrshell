#Script by Philip Kleinberg

#Computer names that you are pulling info from
$Computernames = 'Computername0' , 'Computername1'

#This runs the below commands on the target computers in $Computernames
Invoke-command -ComputerName $Computernames -ScriptBlock {

#Items of information that is being pulled from each computer in $Computernames
$ComputerName = Get-WmiObject -Class Win32_Computersystem
$computername.pscomputername
$ComputerInfo.Biosseralnumber
$IP.Ipv4Address.Ipaddress
$computerinfo = Get-ComputerInfo
$Computerinfo.windowsbuildlabex
$Computerinfo.windowsversion
$NetworkAdapterinfo = Get-NetAdapter -Name *
NetworkadapterInfo.interfacedescription
$Networkadapterinfo.MacAddress
$NetworkAdapterinfo.LinkSpeed
$Listofusers.name
#$Listofusers.lastaccesstime
$IP = Get-NetIPConfiguration -detailed
$Ip.DNSserver.Serveraddresses
$Outputfile = 'C:\Users\public\Documents\Output.csv'

#Formatting the info for the CSV
$Output = New-Object -TypeName PSobject
$output | Add-Member -MemberType NoteProperty -Name 'Computer Name' -Value
$ComputerName.PScomputername

$output | Add-Member -MemberType NoteProperty -Name 'Serial Number' -Value
$ComputerInfo.BiosSeralNumber

$output | Add-Member -MemberType NoteProperty -Name 'IP Address' -Value
$IP.IPv4Address.IPaddress

$output | Add-Member -MemberType NoteProperty -Name 'Build Version' -Value
$Computerinfo.WindowsBuildLabex

$output | Add-Member -MemberType NoteProperty -Name 'Windows Version' -Value
$Computerinfo.windowsversion

$output | Add-Member -MemberType NoteProperty -Name 'Network Interface' -Value
$NetworkAdapterinfo.InferfaceDescription

$output | Add-Member -MemberType NoteProperty -Name 'MAC' -Value
$NetworkAdapterinfo.MacAddress

$output | Add-Member -MemberType NoteProperty -Name 'Inferface Speed' -Value
$NetworkAdapterinfo.Linkspeed

$output | Add-Member -MemberType NoteProperty -Name 'Users w/ profile on system' -Value
$Listofusers.name

$output | Add-Member -MemberType NoteProperty -Name 'DNS Servers' -Value
$IP.DNSSERVER.Serveraddress

#Outputting the pulled info into a CSV
$Output | ConverTo-CSV -NoTypeInformation | out-file $Outputfile -Append
}

ForEach ($CName in $Computernames) {Move-Item -Path \\$CName\C$\Users\Public\Documents\Output.csv -Destination C:\Users\Public\Documents\$CName' Output'.csv}

